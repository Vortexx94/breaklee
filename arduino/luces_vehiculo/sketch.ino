/*
  Control de luces de un vehiculo
  - Luces pide vias (direccionales) izquierda y derecha
  - Luces de parqueo (intermitentes, ambas direccionales a la vez)
  - Luz y buzzer de retroceso al activar el cambio de reversa

  Entradas (interruptores deslizantes a GND, con INPUT_PULLUP -> activo en LOW)
    D2 : direccional izquierda
    D3 : direccional derecha
    D4 : luces de parqueo
    D5 : cambio de reversa
  Salidas
    D8  : LED direccional izquierda (ambar)
    D9  : LED direccional derecha (ambar)
    D10 : LED de retroceso (blanco)
    D11 : buzzer de retroceso
*/

const int PIN_SW_IZQ     = 2;
const int PIN_SW_DER     = 3;
const int PIN_SW_PARQUEO = 4;
const int PIN_SW_REVERSA = 5;

const int PIN_LED_IZQ      = 8;
const int PIN_LED_DER      = 9;
const int PIN_LED_REVERSA  = 10;
const int PIN_BUZZER       = 11;

const unsigned long T_PARPADEO = 500;  // ms encendido / apagado de las direccionales
const unsigned long T_PITIDO   = 400;  // ms sonido / silencio del buzzer
const unsigned int  FREC_BUZZER = 1000; // Hz

unsigned long ultimoParpadeo = 0;
unsigned long ultimoPitido   = 0;
bool estadoParpadeo = false;
bool estadoPitido   = false;

bool activo(int pin) {
  return digitalRead(pin) == LOW;  // interruptor cerrado a GND
}

void setup() {
  pinMode(PIN_SW_IZQ, INPUT_PULLUP);
  pinMode(PIN_SW_DER, INPUT_PULLUP);
  pinMode(PIN_SW_PARQUEO, INPUT_PULLUP);
  pinMode(PIN_SW_REVERSA, INPUT_PULLUP);

  pinMode(PIN_LED_IZQ, OUTPUT);
  pinMode(PIN_LED_DER, OUTPUT);
  pinMode(PIN_LED_REVERSA, OUTPUT);
  pinMode(PIN_BUZZER, OUTPUT);

  Serial.begin(9600);
  Serial.println("Sistema de luces listo");
}

void loop() {
  unsigned long ahora = millis();

  bool izq     = activo(PIN_SW_IZQ);
  bool der     = activo(PIN_SW_DER);
  bool parqueo = activo(PIN_SW_PARQUEO);
  bool reversa = activo(PIN_SW_REVERSA);

  // Base de tiempo comun para el parpadeo (sin delay para no bloquear las entradas)
  if (ahora - ultimoParpadeo >= T_PARPADEO) {
    ultimoParpadeo = ahora;
    estadoParpadeo = !estadoParpadeo;
  }

  // Las luces de parqueo tienen prioridad: encienden ambas direccionales
  bool encIzq = parqueo || izq;
  bool encDer = parqueo || der;

  digitalWrite(PIN_LED_IZQ, (encIzq && estadoParpadeo) ? HIGH : LOW);
  digitalWrite(PIN_LED_DER, (encDer && estadoParpadeo) ? HIGH : LOW);

  // Retroceso: luz blanca fija y buzzer intermitente
  if (reversa) {
    digitalWrite(PIN_LED_REVERSA, HIGH);
    if (ahora - ultimoPitido >= T_PITIDO) {
      ultimoPitido = ahora;
      estadoPitido = !estadoPitido;
      if (estadoPitido) {
        tone(PIN_BUZZER, FREC_BUZZER);
      } else {
        noTone(PIN_BUZZER);
      }
    }
  } else {
    digitalWrite(PIN_LED_REVERSA, LOW);
    noTone(PIN_BUZZER);
    estadoPitido = false;
  }
}
