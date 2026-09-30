//vamos a crear una variable
//para guardar el pin del boton
int pinBoton = 2;
// bool es una variable
// que solo puede ser 0 o 1
bool estadoBoton = 0;
// donde está el led
int pinLed = 9; //LED 
// vamos a crear una variable aleatoria
int valorRandom = 0;

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
  	//vamos a generar un valor aleatorio
  	valorRandom = random(0,255);
  
  // if (condicion) {loQueQuieroQuePase}
  // else {cuandoNoSeCumple}  
  if (estadoBoton == HIGH) {
    analogWrite(pinLed,valorRandom);
  } else {
  	analogWrite(pinLed, 0);
  }
  
  	//analogWrite(pinLed,valorRandom);
  	delay(100);
}








