int canvasLeftCornerX = 30;
int canvasLeftCornerY = 60;

void UI() {
  bar = new ControlP5(this, createFont("微软雅黑", 14));

  int barSize = 200;
  int barHeight = 20;
  int barInterval = barHeight + 10;

  bar.addSlider("sectionSideNum", 3, 16, 14, canvasLeftCornerX, canvasLeftCornerY, barSize, barHeight).setLabel("断面边数");
  bar.addSlider("sideDivision", 1, 100, 42, canvasLeftCornerX, canvasLeftCornerY+barInterval, barSize, barHeight).setLabel("断面边细分段数");
  bar.addSlider("cylinderSectionHeight", 0, 100, 4, canvasLeftCornerX, canvasLeftCornerY+barInterval*2, barSize, barHeight).setLabel("柱体分段高度");
  bar.addSlider("sectionRadiusPhase", 0, 25, TWO_PI, canvasLeftCornerX, canvasLeftCornerY+barInterval*3, barSize, barHeight).setLabel("柱体半径相变");
  bar.addSlider("colorsetR", 0, 255, 240, canvasLeftCornerX, canvasLeftCornerY+barInterval*4, barSize, barHeight).setLabel("颜色R值设定");
  bar.addSlider("colorsetG", 0, 255, 175, canvasLeftCornerX, canvasLeftCornerY+barInterval*5, barSize, barHeight).setLabel("颜色G值设定");
  bar.addSlider("colorsetB", 0, 255, 136, canvasLeftCornerX, canvasLeftCornerY+barInterval*6, barSize, barHeight).setLabel("颜色B值设定");
  bar.addSlider("alphaset", 0, 100, 70, canvasLeftCornerX, canvasLeftCornerY+barInterval*7, barSize, barHeight).setLabel("透明度值设定");
  bar.addSlider("min", 0, 100, 19, canvasLeftCornerX, canvasLeftCornerY+barInterval*8, barSize, barHeight).setLabel("最小值设定");
  bar.setAutoDraw(false);
}

void lightSettings() {
  lightSpecular(255, 255, 255);
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);
  specular(200, 200, 200);
  shininess(15);
}

void UIShow() {
  cam.beginHUD();  
  lights();
  bar.draw();
  cam.endHUD();

  if (mouseX<400 && mouseY< height) {
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }
}
