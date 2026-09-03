//ROTATE
//TRANSLATE
//SCALE
size(600, 600);//tamaño del lienzo
background(400, 400); //color azul
rect(200, 200, 100, 100);
translate(50, 50); //trasladar
rect(200, 200, 100, 100);
pushMatrix();
rotate(PI/16);//rotar
rect(200, 200, 100, 100);
popMatrix();
scale(1.2); //escalar
rect(200, 200, 100, 100);
