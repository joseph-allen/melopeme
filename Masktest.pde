import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PImage Mask;
float randVal = 0;
Minim minim;
AudioPlayer song;


void setup() {
  Mask = loadImage("Mask.png");
  Mask.resize(width,height);
  fullScreen();
  background(0);
  minim = new Minim(this);
 
  // this loads mysong.wav from the data folder
  song = minim.loadFile("Heart.mp3");
  song.play();
}

void draw() {
  image(Mask,0,0);
  fill(255);
  for(int x = 0; x <20; x++){
    textSize(random(50));
    text(":(", random(width), random(height));  
  }
  
  loadPixels();
  
  for(int x = 0; x <width*height; x++){
    pixels[x]= pixels[x] - Mask.pixels[x];
  }
  
  updatePixels();
  
  for(int x = 0; x <1; x++){
    randVal = random(1);
    fill(randVal*59,randVal*89,randVal*152);
    textSize(random(50));
    text(":(", random(width), random(height));  
  }
  
  randVal = random(1);
  stroke(randVal*59,randVal*89,randVal*152,10);
    for(int i = 0; i < song.bufferSize() - 1; i++)
  {
    line(i*2, height + song.left.get(i)*50, i*2 + 1, 50 + song.left.get(i+1)*50);
  }
  
  filter(ERODE);
  saveFrame("image/shot-######.png");
}