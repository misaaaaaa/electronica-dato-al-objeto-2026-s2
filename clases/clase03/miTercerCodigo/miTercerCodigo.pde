//  vamos a aprender lo que son las variables
// una variables es un pedazo de información
// por ejemplo, mi edad es una variable
// si quiero guardar mi edad, debo almacenarla
// en un lugar del computador
// las edades son un tipo de número que se llama
// ENTERO (-10, -5, 0, 1, 1000, 532895)
// son números sin comas
// los números enteros se almacenan en 
// variables de tipo int
int edad = 33;

//hay otro tipo de variable que es para 
// los números con decimales
// que se llaman variables de tipo float
// una nota de la U se guarda en un float
// para los computadores es más caro
// en términos de memoria trabajar con comas
// por eso se habla de ENTEROS cuando no las uso
float nota = 6.1;

// para guardar textos se usa String
// los String se usan para cadenas de caracteres
// se declaran entre comillas
String saludo = "wena, como estai";

// vamos a crear un string con nombre
String nombre = "misaaaaaa";

void setup(){
  size(400,800); //define el tamaño del canvas
  background(255);
}

void draw(){
  line(100,100,300,300);
  fill(0);
  textSize(20);
  text(saludo, 200,400);
  
  //imprimir el nombre
  text(nombre, 200,450);
  
  // las variables están hechas para usarse
  // por ejemplo, puedo mostrar mi edad
  // en la pantalla
  // yo puedo encadenar variables y textos
  // dentro de una función
  text("mi edad es: " + edad, 200,500);
  
  //voy a mostrar la nota en la pantalla
  text("mi nota es: " + nota, 200, 550);
  
}
