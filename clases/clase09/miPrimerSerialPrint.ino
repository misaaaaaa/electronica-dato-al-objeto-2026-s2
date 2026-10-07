int pinPot = A0; //donde está conectado
int posicionPot = 0; //guardar la info del pot

int pinLed = 3;
int intensidadLed = 0;

void setup()
{
  //acá no tengo que hacer pinMode(A0, INPUT)
  //porque ANALOG IN es siempre IN
  
  //para usar el monitor Serial, debo inicializarlo
  // 9600 es el baud rate
  //Serial es una estructura de programación llamada Clase
  Serial.begin(9600);
  
  //el led es una salida
  pinMode(3, OUTPUT);
}

void loop()
{
  	// guarda posición del potenciómetro en una
  	// variable llamada posicionPot
	posicionPot = analogRead(pinPot); 
  
  	//Ajustamos el rango 0-1023 a 0 - 255
  	intensidadLed = posicionPot / 4;
  	analogWrite(pinLed, intensidadLed);
  
  	Serial.print("posicion del pot es: ");
  	Serial.print(posicionPot);
  	Serial.print(" intensidad de luz es: ");
  	Serial.print(intensidadLed);
  	Serial.print("\n");
  	delay(200);
}