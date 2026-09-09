//vamos a crear una variable que me siga
//la posición vertical del mouse
// va a ser una variable de tipo int
// que va a comenzar siendo 0
// esto es una variable de tipo global
int posY = 0;

void setup() {
  //tamaño del lienzo se hace con size(x,y);
  size(350,508);
  //vamos a usar modo de color
  // HSB = Hue(tono), Saturation, Brightness
  // le estamos diciendo a Processing que 
  // el tono se mueva de 0 a 360
  // y el Sat, Brightness, y Alpha (transp.)
  // se muevan de 0 a 100
  colorMode(HSB,360,100,100,100);
}
void draw() {
  background(127,0,100,100);
  
  //vamos a actualizar posY según
  //la posición del mouse en Y
  
  //posY después de 360 deja de alterar el tono
  //entonces debemos hacer que en 360 vuelva a 0
  //y que 361 sea 1
  //y que 365 sea 5
  
  //  con % uso el operador MÓDULO
  // módulo es el resto de la división
  posY = mouseY%360;
  
  //rect() según https://processing.org/reference/rect_.html
  pushMatrix();
    //muevo el eje de coordenadas
    //vamos a volver relativos al tamaño del lienzo
    //la translación
    translate(width/2,height*0.50);
    //la rotación siempre es en radianes
    //podemos convertir de grados a radianes
    //con la función radians(anguloEnGrados);
    //rotate(radians(60));
    //cambiamos el color del rect
    //según posY
    
   // el cuarto parámetro del color es 
   // es la opacidad (0 transparente, 100 opaco)
    fill(posY,88,93,80);
    //dibujo en 0
    //para dibujar el rectángulo desde el centro
    //y no de la esquina
    rectMode(CENTER);
    rect(0,0,100,50);
  popMatrix();
  
  //vamos a dibujar una elipse
  pushMatrix();
    translate(width*0.666666, height*0.5555);
    //color decreciente con 360 - posY
    fill(360-posY,88,93,50);
    ellipse(0,0,100,50);
  popMatrix();
  
  
  //visualizamos en la pantalla la posY
  textSize(30);
  //negro en HSB es 0,0,0
  fill(0,0,0);
  //se puede encadenar texto bruto con valores
  //de variables, usando +
  text("posY: " + posY,100,100);
  
  text("360 - posY: " + (360-posY),100,150);
}
