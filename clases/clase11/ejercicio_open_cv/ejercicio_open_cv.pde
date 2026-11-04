import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;

Capture video;
OpenCV opencv;

int anchoAnalisis = 320;  // OpenCV analiza una versión pequeña (rápido)
int tamPixel = 25;        // tamaño de los bloques del pixelado
float margen = 0.2;       // agranda la zona censurada un 20% por lado

// Rectángulo donde se dibuja el video en pantalla
float vx, vy, vw, vh;

void setup() {
  fullScreen();
  noCursor();

  video = new Capture(this, 640, 480);
  video.start();

  textAlign(CENTER, BOTTOM);
  textSize(48);
}

void draw() {
  background(0);

  if (video.available()) {
    video.read();
  }
  if (video.width == 0) return;

  int altoAnalisis = round(anchoAnalisis * video.height / (float) video.width);
  if (opencv == null) {
    opencv = new OpenCV(this, anchoAnalisis, altoAnalisis);
    opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  }

  // Ajustar el video a la pantalla manteniendo la proporción
  float s = min(width / (float) video.width, height / (float) video.height);
  vw = video.width * s;
  vh = video.height * s;
  vx = (width - vw) / 2;
  vy = (height - vh) / 2;

  // Detectar caras
  PImage pequeña = video.copy();
  pequeña.resize(anchoAnalisis, altoAnalisis);
  opencv.loadImage(pequeña);
  Rectangle[] caras = opencv.detect();

  // 1. Video siempre normal
  image(video, vx, vy, vw, vh);

  // 2. Pixelar solo las caras
  float f = vw / anchoAnalisis;
  for (Rectangle r : caras) {
    float cw = r.width * f;
    float ch = r.height * f;
    float cx = vx + r.x * f - cw * margen;
    float cy = vy + r.y * f - ch * margen;
    cw *= 1 + margen * 2;
    ch *= 1 + margen * 2;

    pixelarZona(video, cx, cy, cw, ch, tamPixel);

    // Frase encima de la cabeza
    fill(0);
    text("estoy pensando", cx + cw/2 + 3, cy - 12);
    fill(255);
    text("estoy pensando", cx + cw/2, cy - 15);
  }
}

// Pixela una zona de la pantalla (x, y, w, h) usando los colores de la cámara
void pixelarZona(PImage img, float x, float y, float w, float h, int t) {
  // Recortar la zona para que no se salga del video
  float x0 = max(x, vx);
  float y0 = max(y, vy);
  float x1 = min(x + w, vx + vw);
  float y1 = min(y + h, vy + vh);

  img.loadPixels();
  noStroke();
  for (float py = y0; py < y1; py += t) {
    for (float px = x0; px < x1; px += t) {
      // Punto equivalente en la imagen de la cámara
      int cx = constrain((int)((px + t/2 - vx) * img.width  / vw), 0, img.width  - 1);
      int cy = constrain((int)((py + t/2 - vy) * img.height / vh), 0, img.height - 1);
      fill(img.pixels[cy * img.width + cx]);
      rect(px, py, min(t, x1 - px), min(t, y1 - py));
    }
  }
}
