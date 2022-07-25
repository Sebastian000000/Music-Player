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
  if (song1.isLooping() && song1.loopCount()!=-1) println("there are", song1.loopCount(), "loops left");
  if (song1.isLooping() && song1.loopCount()==-1) println("Looping infintely");
  if (song1.isPlaying() && !song1.isLooping()) println("Play Once");
  println("Song Position", song1.position(), "Song Length", song1.length());
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
  //
  if (key=='m' || key=='M') {
    if (song1.isMuted()) {
      song1.unmute();
    } else {
      song1.mute();
    }
  }//End Mute Button
  //
  if (key=='f' || key== 'F') song1.skip(1000);//skip forward 1 second or 1000 milliseconds
  if (key=='r' || key== 'R') song1.skip(-1000);
  //
  if (key=='s' || key=='S') {
    if (song1.isPlaying()) {
      song1.pause();
      song1.rewind();
    } else {
      song1.rewind();
    }
  }// end stop
  if (key=='p' || key=='P') {
    if (song1.isPlaying() ) {
      song1.pause();
    } else if (song1.position() >= song1.length()-song1.length()*9/10) {
      song1.pause();
      song1.rewind();
    } else {
      song1.play();
    }
  }
}
//
void mousePressed() {
}
//
//End MAIN Program
