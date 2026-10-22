# Control de luces pide vías, parqueo y buzzer de retroceso (Arduino UNO / Wokwi)

Para simularlo en https://wokwi.com: crea un proyecto nuevo de **Arduino Uno**, pega `sketch.ino` en la pestaña del código y `diagram.json` en la pestaña `diagram.json`.

## Funcionamiento del circuito

El circuito simula el sistema de señalización de un vehículo con una tarjeta Arduino UNO. Tiene cuatro interruptores deslizantes como entradas, conectados a los pines digitales **D2** (pide vías izquierda), **D3** (pide vías derecha), **D4** (luces de parqueo) y **D5** (cambio de reversa). Cada interruptor conecta su pin a GND y el pin se configura como `INPUT_PULLUP`, así que lee LOW cuando el interruptor está activado y HIGH cuando no lo está. Con eso no hacen falta resistencias externas. Las salidas son dos LED ámbar en **D8** (pide vías izquierda) y **D9** (pide vías derecha), un LED blanco de retroceso en **D10** y un buzzer en **D11**. Cada LED lleva su resistencia limitadora de 220 Ω hacia GND. Al activar el interruptor de una dirección, su LED parpadea cada 500 ms. Al activar las luces de parqueo, los dos LED parpadean a la vez, y esto tiene prioridad sobre las direccionales. Al activar la reversa, se enciende fija la luz blanca y el buzzer suena de forma intermitente a 1 kHz (400 ms con sonido y 400 ms en silencio). Los tiempos se controlan con `millis()` en vez de `delay()`, así el programa sigue leyendo las entradas mientras las luces parpadean y todas las funciones trabajan al mismo tiempo.

## Asignación de pines

| Pin Arduino | Tipo    | Componente                          |
|-------------|---------|-------------------------------------|
| D2          | Entrada | Interruptor pide vías izquierda     |
| D3          | Entrada | Interruptor pide vías derecha       |
| D4          | Entrada | Interruptor luces de parqueo        |
| D5          | Entrada | Interruptor cambio de reversa       |
| D8          | Salida  | LED ámbar izquierdo (+220 Ω)        |
| D9          | Salida  | LED ámbar derecho (+220 Ω)          |
| D10         | Salida  | LED blanco de retroceso (+220 Ω)    |
| D11         | Salida  | Buzzer (terminal +), terminal − a GND |
| GND         | —       | Común de interruptores, LED y buzzer |
