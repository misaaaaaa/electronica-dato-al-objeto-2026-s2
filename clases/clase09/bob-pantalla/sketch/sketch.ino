// se cargan las librerías necesarias
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

//incluimos la pestaña de bob
#include "imagen.h"

int pinPot = A0; //donde está conectado
int posicionPot = 0; //guardar la info del pot

// instanciar una clase (SSD1306) con el nombre "display"
Adafruit_SSD1306 pantallita(128, 64, &Wire, -1);  // -1 = sin pin de reset

void setup() {

  //para usar monitor serial
  Serial.begin(9600);

  if (!pantallita.begin(SSD1306_SWITCHCAPVCC, 0x3C)) {
    // Si falla, se queda aquí (revisa cableado/dirección)
    for (;;); // atora el código 
  }

  // deja la pantalla vacía 
  pantallita.clearDisplay();
  pantallita.setTextSize(1); //tamaño del texto
  pantallita.setTextColor(SSD1306_WHITE); // hay que decirle el color
  pantallita.setCursor(0,10); // origen 
  pantallita.println("hola mundo"); //lo que se ve ESCRITO en la pantalla
  pantallita.println("Cargando...");
  pantallita.display(); //esto muestra la imagen. Sin esto no se ve nada

  //cuando termine el setup esperamos un poquito
  delay(2000);
}

void loop() {
  // guarda posición del potenciómetro en una
  // variable llamada posicionPot
	posicionPot = analogRead(pinPot); 

  if (posicionPot > 511)
  {
    //dibujamos a bob
  pantallita.clearDisplay();
  pantallita.drawBitmap(0, 0, bitmap_bob, 128, 64, SSD1306_WHITE);
  pantallita.display(); //esto muestra la imagen. Sin esto no se ve nada
  //delay(2000);
  } else {

    // deja la pantalla vacía 
  pantallita.clearDisplay();
  pantallita.setCursor(0,10); // origen 
  pantallita.println("posicion pot: "); //lo que se ve ESCRITO en la pantalla
  pantallita.println(posicionPot); //lo que se ve ESCRITO en la pantalla
  pantallita.display(); //esto muestra la imagen. Sin esto no se ve nada

  //delay(300);

  }

}

////////////////////////////
