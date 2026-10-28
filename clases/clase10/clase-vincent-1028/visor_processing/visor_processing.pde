// Simulación en Processing de la matriz NeoPixel 8x8 con potenciómetro virtual

final int NUMPIXELS = 64;
final boolean SERPENTINA = false;   // true si tu matriz zigzaguea por filas
final int A5 = 5;

int potpin = A5;
int valorpot = 0;
int intensidadLuz = 0;

// potenciómetro virtual (0-1023), se gira arrastrando el mouse
int potVirtual = 512;
boolean girando = false;
final float POT_X = 570, POT_Y = 190, POT_R = 60;

TiraNeoPixel strip = new TiraNeoPixel();

// ---------- imitación de la librería Adafruit_NeoPixel ----------
class TiraNeoPixel {
  color[] buffer  = new color[NUMPIXELS];  // lo que vamos pintando
  color[] visible = new color[NUMPIXELS];  // lo que se ve después de show()
  int brillo = 127;

  void begin() { }
  void clear() { for (int i = 0; i < NUMPIXELS; i++) buffer[i] = color(0); }
  void setPixelColor(int i, color c) { if (i >= 0 && i < NUMPIXELS) buffer[i] = c; }
  void setBrightness(int b) { brillo = b; }
  void show() { arrayCopy(buffer, visible); }
  color Color(int r, int g, int b) { return color(r, g, b); }
}

// en Arduino lee el pin; aquí lee el potenciómetro de la pantalla
int analogRead(int pin) {
  return potVirtual;
}

// ---------- tu código, casi igual que en Arduino ----------
int indice(int fila, int col) {
  if (SERPENTINA && (fila % 2 == 1)) col = 7 - col;
  return fila * 8 + col;
}

void rect(int f0, int c0, int alto, int ancho, color c) {
  for (int f = f0; f < f0 + alto; f++)
    for (int col = c0; col < c0 + ancho; col++)
      strip.setPixelColor(indice(f, col), c);
}

// reemplazo de delay(): mientras espera, sigue leyendo el potenciómetro
void esperar(int ms) {
  int inicio = millis();
  while (millis() - inicio < ms) {
    valorpot = analogRead(potpin);
    // de 0-1023 a 1-127 para que no se apague ni nos deje ciegos
    intensidadLuz = int(map(valorpot, 0, 1023, 1, 127));
    strip.setBrightness(intensidadLuz);
    strip.show();
    delay(10);
  }
}

void loopArduino() {
  while (true) {
    // VACÍO
    strip.clear();
    strip.show();
    esperar(100);

    //fila, columna, medida en y, medida en x
    //esto es una A
    strip.clear();
    rect(4, 0, 2, 2, strip.Color(255, 160, 0));   // punto (ámbar)
    rect(3, 3, 2, 5, strip.Color(0, 160, 255));   // raya (azul)
    strip.show();
    esperar(1000);

    // VACÍO
    strip.clear();
    strip.show();
    esperar(100);

    //esto es una E
    strip.clear();
    rect(4, 0, 2, 2, strip.Color(255, 160, 0));   // punto (ámbar)
    strip.show();
    esperar(1000);
  }
}

// ---------- Processing ----------
void setup() {
  size(700, 470);
  strip.begin();
  strip.setBrightness(127);
  strip.clear();
  thread("loopArduino");   // corre el "loop" de Arduino en paralelo
}

void draw() {
  background(25);
  dibujarMatriz();
  dibujarPotenciometro();

  fill(220);
  textSize(14);
  textAlign(LEFT);
  text("millis: " + millis(), 480, 340);
  text("valorpot: " + valorpot, 480, 365);
  text("intensidadLuz: " + intensidadLuz, 480, 390);
}

void dibujarMatriz() {
  float margen = 40, tam = 44, espacio = 4;
  float k = strip.brillo / 255.0;   // brillo como en el NeoPixel

  textSize(12);
  textAlign(CENTER, CENTER);
  for (int i = 0; i < 8; i++) {
    fill(150);
    text(i, margen + i * (tam + espacio) + tam / 2, margen - 15);   // columnas
    text(i, margen - 15, margen + i * (tam + espacio) + tam / 2);   // filas
  }

  noStroke();
  for (int fila = 0; fila < 8; fila++) {
    for (int col = 0; col < 8; col++) {
      float x = margen + col * (tam + espacio);
      float y = margen + fila * (tam + espacio);
      fill(45);                       // LED apagado
      rect(x, y, tam, tam, 6);

      color c = strip.visible[indice(fila, col)];
      if (c != color(0)) {            // LED encendido
        fill(red(c) * k, green(c) * k, blue(c) * k);
        rect(x, y, tam, tam, 6);
      }
    }
  }
}

void dibujarPotenciometro() {
  float a0 = radians(135), a1 = radians(405);   // giro de 270°
  float ang = map(potVirtual, 0, 1023, a0, a1);

  noFill();
  strokeWeight(8);
  stroke(60);
  arc(POT_X, POT_Y, POT_R * 2 + 24, POT_R * 2 + 24, a0, a1);
  stroke(255, 160, 0);
  arc(POT_X, POT_Y, POT_R * 2 + 24, POT_R * 2 + 24, a0, ang);

  noStroke();
  fill(girando ? 110 : 85);
  circle(POT_X, POT_Y, POT_R * 2);
  stroke(240);
  strokeWeight(4);
  line(POT_X, POT_Y, POT_X + cos(ang) * (POT_R - 10), POT_Y + sin(ang) * (POT_R - 10));

  noStroke();
  fill(220);
  textSize(14);
  textAlign(CENTER, CENTER);
  text("potenciómetro", POT_X, POT_Y + POT_R + 30);
  textSize(11);
  fill(150);
  text("arrastra arriba/abajo o usa la rueda", POT_X, POT_Y + POT_R + 50);
}

// ---------- mouse ----------
void mousePressed() {
  girando = dist(mouseX, mouseY, POT_X, POT_Y) < POT_R + 15;
}

void mouseDragged() {
  if (girando) potVirtual = constrain(potVirtual + (pmouseY - mouseY) * 5, 0, 1023);
}

void mouseReleased() {
  girando = false;
}

void mouseWheel(MouseEvent e) {
  potVirtual = constrain(potVirtual - e.getCount() * 20, 0, 1023);
}
