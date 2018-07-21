class Intro {

  float x, y;
  float w, h;
  PImage img;
  boolean isPlaying = false;
  boolean showSplashScreen = false; 
  SoundFile sound;

  Intro(float xpos, float ypos, float w_, float h_, String filename, String soundfile, PApplet p5) {
    x = xpos;
    y = ypos;
    w = w_;
    h = h_;
    img = loadImage(filename);
    sound = new SoundFile(p5, soundfile);
  }

  void render() {
    image(img, x, y);
  }

  void play() {
    sound.loop();
    isPlaying = true;
  }

  void pause() {
    sound.stop();
    isPlaying = false;
  }

  void toggle() {
    if (isPlaying == true) {
      pause();
    } else {
      play();
    }
  }
}