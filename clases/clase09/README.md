# Clase 09 - 7 octubre

lo importante es que queremos

>sentir el mundo
>
>guardar esa sensación en una variable
>
>usar esa variable
>
>actuar en el mundo

la semana pasada lo hicimos con un potenciómetro y un LDR, para controlar el brillo de un LED

## diferencia analogo y digital en arduino

|         | in                                                                                                                           | out                                                                                                                                            |
|---------|------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| analog  | analogRead(numeroPinA); por ejemplo: potenciometro, LDR   valores posible: 0 - 1023  funcionan en pines analog in (A0 al A5) | analogWrite(numeroPin, valor); leds con intensidad intermedia  valor posible: 0 - 255  funcionan en CIERTOS pines digitales (~): 3,5,6,9,10,11 |
| digital | digitalRead(númeroPin); por ejemplo: botones   funcionan en pines digitales (Del 0 al 13)                                    | digitalWrite(numeroPin, variable); por ejemplo: luces on/off  funcionan en pines digitales (Del 0 al 13)                                       |

En el fondo, todo esto, son sistema de comunicación. Hay otros sistemas de comunicación que puede usar arduino, como un PROTOCOLO llamado I2C

## diagrama wokwi potenciometro led

```json
{
  "version": 1,
  "author": "Matías Serrano",
  "editor": "wokwi",
  "parts": [
    { "type": "wokwi-arduino-uno", "id": "uno", "top": -95.4, "left": -67.8, "attrs": {} },
    {
      "type": "wokwi-potentiometer",
      "id": "pot1",
      "top": 165.3,
      "left": 125.8,
      "rotate": 180,
      "attrs": {}
    },
    {
      "type": "wokwi-led",
      "id": "led1",
      "top": -166.8,
      "left": 128.6,
      "attrs": { "color": "magenta", "flip": "1" }
    },
    {
      "type": "wokwi-resistor",
      "id": "r1",
      "top": -130.45,
      "left": 163.2,
      "attrs": { "value": "1000" }
    }
  ],
  "connections": [
    [ "pot1:VCC", "uno:5V", "red", [ "v-48", "h-56.8" ] ],
    [ "uno:GND.3", "pot1:GND", "black", [ "v57.5", "h61.6" ] ],
    [ "pot1:SIG", "uno:A0", "green", [ "v-67.2", "h-18.8" ] ],
    [ "led1:C", "r1:1", "green", [ "v0" ] ],
    [ "r1:2", "uno:GND.2", "black", [ "v240", "h-116.4" ] ],
    [ "led1:A", "uno:3", "green", [ "v19.2", "h10" ] ]
  ],
  "dependencies": {}
}
```