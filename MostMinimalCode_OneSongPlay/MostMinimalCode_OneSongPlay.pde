import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global Variables
Minim minim;
AudioPlayer song1;//creates playlist
//
void setup() 
{
  minim = new Minim(this);
  song1 = minim.loadFile("Alone_-_Color_Out.mp3");
  //song1.loop();//parameter is number of repeats
}
//
void draw() {
  if (song1.isLooping() && song1.loopCount()!=-1) println("there are" , song1.loopCount(),"loops left");
  if (song1.isLooping() && song1.loopCount()==-1) println("Looping infintely");
  if (song1.isPlaying() && !song1.isLooping()) println("PLay Once");
}
//
void keyPressed() {
  if (key == 'p' || key == 'P') song1.play();
  
  println(key);
  if (key == '1' || key == '9') {//note "9" is assumed to be massive . . . simulates infinity
    if (key == '1') println("Lopping Once");
   
    String keystr = String.valueOf(key);
    println("Number of Repeats is", keystr);
    int loopNum = int(keystr);
    song1.loop(loopNum);
  }//End loop functions
  if (key=='i' || key=='I') song1.loop();
  if (key >= '2' || key=='0') println ("I dont't loop that much, press i for infinite loop");
}
//
void mousePressed() {
}
//
//End MAIN Program
