import processing.serial.*;
import processing.sound.*;

Serial puerto;
SawOsc osc;        // oscilador senoidal

float distancia = 25;   // valor leído del sensor
float freq = 440;       // frecuencia actual (suavizada)
float vol = 0;          // volumen actual (suavizado)

// Rango de distancia que estás usando
float distMin = 10;
float distMax = 40;

// Rango de frecuencias (Hz)
float freqMin = 100;    // grave  (lejos)
float freqMax = 300;   // agudo  (cerca)

void setup() {
  size(800, 400);

  printArray(Serial.list());
  puerto = new Serial(this, Serial.list()[4], 9600);  // cambia el índice por tu Arduino
  puerto.bufferUntil('\n');

  osc = new SawOsc(this);
  osc.amp(0);
  osc.play();
}

void draw() {
  background(20);

  // ¿Está la mano dentro del rango?
  boolean dentro = distancia >= distMin && distancia <= distMax;

  // Distancia → frecuencia (cerca = agudo)
  float d = constrain(distancia, distMin, distMax);
  float t = map(d, distMin, distMax, 1, 0);
float objetivoFreq = freqMin * pow(freqMax / freqMin, t);
  // Fuera del rango no suena
  float objetivoVol = dentro ? 0.5 : 0;

  // Suavizado para evitar saltos y "clicks"
  freq = lerp(freq, objetivoFreq, 0.15);
  vol  = lerp(vol, objetivoVol, 0.1);

  osc.freq(freq);
  osc.amp(vol);

  // --- Visual: dibuja la onda ---
  stroke(100, 200, 255);
  strokeWeight(3);
  noFill();
  beginShape();
  float ciclos = map(freq, freqMin, freqMax, 2, 10);  // más agudo = más ondas en pantalla
  for (int x = 0; x < width; x += 4) {
    float y = height/2 + sin(TWO_PI * ciclos * x / width) * vol * 300;
    vertex(x, y);
  }
  endShape();

  // Texto
  fill(255);
  noStroke();
  textSize(20);
  text(nf(distancia, 0, 1) + " cm   →   " + int(freq) + " Hz", 20, 30);
}

void serialEvent(Serial p) {
  String linea = p.readStringUntil('\n');
  if (linea == null) return;
  String[] m = match(trim(linea), "([0-9]+\\.?[0-9]*)");
  if (m != null) {
    distancia = float(m[1]);
  }
}
