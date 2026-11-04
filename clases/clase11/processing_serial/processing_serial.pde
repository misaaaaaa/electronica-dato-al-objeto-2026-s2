import processing.serial.*;

Serial puerto;
float distancia = 0;       // valor leído del sensor
float diametro = 0;        // diámetro actual (suavizado)

// Rango de distancias que te interesa (ajústalo a tu sensor)
float distMin = 10;
float distMax = 40;

void setup() {
  size(800, 800);
  smooth();

  // Muestra los puertos disponibles en la consola
  printArray(Serial.list());

  // Cambia el índice [0] por el puerto de tu Arduino
  // (en Mac suele ser algo como /dev/cu.usbmodemXXXX)
  String nombrePuerto = Serial.list()[4];
  puerto = new Serial(this, nombrePuerto, 9600);  // mismo baud rate que Serial.begin()
  puerto.bufferUntil('\n');                        // llama a serialEvent() en cada línea
}

void draw() {
  background(20);

  // Mapea la distancia a un diámetro
  // Más lejos = círculo más grande. Para invertirlo, cambia el orden de 50 y width*0.9
  float objetivo = map(distancia, distMin, distMax, 50, width * 0.9);
  objetivo = constrain(objetivo, 50, width * 0.9);

  // Suavizado para que no salte
  diametro = lerp(diametro, objetivo, 0.1);

  // Color que cambia con la distancia
  float tono = map(diametro, 50, width * 0.9, 0, 200);
  colorMode(HSB, 255);
  noStroke();
  fill(tono, 200, 255);
  ellipse(width/2, height/2, diametro, diametro);

  // Texto con el valor
  colorMode(RGB, 255);
  fill(255);
  textAlign(CENTER);
  textSize(24);
  text(nf(distancia, 0, 1) + " cm", width/2, height - 40);
}

//ESTA FUNCION ES LA IMPORTANTE
void serialEvent(Serial p) {
  String linea = p.readStringUntil('\n');
  if (linea == null) return;

  linea = trim(linea);  // ej: "Distancia: 23.5cm"

  // Extrae el número de la línea
  String[] m = match(linea, "([0-9]+\\.?[0-9]*)");
  if (m != null) {
    distancia = float(m[1]);
  }
}
