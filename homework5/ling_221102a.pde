GOL gol;

void setup() {
  size(400, 400);
  smooth();
  gol = new GOL();
  frameRate(2);
}

void draw() {
  background(255);

  gol.generate();
  gol.display();
}

void mousePressed() {
  gol.init();
}
