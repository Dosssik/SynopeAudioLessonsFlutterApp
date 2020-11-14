from moviepy.audio.io.AudioFileClip import AudioFileClip

for x in range(1, 99):
    number = ""
    if x < 10:
        number = "0" + str(x)
    else:
        number = str(x)
    url = 'http://www.synope.dk/mp3/pv/' + number + '.mp3'
    audiofile = AudioFileClip(url)

    print("MediaItem(")
    print("     id: " + '"' + url + '",')
    print('     album: "På vej til dansk",')
    print('     title: "TODO",')
    print('     duration: Duration(seconds: ' + str(int(audiofile.duration)) + ')')
    print("),")
