//vamos a crear una variable
//para guardar el pin del boton
int pinBoton = 2;
// bool es una variable
// que solo puede ser 0 o 1
bool estadoBoton = 0;
// donde está el led
int pinLed = 13; //LED INTERNO

void setup()
{
  //vamos a decir que el pin del boton
  //es para una entrada
  pinMode(pinBoton, INPUT);
  pinMode(pinLed, OUTPUT); //led es salida
}


void loop()
{
	//para leer el botón usamos
  	estadoBoton = digitalRead(pinBoton);
  	//escribimos en el led el estadoBoton
  	digitalWrite(pinLed, estadoBoton);
}








