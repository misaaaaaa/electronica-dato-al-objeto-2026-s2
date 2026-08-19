// vamos a usar dos funciones propias de 
// processing
// que yo debería poner cada vez que quiera
// hacer algo en este software
void setup(){
  // vamos a cambiar el tamaño del rectángulo 
  // gris, que se llama LIENZO
  // eso se hace con la función 
  // size(tamañoEnPixelesHORIZONTAL,tmñnPxVert);
  size(400,800); //define el tamaño del canvas
  
  // para cambiar el color de fondo
  // uso background();
  // por defecto, tiene un solo argumento
  // el color en escala de grises
  // donde 0 es negro, y 255 es blanco
  // todo valor intermedio es un gris
  background(255);
}

void draw(){
  // vamos a generar una línea
  // con la función line();
  // line(ptoInicialX, ptoIY,ptoFinalX,ptoFinalY);
  line(100,100,300,700);
  
  // para desplegar texto en el lienzo usamos
  // text("texto a desplegar", posX, posY);
  // hay que rellenar el texto antes de ejecutarlo
  // fill(); rellena con un color en escala de gris
  fill(0);
  // para cambiar el tamaño del texto en pixeles
  // uso textSize(tamañoEnPixeles);
  textSize(20);
  text("somos unas letras", 200,400);
  
}
