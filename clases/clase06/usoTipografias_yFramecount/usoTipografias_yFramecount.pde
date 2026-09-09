PFont miFuente; //creo la variable miFuente, tipo PFont
int contador = 0; //donde voy a guardar el tiempo
void setup(){
  size(400,600);
  miFuente = createFont("Courier New", 30); //creo miFuente
  textFont(miFuente);  //dejo para usar miFuente
}
void draw(){
  background(255);
  
  //contador será dependiente de los frames que lleva
  // encendido el código
  contador = frameCount%255;
 
 text(contador, 20,20);
  
  fill(contador);
  //textSize(tamaño en pixeles)
  textSize(30);
  text("romper entrelazamiento",40,height/2);
  
  // rassembler présence 
  // nueva línea sumando en la posición vertical 20 px
  text("rassembler présence",40,height/2 + 20);
  
  //lanzar herida
  // nudo aunque tensión
  // si escribimos \n el computador lo interpreta como
  // un salto de línea
  text("lanzar herida \nnudo aunque tensión",40,height/2 + 60);
}
