//este código es súper importante que lo vean
//esto no es verdad

void setup(){
  size(300,300);
  colorMode(HSB,360,100,100,100);
}

void draw(){
  background(0,50,80,100);
  
  pushMatrix();
    square(100,100,100);
  popMatrix();
}
