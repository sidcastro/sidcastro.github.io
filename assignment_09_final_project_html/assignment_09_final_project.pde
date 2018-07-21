// Sidney Castro
//castro.s@husky.neu.edu
//Assignment 09: Final Project 
// Zen 
// Press enter to start Zen and mix&match sounds. 
// Use sliders to adjust volume.
// Press 's' to stop. Enjoy :) 


//import processing.sound.*; 

class SoundFile {
  Audio audio;

  SoundFile(PApplet p5, String soundfile) {
    audio = new Audio();
    audio.src = "data/" + soundfile;
  }

  void stop() {
    audio.pause();
  }

  void loop() {
    audio.loop = true;
    audio.play();
  }

  void amp(int newVolume) {
    audio.volume = newVolume;
  }
}

boolean showSplashScreen = true;
boolean isPlaying = true;
boolean moveSlider = false;
DigitalClock digitalClock;

PFont font; 
PFont font2;

int a = 0;
float blockSize = 800;

Mood [] moods; 
Intro [] intro;

void setup() {
  size(mainCanvas.offsetWidth, mainCanvas.offsetHeight);

  font = createFont("TsukuBRdGothic Regular", 50);
  font2 = createFont("TsukuBRdGothic Bold", 50);

  digitalClock = new DigitalClock(40, width/2, height/2+15);

  intro = new Intro[1];
  intro[0] = new Intro(width/2, height/1.2, 125, 125, "volume.png", "relaxation.mp3", this); 

  moods = new Mood[16];
  moods[0] = new Mood(width/23, height/28, 125, 125, "rain.png", "rain.mp3", width/18, height/4.65, (width/18)+90, height/4.65, (width/18)+90, height/4.65, 7, 7, this);
  moods[1] = new Mood(width/3.20, height/28, 125, 125, "thunder.png", "thunder.mp3", width/3, height/4.65, (width/3)+90, height/4.65, (width/3)+90, height/4.65, 7, 7, this);
  moods[2] = new Mood(width/1.70, height/28, 125, 125, "wind.png", "wind.mp3", width/1.68, height/4.65, (width/1.68)+90, height/4.65, (width/1.68)+90, height/4.65, 7, 7, this);
  moods[3] = new Mood(width/1.18, height/28, 125, 125, "woods.png", "forest.mp3", width/1.165, height/4.65, (width/1.165)+90, height/4.65, (width/1.165)+90, height/4.65, 7, 7, this);
  moods[4] = new Mood(width/23, height/3.5, 125, 125, "leaves.png", "leaves.mp3", width/18, height/2.15, (width/18)+90, height/2.15, (width/18)+90, height/2.15, 7, 7, this);
  moods[5] = new Mood(width/3.20, height/3.5, 125, 125, "stream.png", "stream.mp3", width/3, height/2.15, (width/3)+90, height/2.15, (width/3)+90, height/2.15, 7, 7, this);
  moods[6] = new Mood(width/1.70, height/3.5, 125, 125, "waves.png", "waves.mp3", width/1.68, height/2.15, (width/1.68)+90, height/2.15, (width/1.68)+90, height/2.15, 7, 7, this);
  moods[7] = new Mood(width/1.18, height/3.5, 125, 125, "droplet.png", "droplets.mp3", width/1.165, height/2.15, (width/1.165)+90, height/2.15, (width/1.165)+90, height/2.15, 7, 7, this);
  moods[8] = new Mood(width/23, height/1.95, 125, 125, "bonfire.png", "bonfire.mp3", width/18, height/1.40, (width/18)+90, height/1.40, (width/18)+90, height/1.40, 7, 7, this);
  moods[9] = new Mood(width/3.20, height/1.95, 125, 125, "moon.png", "moon.mp3", width/3, height/1.40, (width/3)+90, height/1.40, (width/3)+90, height/1.40, 7, 7, this);
  moods[10] = new Mood(width/1.70, height/1.95, 125, 125, "coffeecup.png", "coffeeshop.mp3", width/1.68, height/1.40, (width/1.68)+90, height/1.40, (width/1.68)+90, height/1.40, 7, 7, this);
  moods[11] = new Mood(width/1.18, height/1.95, 125, 125, "tracks.png", "train.mp3", width/1.165, height/1.40, (width/1.165)+90, height/1.40, (width/1.165)+90, height/1.40, 7, 7, this);
  moods[12] = new Mood(width/23, height/1.3, 125, 125, "fan.png", "fan.mp3", width/18, height/1.04, (width/18)+90, height/1.04, (width/18)+90, height/1.04, 7, 7, this);
  moods[13] = new Mood(width/3.20, height/1.3, 125, 125, "whitenoise.png", "whitenoise.mp3", width/3, height/1.04, (width/3)+90, height/1.04, (width/3)+90, height/1.04, 7, 7, this);
  moods[14] = new Mood(width/1.70, height/1.3, 125, 125, "pinknoise.png", "pinknoise.mp3", width/1.68, height/1.04, (width/1.68)+90, height/1.04, (width/1.68)+90, height/1.04, 7, 7, this);
  moods[15] = new Mood(width/1.18, height/1.3, 125, 125, "brownnoise.png", "brownnoise.mp3", width/1.165, height/1.04, (width/1.165)+90, height/1.04, (width/1.165)+90, height/1.04, 7, 7, this);
}


void draw() {
  color bgColor = color(155+cos(radians(a/10))*100, 210, 155+sin(radians(a/10))*100);
  background(bgColor);
  a += 1; 

  if (showSplashScreen == true) { 
    fill(255);
    background(bgColor);
    noStroke();
    textFont(font, 50);
    textFont(font2);
    text("press enter for a relaxing, distraction free time", width/2, height/1.5);
    digitalClock.getTime();
    digitalClock.display();
    for (int i = 0; i < intro.length; i++) { 
      intro[i].render();
      //intro[i].play();
    }
  } else if (showSplashScreen == false) {
    for (int i = 0; i < moods.length; i++) {
      moods[i].render();
      moods[i].checkSliderMovement();  // JL: every frame, make check if the slider needs updating
    }
    for (int i = 0; i < intro.length; i++) {
      intro[i].pause();
    }
  }
}

void mousePressed() {

  //for (int i = 0; i < moods.length; i++) {
  //  if (showSplashScreen == false && mouseX > moods[i].x && mouseX < moods[i].x + moods[i].w && mouseY > moods[i].y && mouseY < moods[i].y + moods[i].h) {
  //    //moods[i].play();
  //    moods[i].toggle();
  //  }
  //}

  for (int i = 0; i < intro.length; i++) {
    if (showSplashScreen == true && mouseX > intro[i].x && mouseX < intro[i].x + intro[i].w && mouseY > intro[i].y && mouseY < intro[i].y + intro[i].h) {
      intro[i].toggle();
    }
  }
}

void keyPressed() {
  if (key == ENTER) {
    showSplashScreen = false;
  }
  for (int i = 0; i < moods.length; i++) {
    if (key ==  's') {
      moods[i].pause();
    }
  }
}