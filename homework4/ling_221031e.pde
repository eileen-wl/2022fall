

import controlP5.*;
import peasy.*;
import nervoussystem.obj.*;

int sectionSideNum = 8;
int sideDivision = 40;
int cylinderHeightSection = 200;
int colorsetR ; 
int colorsetG ;
int colorsetB ;
int alphaset = 0;

int min = 0;

float cylinderSectionHeight = 3;

float sectionRadiusPhase = TWO_PI;
float twistPhase = PI*2/3;
float twistPhaseStart = TWO_PI;

float[] sectionR = new float[cylinderHeightSection+1];
float[] sectionTwistPhase = new float[cylinderHeightSection+1];

PeasyCam cam;
ControlP5 bar;

boolean displayMesh = false;
boolean record;

void setup() {
  size(1280, 1280, P3D);
  colorMode(RGB, 255, 255, 255);
  
  cam = new PeasyCam(this, 2000);
  initiateValues();
  UI();
}

void initiateValues() {
  for (int  i =0; i < cylinderHeightSection+1; i ++) {
    sectionR[i] = 100 + 30 * cos((sectionRadiusPhase/cylinderHeightSection/2) * i);
    sectionTwistPhase[i] = twistPhase * sin((twistPhaseStart/cylinderHeightSection) * i);
  }
}

void draw() {
  background(200);
  noStroke();

  
  if (displayMesh) {
    stroke(0);
  }

  fill(50);
  noStroke();

  lightSettings(); 

  if (record) {
    beginRecord("nervoussystem.obj.OBJExport", "designWork/curvatureVase-####.obj");
  }

  initiateValues();
  drawCylinder();

  if (record) {
    endRecord();
    record = false;
  }

  UIShow();
  
  saveFrame();
}

void drawCylinder() {
  float theta = TWO_PI / sectionSideNum;

  fill(colorsetR, colorsetB, colorsetB, alphaset);

  
  beginShape(QUADS);
  for (int j = min; j < cylinderHeightSection; j ++) {
    for (int i = 0; i < sectionSideNum; i ++) {
      float x11 = sectionR[j] * cos(theta * i + sectionTwistPhase[j]);
      float y11 = sectionR[j] * sin(theta * i + sectionTwistPhase[j]);
      float x12 = sectionR[j] * cos(theta * ((i+1)%sectionSideNum) + sectionTwistPhase[j]);
      float y12 = sectionR[j] * sin(theta * ((i+1)%sectionSideNum) + sectionTwistPhase[j]);

      float x21 = sectionR[j+1] * cos(theta * i + sectionTwistPhase[j+1]);
      float y21 = sectionR[j+1] * sin(theta * i + sectionTwistPhase[j+1]);
      float x22 = sectionR[j+1] * cos(theta * ((i+1)%sectionSideNum) + sectionTwistPhase[j+1]);
      float y22 = sectionR[j+1] * sin(theta * ((i+1)%sectionSideNum) + sectionTwistPhase[j+1]);


      float deltaX12 = (x12 - x11) / sideDivision;
      float deltay12 = (y12 - y11) / sideDivision;
      float deltaX22 = (x22 - x21) / sideDivision;
      float deltay22 = (y22 - y21) / sideDivision;

      for (int k = 0; k < sideDivision; k ++) {
        vertex(x11 + deltaX12 * k, y11 + deltay12 * k, cylinderSectionHeight * j);
        vertex(x21 + deltaX22 * (k+1), y21 + deltay22 * (k+1), cylinderSectionHeight * (j+1));
        vertex(x11 + deltaX12 * (k+1), y11 + deltay12 * (k+1), cylinderSectionHeight * j);

        vertex(x11 + deltaX12 * k, y11 + deltay12 * k, cylinderSectionHeight * j);
        vertex(x21 + deltaX22 * k, y21 + deltay22 * k, cylinderSectionHeight * (j+1));
        vertex(x21 + deltaX22 * (k+1), y21 + deltay22 * (k+1), cylinderSectionHeight * (j+1));
      }

    }
  }
  endShape();
}

void keyPressed() {
  if (key == 's') {
    record = true;
  }
}
