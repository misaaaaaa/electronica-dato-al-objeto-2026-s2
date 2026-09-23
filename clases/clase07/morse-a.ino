int patitaLed = 13;
void setup() {
  //la patita 13 se va a comportar como SALIDA
  pinMode(patitaLed, OUTPUT);
}
void loop() {
  //Vamos a hacer una A en morse (.-)
  //2 argumentos: la patita, y si es HIGH o LOW
  // el .
  digitalWrite(patitaLed, HIGH);
  delay(100); //delay se coloca en milisegundos
  digitalWrite(patitaLed, LOW);
  delay(500);

  // la -
  digitalWrite(patitaLed, HIGH);
  delay(1000); //delay se coloca en milisegundos
  digitalWrite(patitaLed, LOW);
  delay(500);

  delay(100); //para cerrar la palabra
}
