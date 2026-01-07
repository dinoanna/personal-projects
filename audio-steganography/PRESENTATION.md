# LSB (least significant bit) Audio Steganography

## Video Presentation with Demo
https://drive.google.com/file/d/1CemvBLmC8uSHQvDn1R585YF2aQ5GU0WV/view

## Basic structure of an audio file
- Header:
  - format of audio file and how the data are stored
  - the sample rate, number of channels (mono or stereo), byte rate, etc
  - Metadata: title of song and album, artist name, track number, cover art, etc
- Audio data:
  - Uncompressed format: audio data are stored in a series of audio samples where each sample represents the amplitude of the audio signal at a specific point in time. It's lossless which means that manipulating the file (converting or compressing) will make it experience negligible loss in sound quality
  - Compressed format: audio data are stored in frames, which carry the audio samples. Each frame includes a header with information about the frame length, bit rate, and sample rate. These frames often include error detection to ensure integrity.

## Mono/Stereo Sound files
- Mono: only has one channel</br> <img width="763" alt="Screenshot 2024-06-08 at 4 17 22 PM" src="https://github.com/Stuycs-K/final-project-10-shrestha-anna-chen-regina/assets/112907876/9f24ac49-792f-4b88-b287-35b5c7552d94">
- Stereo: two channels, a left channel and a right channel</br> <img width="774" alt="Screenshot 2024-06-08 at 4 24 24 PM" src="https://github.com/Stuycs-K/final-project-10-shrestha-anna-chen-regina/assets/112907876/f1333896-f658-4419-bae7-b4b2482252df">

## How our tool generally works:
- Audio steganography that allows you to:
  - embed messages, txt files, and png image files into wav files without making human detectable differences
  - extract messages, txt files, and png image files from wav files
- wav files: audio data stored in uncompressed format
- manipulate the least significant bit of the bytes in the audio data only
- change only the least significant bit of every other byte
