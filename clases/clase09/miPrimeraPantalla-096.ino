// se cargan las librerías necesarias
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

// instanciar una clase (SSD1306) con el nombre "display"
Adafruit_SSD1306 pantallita(128, 64, &Wire, -1);  // -1 = sin pin de reset

void setup() {
  if (!pantallita.begin(SSD1306_SWITCHCAPVCC, 0x3C)) {
    // Si falla, se queda aquí (revisa cableado/dirección)
    for (;;); // atora el código 
  }

  // deja la pantalla vacía 
  pantallita.clearDisplay();
  pantallita.setTextSize(2); //tamaño del texto
  pantallita.setTextColor(SSD1306_WHITE); // hay que decirle el color
  pantallita.setCursor(0,10); // origen 
  pantallita.println("hola mundo"); //lo que se ve ESCRITO en la pantalla
  pantallita.println("complementario");
  pantallita.display(); //esto muestra la imagen. Sin esto no se ve nada

}

void loop() {
  // put your main code here, to run repeatedly:

}
