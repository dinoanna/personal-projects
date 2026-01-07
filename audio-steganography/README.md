[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/ecp4su41)
## Group Info
Group Name: Re-Anna-lyze </br>
Group Members: Regina Chen, Anna Shrestha

## Overview
Our program uses least-significant bit(LSB) encoding to hide and decode hidden messages in audio files. We have 3 modes for different types of encrypted information including strings, image files, and other files such as wav or txt files. We have included sample audio files for you to encrypt your message, but you must attach your own messages to hide, whether a string or a file. 

## Instructions

#### ***Precondition: Audio files to be encrypted must be a .wav file***

### To encode into audio file
1. Go into directory 'encoder/data/'
2. Open userInput.txt and input the file that you want to hide and hide into in the following order (input each in a new line):
  - name of wav file that the hidden message or file is going to be hidden in
  - type of format of hidden info: STRING (message), IMG (image), or FILE (txt file)
  - name of file that is going to be hidden or the message itself
4. Save and close the file
5. run command 'processing-java --sketch=/path/to/sketch_folder --run' in terminal (Note: put the full path to the sketch folder starting from Users for Mac users)

### To decode an audio file
1. Open *decoder/data/userinput.txt* and enter the following information to setup up the decoder, where each bullet is a new line:
  - name of the encrypted wav file
  - format of encrypted information that you want to extract: STRING (message), IMG (image), or FILE (other file types including .wav or .txt)
  - the number of bytes of the encrypted file
***If you used the encoder to encrypt the message, you can simply copy over the printed output from the encoder into the userInput.txt of the decoder.***
4. Save and close the file
5. Run the command 'processing-java --sketch=/path/to/sketch_folder --run' in terminal (Note: put the full path to the sketch folder starting from Users for Mac users)
