import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:synope_flutter_app/books/book_one_resources.dart';
import 'package:synope_flutter_app/books/book_two_resources.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Synope audio app',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AudioServiceWidget(child: BookSelectionScreen()),
    );
  }
}

class BookSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List<MediaItem> _items = getFirstBookItems()

    return Scaffold(
        appBar: AppBar(
          title: const Text('Synope audio lessons'),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "More books coming soon!",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20,
                ),
              )),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                Book book = getBookByIndex(index);
                return Container(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      FlatButton(
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 30),
                            child: Image(
                              image: AssetImage(book.imagePath),
                              fit: BoxFit.cover,
                            )),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) {
                                  // return BookAudioTracksScreen();
                                  return BookAudioTracksScreen(book);
                                }),
                          );
                        },
                      ),
                      Container(
                        color: Colors.black.withOpacity(0.5),
                        height: 30,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            book.label,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Regular'),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ]));
  }

  Book getBookByIndex(int index) {
    Book book;
    switch (index) {
      case 0:
        book = Book(1, getFirstBookItems(), "På vej til dansk", "assets/book_pv_cover.jpg");
        break;
      case 1:
        book = Book(2, getSecondBookItems(), "Videre mod dansk", "assets/book_vmd_cover.jpg");
        break;
    }
    return book;
  }
}

class Book {
  final int number;
  final List<MediaItem> items;
  final String label;
  final String imagePath;

  Book(this.number, this.items, this.label, this.imagePath);
}

class BookAudioTracksScreen extends StatefulWidget {
  final Book book;

  BookAudioTracksScreen(this.book);

  BookAudioTrackState createState() => BookAudioTrackState(book);
}

class BookAudioTrackState extends State<BookAudioTracksScreen>
    with TickerProviderStateMixin {
  final Book book;

  BookAudioTrackState(this.book);

  /// A stream reporting the combined state of the current media item and its
  /// current position.
  Stream<MediaState> get _mediaStateStream =>
      Rx.combineLatest2<MediaItem, Duration, MediaState>(
          AudioService.currentMediaItemStream,
          AudioService.positionStream,
          (mediaItem, position) => MediaState(mediaItem, position));

  /// A stream reporting the combined state of the current queue and the current
  /// media item within that queue.
  Stream<QueueState> get _queueStateStream =>
      Rx.combineLatest2<List<MediaItem>, MediaItem, QueueState>(
          AudioService.queueStream,
          AudioService.currentMediaItemStream,
          (queue, mediaItem) => QueueState(queue, mediaItem));

  Stream<ControlButtonsState> get _controlButtonsStateStream =>
      Rx.combineLatest2<QueueState, PlaybackState, ControlButtonsState>(
          _queueStateStream,
          AudioService.playbackStateStream,
          (queue, playback) => ControlButtonsState(queue, playback));

  IconButton playButton() => IconButton(
        icon: Icon(Icons.play_arrow),
        iconSize: 48.0,
        onPressed: AudioService.play,
      );

  IconButton pauseButton() => IconButton(
        icon: Icon(Icons.pause),
        iconSize: 48.0,
        onPressed: AudioService.pause,
      );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Synope audio lessons'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.separated(
                  itemCount: book.items.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    var track = book.items[index];
                    String title = track.title;
                    int idx = track.title.indexOf("-");
                    final lessonTitle = title.substring(0, idx).trim();
                    final lessonName = title.substring(idx + 1).trim();
                    final duration = getDuration(track);
                    return ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      leading: Icon(Icons.audiotrack, color: Colors.red),
                      title: Text(lessonTitle + " (" + duration + ")"),
                      subtitle: Text(lessonName),
                      onTap: () {
                        if (AudioService.running) {
                          AudioService.playMediaItem(track);
                        } else {
                          AudioService.start(
                              backgroundTaskEntrypoint:
                                  _audioPlayerTaskEntrypoint,
                              androidNotificationChannelName:
                                  'Synope audio lessons',
                              // Enable this if you want the Android service to exit the foreground state on pause.
                              // androidStopForegroundOnPause: true,
                              androidNotificationColor: 0xFF2196f3,
                              androidNotificationIcon: 'mipmap/ic_launcher',
                              androidEnableQueue: true,
                              params: {
                                "trackId": track.id,
                                "bookNumber": book.number
                              });
                        }
                      },
                    );
                  }),
            ),
            AnimatedSize(
              vsync: this,
              duration: new Duration(milliseconds: 150),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                child: Center(
                  child: StreamBuilder<bool>(
                    stream: AudioService.runningStream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.active) {
                        // Don't show anything until we've ascertained whether or not the
                        // service is running, since we want to show a different UI in
                        // each case.
                        return SizedBox();
                      }
                      final running = snapshot.data ?? false;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (!running) ...[
                            // UI to show when we're not running, i.e. a menu.
                            // audioPlayerButton()
                            Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  "Select item to play",
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 20,
                                  ),
                                )),
                          ] else ...[
                            // UI to show when we're running, i.e. player state/controls.

                            // Queue display/controls.
                            StreamBuilder<QueueState>(
                              stream: _queueStateStream,
                              builder: (context, snapshot) {
                                final queueState = snapshot.data;
                                final mediaItem = queueState?.mediaItem;
                                String title;
                                if (mediaItem?.title != null) {
                                  title = mediaItem.title;
                                } else {
                                  title = "...";
                                }
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                            icon: Icon(Icons.close),
                                            onPressed: AudioService.stop),
                                        Row(
                                          children: [
                                            Text(
                                              "Speed:",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: SpeedSelectorWidget())
                                          ],
                                        )
                                      ],
                                    ),
                                    Text(title),
                                  ],
                                );
                              },
                            ),
                            // Play/pause/stop buttons.
                            StreamBuilder<ControlButtonsState>(
                              stream: _controlButtonsStateStream.distinct(),
                              builder: (context, snapshot) {
                                final playing =
                                    snapshot?.data?.playbackState?.playing ??
                                        false;
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: SvgPicture.asset(
                                        'assets/rewind-5.svg',
                                        width: 32.0,
                                        height: 32.0,
                                      ),
                                      iconSize: 64.0,
                                      onPressed: () {
                                        AudioService.rewind();
                                      },
                                    ),
                                    if (playing) pauseButton() else playButton(),
                                    IconButton(
                                        icon: SvgPicture.asset(
                                          'assets/fast-forward-5.svg',
                                          width: 32.0,
                                          height: 32.0,
                                        ),
                                        iconSize: 64.0,
                                        onPressed: () {
                                          AudioService.fastForward();
                                        }),
                                  ],
                                );
                              },
                            ),
                            // A seek bar.
                            StreamBuilder<MediaState>(
                              stream: _mediaStateStream,
                              builder: (context, snapshot) {
                                final mediaState = snapshot.data;
                                return SeekBar(
                                  duration: mediaState?.mediaItem?.duration ??
                                      Duration.zero,
                                  position: mediaState?.position ?? Duration.zero,
                                  onChangeEnd: (newPosition) {
                                    AudioService.seekTo(newPosition);
                                  },
                                );
                              },
                            ),
                            // Display the processing state.
                            StreamBuilder<AudioProcessingState>(
                              stream: AudioService.playbackStateStream
                                  .map((state) => state.processingState)
                                  .distinct(),
                              builder: (context, snapshot) {
                                final processingState =
                                    snapshot.data ?? AudioProcessingState.none;
                                Color texColor;
                                if (kReleaseMode) {
                                  texColor = Colors.white;
                                } else {
                                  texColor = Colors.grey;
                                }

                                return Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      "Processing state: ${describeEnum(processingState)}",
                                      style: TextStyle(
                                          fontSize: 12, color: texColor),
                                    ));
                              },
                            ),
                          ],
                        ],
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (AudioService.running) {
      return (await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('Are you sure?'),
          content: new Text('Navigation back to books list will stop the playback.'),
          actions: <Widget>[
            new FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('No'),
            ),
            new FlatButton(
              onPressed: () {
                AudioService.stop();
                Navigator.of(context).pop(true);
              },
              child: new Text('Yes'),
            ),
          ],
        ),
      )) ?? false;
    } else {
      Navigator.of(context).pop(true);
      return false;
    }


  }

  String getDuration(MediaItem track) {
    return RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
            .firstMatch("${track.duration}")
            ?.group(1) ??
        '${track.duration}';
  }
}

class SpeedSelectorWidget extends StatefulWidget {
  SpeedSelectorWidget({Key key}) : super(key: key);

  @override
  _SpeedSelectorWidgetState createState() => _SpeedSelectorWidgetState();
}

class _SpeedSelectorWidgetState extends State<SpeedSelectorWidget> {
  String dropdownValue = '1x';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.blue),
      underline: Container(
        height: 2,
        color: Colors.blueAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          switch (newValue) {
            case '1x':
              {
                AudioService.setSpeed(1);
              }
              break;
            case '0.9x':
              {
                AudioService.setSpeed(0.9);
              }
              break;
            case '0.8x':
              {
                AudioService.setSpeed(0.8);
              }
              break;
            case '0.7x':
              {
                AudioService.setSpeed(0.7);
              }
              break;
            case '0.6x':
              {
                AudioService.setSpeed(0.6);
              }
              break;
            case '0.5x':
              {
                AudioService.setSpeed(0.5);
              }
              break;
          }
          dropdownValue = newValue;
        });
      },
      items: <String>['1x', '0.9x', '0.8x', '0.7x', '0.6x', '0.5x']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class QueueState {
  final List<MediaItem> queue;
  final MediaItem mediaItem;

  QueueState(this.queue, this.mediaItem);
}

class ControlButtonsState {
  final QueueState queueState;
  final PlaybackState playbackState;

  ControlButtonsState(this.queueState, this.playbackState);
}

class MediaState {
  final MediaItem mediaItem;
  final Duration position;

  MediaState(this.mediaItem, this.position);
}

class SeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final ValueChanged<Duration> onChanged;
  final ValueChanged<Duration> onChangeEnd;

  SeekBar({
    @required this.duration,
    @required this.position,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double _dragValue;
  bool _dragging = false;

  @override
  Widget build(BuildContext context) {
    final value = min(_dragValue ?? widget.position?.inMilliseconds?.toDouble(),
        widget.duration.inMilliseconds.toDouble());
    if (_dragValue != null && !_dragging) {
      _dragValue = null;
    }
    return Stack(
      children: [
        Slider(
          min: 0.0,
          max: widget.duration.inMilliseconds.toDouble(),
          value: value,
          onChanged: (value) {
            if (!_dragging) {
              _dragging = true;
            }
            setState(() {
              _dragValue = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged(Duration(milliseconds: value.round()));
            }
          },
          onChangeEnd: (value) {
            if (widget.onChangeEnd != null) {
              widget.onChangeEnd(Duration(milliseconds: value.round()));
            }
            _dragging = false;
          },
        ),
        Positioned(
          right: 16.0,
          bottom: 0.0,
          child: Text(
              RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                      .firstMatch("$_remaining")
                      ?.group(1) ??
                  '$_remaining',
              style: Theme.of(context).textTheme.caption),
        ),
        Positioned(
          left: 16.0,
          bottom: 0.0,
          child: Text(
              RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                      .firstMatch("${widget.position}")
                      ?.group(1) ??
                  '${widget.position}',
              style: Theme.of(context).textTheme.caption),
        ),
      ],
    );
  }

  Duration get _remaining => widget.duration - widget.position;
}

// NOTE: Your entrypoint MUST be a top-level function.
void _audioPlayerTaskEntrypoint() async {
  AudioServiceBackground.run(() => AudioPlayerTask());
}

class AudioPlayerTask extends BackgroundAudioTask {
  AudioPlayer _player = new AudioPlayer();
  AudioProcessingState _skipState;
  Seeker _seeker;
  StreamSubscription<PlaybackEvent> _eventSubscription;

  List<MediaItem> items;
  List<MediaItem> get queue => items;

  int get index => _player.currentIndex;

  MediaItem get mediaItem => index == null ? null : queue[index];

  @override
  Future<void> onStart(Map<String, dynamic> params) async {
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    // Broadcast media item changes.
    _player.currentIndexStream.listen((index) {
      if (index != null) AudioServiceBackground.setMediaItem(queue[index]);
    });
    // Propagate all events from the audio player to AudioService clients.
    _eventSubscription = _player.playbackEventStream.listen((event) {
      _broadcastState();
    });
    // Special processing for state transitions.
    _player.processingStateStream.listen((state) {
      switch (state) {
        case ProcessingState.completed:
          // In this example, the service stops when reaching the end.
          onStop();
          break;
        case ProcessingState.ready:
          // If we just came from skipping between tracks, clear the skip
          // state now that we're ready to play.
          _skipState = null;
          break;
        default:
          break;
      }
    });

    try {
      switch (params["bookNumber"]) {
        case 1:
          items = getFirstBookItems();
          break;
        case 2:
          items = getSecondBookItems();
          break;
      }

      // Load and broadcast the queue
      AudioServiceBackground.setQueue(queue);
      await _player.load(ConcatenatingAudioSource(
        children:
            queue.map((item) => AudioSource.uri(Uri.parse(item.id))).toList(),
      ));
      String firstItemId = params["trackId"];
      MediaItem trackToPlay =
          queue.firstWhere((element) => element.id == firstItemId);
      onPlayFromMediaId(trackToPlay.id);
    } catch (e) {
      print("Error: $e");
      onStop();
    }
  }

  @override
  Future<void> onSkipToQueueItem(String mediaId) async {
    // Then default implementations of onSkipToNext and onSkipToPrevious will
    // delegate to this method.
    final newIndex = queue.indexWhere((item) => item.id == mediaId);
    if (newIndex == -1) return;
    // During a skip, the player may enter the buffering state. We could just
    // propagate that state directly to AudioService clients but AudioService
    // has some more specific states we could use for skipping to next and
    // previous. This variable holds the preferred state to send instead of
    // buffering during a skip, and it is cleared as soon as the player exits
    // buffering (see the listener in onStart).
    _skipState = newIndex > index
        ? AudioProcessingState.skippingToNext
        : AudioProcessingState.skippingToPrevious;
    // This jumps to the beginning of the queue item at newIndex.
    _player.seek(Duration.zero, index: newIndex);
  }

  @override
  Future<void> onPlay() => _player.play();

  @override
  Future<void> onPause() => _player.pause();

  @override
  Future<void> onSeekTo(Duration position) => _player.seek(position);

  @override
  Future<void> onFastForward() => _seekRelative(Duration(seconds: 5));

  @override
  Future<void> onSetSpeed(double speed) => _player.setSpeed(speed);

  @override
  Future<void> onRewind() => _seekRelative(-Duration(seconds: 5));

  @override
  Future<void> onSeekForward(bool begin) async => _seekContinuously(begin, 1);

  @override
  Future<void> onSeekBackward(bool begin) async => _seekContinuously(begin, -1);

  @override
  Future<void> onPlayMediaItem(MediaItem mediaItem) {
    int newIndex = queue.indexOf(mediaItem);
    _player.seek(Duration.zero, index: newIndex);
    _player.play();
  }

  @override
  Future<void> onPlayFromMediaId(String mediaId) {
    MediaItem trackToPlay =
        queue.firstWhere((element) => element.id == mediaId);
    int newIndex = queue.indexOf(trackToPlay);
    _player.seek(Duration.zero, index: newIndex);
    _player.play();
  }

  @override
  Future<void> onStop() async {
    await _player.pause();
    await _player.dispose();
    _eventSubscription.cancel();
    // It is important to wait for this state to be broadcast before we shut
    // down the task. If we don't, the background task will be destroyed before
    // the message gets sent to the UI.
    await _broadcastState();
    // Shut down this task
    await super.onStop();
  }

  /// Jumps away from the current position by [offset].
  Future<void> _seekRelative(Duration offset) async {
    var newPosition = _player.position + offset;
    // Make sure we don't jump out of bounds.
    if (newPosition < Duration.zero) newPosition = Duration.zero;
    if (newPosition > mediaItem.duration) newPosition = mediaItem.duration;
    // Perform the jump via a seek.
    await _player.seek(newPosition);
  }

  /// Begins or stops a continuous seek in [direction]. After it begins it will
  /// continue seeking forward or backward by 10 seconds within the audio, at
  /// intervals of 1 second in app time.
  void _seekContinuously(bool begin, int direction) {
    _seeker?.stop();
    if (begin) {
      _seeker = Seeker(_player, Duration(seconds: 10 * direction),
          Duration(seconds: 1), mediaItem)
        ..start();
    }
  }

  /// Broadcasts the current state to all clients.
  Future<void> _broadcastState() async {
    await AudioServiceBackground.setState(
      controls: [
        MediaControl.skipToPrevious,
        if (_player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.stop,
        MediaControl.skipToNext,
      ],
      systemActions: [
        MediaAction.seekTo,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      ],
      androidCompactActions: [0, 1, 3],
      processingState: _getProcessingState(),
      playing: _player.playing,
      position: _player.position,
      bufferedPosition: _player.bufferedPosition,
      speed: _player.speed,
    );
  }

  /// Maps just_audio's processing state into into audio_service's playing
  /// state. If we are in the middle of a skip, we use [_skipState] instead.
  AudioProcessingState _getProcessingState() {
    if (_skipState != null) return _skipState;
    switch (_player.processingState) {
      case ProcessingState.none:
        return AudioProcessingState.stopped;
      case ProcessingState.loading:
        return AudioProcessingState.connecting;
      case ProcessingState.buffering:
        return AudioProcessingState.buffering;
      case ProcessingState.ready:
        return AudioProcessingState.ready;
      case ProcessingState.completed:
        return AudioProcessingState.completed;
      default:
        throw Exception("Invalid state: ${_player.processingState}");
    }
  }
}

/// Provides access to a library of media items. In your app, this could come
/// from a database or web service.
class MediaLibrary {
  final _items = <MediaItem>[
    MediaItem(
      id: "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3",
      album: "Science Friday",
      title: "A Salute To Head-Scratching Science",
      artist: "Science Friday and WNYC Studios",
      duration: Duration(milliseconds: 5739820),
      artUri:
          "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
    ),
    MediaItem(
      id: "https://s3.amazonaws.com/scifri-segments/scifri201711241.mp3",
      album: "Science Friday",
      title: "From Cat Rheology To Operatic Incompetence",
      artist: "Science Friday and WNYC Studios",
      duration: Duration(milliseconds: 2856950),
      artUri:
          "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
    ),
  ];

  List<MediaItem> get items => _items;
}

/// An object that performs interruptable sleep.
class Sleeper {
  Completer _blockingCompleter;

  /// Sleep for a duration. If sleep is interrupted, a
  /// [SleeperInterruptedException] will be thrown.
  Future<void> sleep([Duration duration]) async {
    _blockingCompleter = Completer();
    if (duration != null) {
      await Future.any([Future.delayed(duration), _blockingCompleter.future]);
    } else {
      await _blockingCompleter.future;
    }
    final interrupted = _blockingCompleter.isCompleted;
    _blockingCompleter = null;
    if (interrupted) {
      throw SleeperInterruptedException();
    }
  }

  /// Interrupt any sleep that's underway.
  void interrupt() {
    if (_blockingCompleter?.isCompleted == false) {
      _blockingCompleter.complete();
    }
  }
}

class SleeperInterruptedException {}

class Seeker {
  final AudioPlayer player;
  final Duration positionInterval;
  final Duration stepInterval;
  final MediaItem mediaItem;
  bool _running = false;

  Seeker(
    this.player,
    this.positionInterval,
    this.stepInterval,
    this.mediaItem,
  );

  start() async {
    _running = true;
    while (_running) {
      Duration newPosition = player.position + positionInterval;
      if (newPosition < Duration.zero) newPosition = Duration.zero;
      if (newPosition > mediaItem.duration) newPosition = mediaItem.duration;
      player.seek(newPosition);
      await Future.delayed(stepInterval);
    }
  }

  stop() {
    _running = false;
  }
}
