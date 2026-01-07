import java.lang.Byte;
import java.lang.String;
import java.lang.Integer;
import java.util.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import processing.sound.*;

int STRING = 0;
int IMG = 1;
int FILE = 2;
int MODE;

byte[] bytes;
String message;

String[] userInput;

void setup() {
  size(600, 400);
  userInput = loadStrings("userInput.txt");
  if (userInput.length < 3) println("Invalid Input!!!");
  else {
    bytes = loadBytes(userInput[0]);
    String mode = userInput[1];
    //println(userInput[0]);
    if(mode.equals("STRING")){
      MODE = STRING;
    }else if(mode.equals("IMG")){
      MODE = IMG;
    }else if(mode.equals("FILE")){
      MODE = FILE;
    }else{
      println("Invalid Mode!!!");
    }
    
    if (MODE == STRING) {
      println("encryptMsg.wav");
      println("STRING");
      message = userInput[2];
      byte[] msgByte = message.getBytes(StandardCharsets.UTF_8);   
      byte[] messageArray = encode(bytes, msgByte);
      saveBytes("encryptMsg.wav", messageArray);
    }else if (MODE == IMG) {
      println("encryptImg.wav");
      println("IMG");
      byte[] fileBytes = loadBytes(userInput[2]);
      byte[] array = encode(bytes, fileBytes);
      saveBytes("encryptImg.wav", array);
    }else if (MODE == FILE) {
      println("encryptFile.wav");
      println("FILE");
      byte[] fileBytes = loadBytes(userInput[2]);
      byte[] array = encode(bytes, fileBytes);
      saveBytes("encryptFile.wav", array);
    }
  }
  
}

byte[] encode(byte[] bytes, byte[] msgByte) {
  int bi = 1024;
  for (int i = 0; i < msgByte.length; i++) {
    byte msgb = msgByte[i];
    //println(msgb);
    
    byte seg1 = (byte) ((msgb >> 6) & 0b11);
    byte seg2 = (byte) ((msgb >> 4) & 0b11);
    byte seg3 = (byte) ((msgb >> 2) & 0b11);
    byte seg4 = (byte) (msgb & 0b11);

    bytes[bi] = (byte) ((bytes[bi] & 0b11111100) | seg1);
    bi += 2;
    bytes[bi] = (byte) ((bytes[bi] & 0b11111100) | seg2);
    bi += 2;
    bytes[bi] = (byte) ((bytes[bi] & 0b11111100) | seg3);
    bi += 2;
    bytes[bi] = (byte) ((bytes[bi] & 0b11111100) | seg4);
    bi += 2;
  }

  println(msgByte.length);
  return bytes;
}
