//vamos a crear una variable que me siga
//la posición vertical del mouse
// va a ser una variable de tipo int
// que va a comenzar siendo 0
// esto es una variable de tipo global
int posY = 0;

void setup() {
  //tamaño del lienzo se hace con size(x,y);
  size(300,400);
  //vamos a usar modo de color
  // HSB = Hue(tono), Saturation, Brightness
  // le estamos diciendo a Processing que 
  // el tono se mueva de 0 a 360
  // y el Sat, Brightness, y Alpha (transp.)
  // se muevan de 0 a 100
  colorMode(HSB,360,100,100,100);
}
void draw() {
  background(127,100,100,100);
  
  //vamos a actualizar posY según
  //la posición del mouse en Y
  posY = mouseY;
  
  //rect() según https://processing.org/reference/rect_.html
  pushMatrix();
    //muevo el eje de coordenadas
    translate(100,200);
    //la rotación siempre es en radianes
    //podemos convertir de grados a radianes
    //con la función radians(anguloEnGrados);
    rotate(radians(60));
    //cambiamos el color del rect
    //según posY
    fill(posY,88,93,100);
    //dibujo en 0
    rect(0,0,100,50);
  popMatrix();
  
  
  //visualizamos en la pantalla la posY
  textSize(50);
  //negro en HSB es 0,0,0
  fill(0,0,0);
  text(posY,100,100);
}
