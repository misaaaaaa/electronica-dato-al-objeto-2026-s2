# Clase 11 - 21 octubre

## recalendarización

11 de noviembre: evaluar anteproyectos

    - Descripción formal de lo que quieren hacer (1 párrafo)
    - Conceptualización (1 párrafo)
    - Diagrama de flujo (con sensores y actuadores)
    - Dibujo esquemático (cómo va conectado al Arduino)
    - Boceto de instalación. Ojalá tenga escala, referencias, sitio en la sala, sensores y actuadores

- 2 de diciembre: última nota, con pruebas de montaje    

- 9 de diciembre: examen con montaje en sala 8. Anteproyecto actualizado. Incluir una bitácora donde se describa la distancia entre el anteproyecto y lo que llegaron (descubrimientos, fracasos, aprendizajes pendientes, gastos, etc)

## presentaciones

### Ameli

- quiere usar ultrasónico <https://afel.cl/products/sensor-de-ultrasonico-hc-sr04?_pos=1&_sid=81fdaf6f5&_ss=r>
- limadura de hierro e imanes con servomotor
- planta encerrada en algo de vidrio, con un palito que la esté golpeando <https://afel.cl/products/servomotor-mg995-tower-pro-engranajes-metalicos?_pos=3&_sid=bc69f6629&_ss=r>
- considerar cargador de 5V mínimo 1A <https://afel.cl/products/cargador-de-5v-3a>

### Roxana

- muñeco basado en obra de carlos ortuzar (frank nurni)
- sensor ultrasónico para activar la señal 
- motor paso a paso recomendado <https://afel.cl/products/mini-motor-paso-a-paso-driver-board-uln2003>
- sobre interacción y conservación de obras <https://www.tinguely.ch/en/tinguely-collection-conservation/restaurierung/restaurierung_haltung.html>

### Josefina

- pantalla y sensor de movimiento
- pantallas recomendadas
  - <https://afel.cl/products/4-0-inch-spi-touch-screen-module-tft-interface-480-320-with-touch?_pos=23&_sid=5f69ae17e&_ss=r>
- vamos a aprender a vincular arduino con processing
- artista recomendado: daniel rozin <https://proyectoidis.org/daniel-rozin/>
- hay un sensor más preciso llamado Time of Flight <https://afel.cl/products/sensor-de-distancia-por-tof-vl53l0x?_pos=16&_sid=d424859c9&_ss=r>

### Nicolás

- idea ambiciosa: pantalla crt con cámara, que la cámara esté conectada a la pantalla (CCTV). Cuando la gente se cruce entre la cámara y la tele, haya un texto. 
  - para detectar cuerpos en processing se usa openCV (open computer vision)
  - webcam -> compu -> conversor hdmi a rca -> tv
- idea menos ambiciosa: caja musical "moderna". Hasta ahora solo cambia la frecuencia del sonido dependiendo de la luz que le llega
  - recomendada librería Tone() de Arduino
  - librería Minim de Processing (permite sintetizar sonido)

### Nicole

- válvula solenoide 12v dc <https://www.mercadolibre.cl/electrovalvula-valvula-solenoide-12v-12-nc-vshop/p/MLC2119834534>
- módulo mosfet pwm <https://afel.cl/products/modulo-mosfet-15a-400w-pwm?_pos=1&_sid=7903edeea&_ss=r>
- fuente de poder 12V / 2A o más <https://afel.cl/products/cargador-de-12v-2a>
- puedes medir la resistencia a través de arduino con un divisor de voltaje
- investigar Envelope Follower en audio

## tipos de motores

- motor DC. motor más básico, que en general es rápido, e impreciso. Muy usado en ventiladores, en ruedas de autos de juguete y vibradores. lo importante saber de este motor es que se puede controlar su velocidad con voltaje (antes de quemarse) por medio de PWM. Muy usados por <https://zimoun.net>. 

  - la otra manera de controlar la velocidad es por medio de engranes, llamados motorreductores <https://afel.cl/collections/motorreductores>
  - para controlar la dirección debo o invertir la polaridad o usar un puente H
  - para ser controlado por arduino requiere un driver pwm <https://afel.cl/products/modulo-mosfet-15a-400w-pwm?_pos=12&_sid=e2bbfd2ec&_ss=r>
  - los motores AC funcionan similar (como los de microondas). Pueden ser síncronos o asíncronos

- motor servo. motor lento, preciso y sabe donde está. Son más caros y su sistema de engranes se desgasta con el tiempo. Hay de 180° y de rotación continua. Son un poco ruidosos también

  - se recomiendan de dientes metálicos por sobre plásticos
  - el servo sabe donde está porque tiene un potenciómetro interno
  - para más fuerza, hay motores más caros <https://afel.cl/products/servomotor-digital-20kg-nuevo?_pos=7&_sid=bc69f6629&_ss=r>
  - requiere una fuente DC externa de voltaje apropiado <https://afel.cl/products/cargador-de-5v-3a>

- motor paso a paso. motor lento, muy preciso pero que no sabe donde está. se mueve de a pequeños "step". <https://afel.cl/products/mini-motor-paso-a-paso-driver-board-uln2003?_pos=2&_sid=b6ed330ac&_ss=r>

  - se ocupan mucho en impresoras 3D, cortadoras láser, etc etc
  - si quieren saber donde está, se usan señales externas con interruptores "final de carrera" <https://afel.cl/products/final-carrera-mecanico?_pos=1&_sid=1d6e9d45c&_ss=r>
  - requieren además un controlador <https://afel.cl/products/controlador-de-motores-paso-a-paso-driver-drv8825>

## registro de video

<https://youtu.be/di-8aFC-ZFQ>
