// creamos una variable que me gobierna
// el tamaño del círculo
int diametro = 300;

void setup(){
  size(400,800);
  background(255);
}

void draw(){

  //para hacer círculos, se usa
  //circle(posX,posY,diametro);
  circle(200,400,diametro);
 
  //ya sabemos hacer lineas
  line(100,100,300,700);
  
  //para hacer un cuadrado
  // square(posX,posY,largoLado);
  square(300,150,50);
  
  //para hacer un triangulo, damos coordenadas
  // de cada vértice
  // triangle(x1,y1, x2,y2, x3,y3);
  triangle(100,700,150,650,200,750);
}
