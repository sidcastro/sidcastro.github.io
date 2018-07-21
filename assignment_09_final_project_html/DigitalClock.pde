class DigitalClock {
  int fontSize;
  int h, m, s;
  float x, y;

  DigitalClock(int _fontSize, float _x, float _y) {
    fontSize = _fontSize;
    x = _x;
    y = _y;
  }

  void getTime () {
    h = hour();
    m = minute();
    s = second();
  }

  void display() {
    textSize(fontSize);
    textAlign(CENTER);
    text (h + ":" + nf(m, 2) + ":" + nf(s, 2), x, y);
  }
}