//vamos a crear una variable
//para guardar el pin del boton
int pinBoton = 2;
// bool es una variable
// que solo puede ser 0 o 1
bool estadoBoton = 0;
// donde está el led
int pinLed = 9; //LED 
// vamos a crear una variable para el pot
int valorPot = 0;
// variable para el pin del pot
int pinPot = A0;

void setup()
{
  //vamos a decir que el pin del boton
  //es para una entrada
  pinMode(pinBoton, INPUT);
  pinMode(pinLed, OUTPUT); //led es salida
	//los analog IN son siempre INPUTS
}


void loop()
{
	//para leer el botón usamos
  	estadoBoton = digitalRead(pinBoton);
  	//vamos a guardar el valor del potenciometro
	//dividimos por 4 paraconvertir 
  	//del rango de 0-1023 a 0-255
  	//analog In son 0-1023
  	//analog OUT son 0-255
  	
  	//al anteponer el "255 - " invertimos el comportamiento
  	valorPot = 255 - (analogRead(pinPot) /4);
  
	//aca usamos el valor del pot
  	analogWrite(pinLed,valorPot);
  	delay(100);
}








