class Mood {
  
  float x, y;
  float x1, y1, x2, y2;
  float cx, cy, cw, ch;
  PImage img;
  boolean isPlaying = false;
  SoundFile sound;
  
  float sliderValue = 0;  // represents the normalized position (from 0 to 1) of the slider along the line, useful for volume 
  
  Mood(float xpos, float ypos, float w_, float h_, String filename, String soundfile, float x1_slider, float y1_slider, float x2_slider, float y2_slider, float cx_, float cy_, float cw_, float ch_, PApplet p5) {
    x = xpos;
    y = ypos;
    //w = w_;
    //h = h_;
    img = loadImage(filename);
    sound = new SoundFile(p5, soundfile);
    x1 = x1_slider;
    y1 = y1_slider;
    x2 = x2_slider;
    y2 = y2_slider;
    cx = cx_;
    cy = cy_;
    cw = cw_;
    ch = ch_;
  }
  
  void render() {
    image(img, x, y);
    line(x1, y1, x2, y2); 
    stroke(255);
    strokeWeight(8);
    ellipse(cx, cy, cw, ch);
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
  
  void checkSliderMovement() {
    // check if user is pressing mouse around slider area... 
    if (mousePressed == true && mouseX >= x1 && mouseX <= x2 && mouseY >= y1 - cw && mouseY <= y1 + cw) {
      // update slider position on screen and internal value
      cx = mouseX;
      updateSliderValue();
      setVolume(sliderValue);
    }
  }
  
  void updateSliderValue() {
    sliderValue = (cx - x1) / (x2 - x1);
  }
  
  void setVolume(float newVolume) {
    // Set the volume of the file
    sound.amp(newVolume);    
    
    // Trigger playing or stopping if crossing a very small threshold
    if (newVolume < 0.1 && isPlaying == true) {
      pause();
    } else if (newVolume >= 0.1 && isPlaying == false) {
      play();
    }
  
  }
 
}