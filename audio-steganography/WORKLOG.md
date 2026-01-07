# Work Log

## GROUP MEMBER 1: Anna Shrestha

### Wed, 5/22

Start on outline of project(create branches, processing sketches) and begin researching implementation of audio steganography and file types. Notes/planning document: https://docs.google.com/document/d/1oLgrYbuv7iW_9uCib4jDbt9lGG-MdMGzmmYyTHb14_0/edit.

### Thu, 5/23

Do more research on Audacity (how to view frequency) and try to get encoded audio to test decoder. Look through Java's AudioSystem and Processing's Sound library. Outline of decode started, need to research bitrates/byte arrays/spectrograms.

### Fri, 5/24

Attempt to start decode using java's audio manipulation commands. Trying to change frequency to hide at inaudible frequencies and use least sig bit encoding but confused by bitrate and the number of bits in a second-which bit do we encode in?? Looking through AudioInputStream, FloatControl, and the Discrete/Fast Fourier Transform. Also researched pulse-code modulation (PCM) encoding --> lossless compression method (bitstream is lossy).

### Sun, 5/26

Start working on video script (background about audio steganography and spectrograms).

### Tue, 5/27

Did more research on lsb audio steganography, attempted to use Python's wav module to manipulate audio bytes. Realized we could use Files.readAllBytes(*Path*) to get bytes[]... We didn't need something specific to an audio file, and we can deal with frequency as an extra portion after we finish the rest. Decryption version 1 completed, tests needed to be run(find encrypting tools online).

### Wed, 5/29

Start testing decode (difficult without encode / terminating string). Steghide didn't have the terminating string so manually added it using hexdump. Moved to normal java file because Processing had file not found error. Realized loadBytes() was for all general files, and will be moving back into Processing and continuing tests.

### Thu, 5/30

Continue testing decode, had to manually create encrypted files since encoder was incomplete and online tools didn't have terminating digits or seemed to be working. However, by the end of class encoder was completed and normal testing can resume. Results were consistent with encrypted messages except the last letter which is missing, and didn't stop at the terminating value because it was not encrypted yet. Will consider creating a similar function for mp3 since it's easier to find mp3 files(header length differs). Beginning testing on encrypted files(txt, png, wav) especially other audio files. Also looked over encode and tried to find the issue causing encrypted audio to lose half of its length despite having the same number of bytes and proper header and tail (likely because of mp3 being lossy, wav files worked).

### Fri, 5/31

More testing with encoded files; invalid output despite working with previously encoded files. Encoding issue with mp3 still has not been fixed, attempted to write my own file encoder as well as deal with errors resulting from signed bytes(in my branch, to prevent merge conflicts). Started planning how to use user input to designate audio files and encrypted information using Processing commands and libraries. Also considering making a makefile.

### Mon, 6/3

Add user input controls and do more testing to match revised encoder(to fix white noise from byte encoding). Add more pictures to test, as well as text files and wav files.

### Tue, 6/4

Trying to continue testing, decode worked initially but fails after a certain point...Checked encode with my own version, but decoded output remains the same. Then, I tried creating another decode following Regina's version, but it didn't work either. More tests need to be done to find out why it works initially. 2nd version of decode now works, checked with images, text, strings, and later wav files. Also changed input modes from numbers to strings for greater user convenience. Note that printed output of encode/decode can be used to reverse the process if entered as input for the other.

### Wed, 6/5

Start working on README: adding onto and revising what Regina wrote, working on the decode instructions and overview.

### Thu, 6/6

Meeting on Zoom to discuss video plans: division of work(who says what) is decided, and further meetings as well(on Google Dos). I will be doing video editing, and we will record asynchronously due to schedule conflicts.

### Fri, 6/7

More tests to make sure our program works: string, txt and wav encryption that we haven't really tested.

### Sat, 6/8 - Sun, 6/9

Video recording + editing/trimming to fit in the time limit, final video completed. Revised with Regina's feedback.

## GROUP MEMBER 2: Regina Chen

### Wed, 5/22

- Research on implementing audio files and manipulating it in processing.
- Started on encoding String into audio file, using .wav file extension.
- Added a .wav file into sketch for testing

### Thur, 5/23

- trying out the different methods in sound library
- trying out frames and channels to manipulate the ultrasound range for embedding another audio file
- playing around with audacity

### Fri, 5/24 to Mon, 5/27
- looking through AudioInputStream and  Fast Fourier Transform
- tried using java but AudioInputStream gives error of "UnsupportedAudioFileException: File of unsupported format"
- trying to encode string to audio file using lsb but didn't find function to write the manipulated sample back to audio buffer

### Tue, 5/28
- starting a backup plan if encoding with frequency in audio files doesn't work
- start on and finish encoding columnar transposition cipher
- researching on how to decode columnar transposition cipher using brute force

### Wed, 5/29
- Encoding string into audio file works
- unable to hear sound from the encoded audio file but when opened on audacity, the frequency and everything else seem to be working fine
- might be due to header being manipulated so trying to fix

### Thur, 5/30
- worked on encoding string into mp3 file, works; need to test longer strings
- worked on encoding png image into mp3 file, encoded but output file have a reduced time duration; it's only part of the original mp3 file
- tried with wav files, doesn't play anything and can't open audacity at all
- tried using a differnt way to encode for mp3, better but still corrupted where the message is encoded

### Fri, 5/31 to Sun, 6/2
- change starting byte to 1024
- instead of changing the last two bit for every byte, do it for every four byte
- solved the problem for time duration cutoff but now the encrypted audio file has a lot of noise in places where hidden file is embedded
- start working on user input so that people can actually use it and for the purpose of not showing code

### Mon, 6/3 to Tue, 6/4
- add user input control to encode
- change mp3 file to wav file, works better
- change interval of bytes to two (have to be even number) so that it doesn't make weird noises in the background
- testing with hidding image and txt files into different wav files, all works
- working on readme and presentation md

### Wed, 6/5 to Thur, 6/6
- revise readme
- plan for how the video will be formated
- working on script for video, will edit and revise before putting onto the presentation md, starting with the basic structures of an audio file and then will progress to explaining how our thing works. Last will be demo (expecting demo time to be between 6-9 min)

### Fri, 6/7 to Sun, 6/9
- still working and will finish on Friday on script for presentation: going over basic structure of audio file and then how our program works, will draw some pics
- will try to finish recording video on Saturaday
