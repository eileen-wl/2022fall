LSystem lsys;
Turtle turtle;

void setup() {
  size(800, 200);

  Rule[] ruleset = new Rule[1];
  ruleset[0] = new Rule('F', "FF+[+F-F-F]-[-F+F+F]");
  lsys = new LSystem("F", ruleset);
  turtle = new Turtle(lsys.getSentence(), height/3, radians(25));

  smooth();
}

void draw() {
  background(255);  
  fill(0);

  translate(width/2, height);
  rotate(-PI/2);
  turtle.render();
  noLoop();
}

int counter = 0;

void mousePressed() {
  if (counter < 5) {
    pushMatrix();
        lsys.generate();
        turtle.setToDo(lsys.getSentence());
        turtle.changeLen(0.5);
    popMatrix();
    redraw();
    
    counter++;
  }
}
