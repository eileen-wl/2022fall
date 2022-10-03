void setup()
{
  size(900,900);
 background(255);
 frameRate(1);
}
class Point
{
  float x, y;
  Point(float x, float y)
  {
  this.x = x;
  this.y = y;
  }

 
  float distance(Point p)
  {
    float dx = x - p.x;
    float dy = y - p.y;
    return sqrt(dx*dx + dy*dy);
  }
}

void draw()
{
  float maxDistance = 300;
  Point[] points =new Point[200];
  
  for (int i = 0; i <points.length / 2; i++)
  {
    points[i] =new Point(random(width), random(height));
  }
  
  for(int i=0;i <points.length / 4; i++)
  {
    Point a=points[i];
    for(int j= i+1; j < points.length / 4; j++)
    {
      Point b = points[j];
      float d = a.distance(b);
      if(d < maxDistance)
      {
        float alpha = map(d, 0, maxDistance, 255, 0);
        float weight = map(d, 0, maxDistance, 2, 0);
        stroke(0, alpha/4);
        strokeWeight(weight);
        ellipse(a.x, a.y, d, d);
       
        noFill();
    
    }
    }
  }
  saveFrame(); 
}
