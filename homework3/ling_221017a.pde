PImage img;

void paintStroke(float strokeLength, color strokeColor, int strokeThickness) {
  float stepLength = strokeLength/4.0;
  
  float tangent1 = 0;
  float tangent2 = 0;
  
  float odds = random(1.0);
  
  if (odds < 0.6) {
    tangent1 = random(-strokeLength, strokeLength);
    tangent2 = random(-strokeLength, strokeLength);
  } 
  
  noFill();
  stroke(strokeColor);
  strokeWeight(strokeThickness);
  curve(tangent1, -stepLength*2, 0, -stepLength, 0, stepLength, tangent2, stepLength*2);
  
}


void settings(){
  img = loadImage("qljs.jpg");
  size(img.width , img.height);
}//将背景设置成图片大小

void setup() {

  background(255);
  frameCount = 0;
  img = loadImage("qljs.jpg");
  img.loadPixels();

}


void draw() {
  translate(width/2, height/2);
  
  int index = 0;
  
  for (int y = 0; y < img.height; y+=1) {
    for (int x = 0; x < img.width; x+=1) {
      int odds = (int)random(2000);
      
      if (odds < 1) {
        color pixelColor = img.pixels[index];//取色
        pixelColor = color(red(pixelColor), green(pixelColor), blue(pixelColor), 20);//添加透明度
        
        pushMatrix();
        translate(x-img.width/2, y-img.height/2);
        rotate(radians(random(-90, 90)));
        
        if (frameCount < 20) {
         
          paintStroke(random(150, 200), pixelColor, (int)random(20, 40));
        } else if (frameCount < 50) {
          
          paintStroke(random(75, 100), pixelColor, (int)random(8, 12));
        } else if (frameCount < 300) {
          
          paintStroke(random(30, 60), pixelColor, (int)random(1, 4));
        } else if (frameCount < 305) {
         
          pixelColor = color(red(pixelColor), green(pixelColor), blue(pixelColor), 100);//改变透明度
          paintStroke(random(5, 15), pixelColor, (int)random(5, 15));
        } else if (frameCount < 600) {
         
          pixelColor = color(red(pixelColor), green(pixelColor), blue(pixelColor), 100);//改变透明度
          paintStroke(random(1, 7), pixelColor, (int)random(1, 7));
        }
        
        popMatrix();
      }
      
      index += 1;
    }
  }
  
  if (frameCount > 600) {
    noLoop();
  }
  saveFrame();
}
