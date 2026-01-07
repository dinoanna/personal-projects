import java.lang.Byte;
import java.lang.String;
import java.lang.Integer;
import java.util.ArrayList;
import java.util.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
int STRING = 0;
int IMG = 1;
int FILE = 2;
int MODE = 2;

void setup() {
  size(200, 200);
  String[] input = loadStrings("userinput.txt");
  if(input.length<3){
    print("Invalid input format!");
  }else{
    println(input[0]);
    String mode = input[1];
    println(mode);
    if(mode.equals("STRING")){
      MODE = STRING;
    }else if(mode.equals("IMG")){
      MODE = IMG;
    }else if(mode.equals("FILE")){
      MODE = FILE;
    }else{
      println("Invalid mode: "+mode);
    }
    
    byte[] bytes = loadBytes(input[0]);
    int count = Integer.parseInt(input[2]);
    /*for(int n = 0; n < 20; n++){
      print((int)bytes[n]+" ");
    }
    println(" ");*/
    
    
    //ArrayList<Byte> holder = decode2(bytes);
   // byte[] result = new byte[holder.size()-1];
    byte[] result = decode(bytes,count);
    //System.out.println(result.length);
    /*for(int i = 0; i < holder.size()-1; i++){
      result[i] = holder.get(i);
    }*/
    
    //decode
    if (MODE == 0) {
      //System.out.println(messageArray);
      String text = new String(result, StandardCharsets.UTF_8);
      System.out.println(text);
    } else if (MODE == 1){
      saveBytes("decrypted.png", result);
      System.out.println("decrypted.png");
    } else {
      saveBytes("decrypted.dat", result);
      System.out.println("decrypted.dat");
      System.out.println("Manual file conversion needed.");
    }
  }
}

ArrayList<Byte> decode2(byte[] bytes) {
  ArrayList<Byte> holder = new ArrayList<Byte>();
  int i = 0;
  byte value = (byte) 0;
  while(value != 255){
    value = (byte) 0;

    for(int n = 0; n < 4; n++){
      value += (byte) ((bytes[1024+2*n+8*i] & 0b11) << 2*(3-n));
    }
    
    holder.add(value);
    /*if(i < 20){
      print((int)holder[i]+" ");
    }*/
    i++;
  }
  //println(" ");
  return holder;
}

byte[] decode(byte[] bytes, int count){
  byte[] holder = new byte[count];
  for (int i = 0; i < count; i++) {
    byte value = (byte) 0;

    for(int n = 0; n < 4; n++){
      value += (byte) ((bytes[1024+2*n+8*i] & 0b11) << 2*(3-n));
    }
    
    holder[i] = value;
    /*if(i < 20){
      print((int)holder[i]+" ");
    }*/
  }
  //println(" ");
  return holder;
}
