int patitaLed = 9;
void setup() {
  //la patita 13 se va a comportar como SALIDA
  pinMode(patitaLed, OUTPUT);
}
void loop() {
  //Vamos a hacer una A en morse (.-)
  //2 argumentos: la patita, y si es HIGH o LOW

  // el .
  //punto();
  // la -
  //raya();

  //escribamos mama
  raya(); raya(); // m
  punto(); raya(); // a
  raya(); raya(); // m
  punto(); raya(); // a

  delay(100); //para cerrar la letra
}

void punto(){
  // esta función va a escribir un punto en mi led
  // el .
  digitalWrite(patitaLed, HIGH);
  delay(100); //delay se coloca en milisegundos
  digitalWrite(patitaLed, LOW);
  delay(500);
}

void raya(){
  digitalWrite(patitaLed, HIGH);
  delay(1000); //delay se coloca en milisegundos
  digitalWrite(patitaLed, LOW);
  delay(500);
}

