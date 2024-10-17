hadow Ball

Shadow Ball es un juego 2D desarrollado con Godot Engine. En este juego, controlas a un personaje que puede correr, saltar y esquivar obstáculos en su camino.

## Características

- Movimiento fluido del personaje
- Animaciones de correr, saltar e inactividad
- Control de gravedad y física
- Soporte para entrada de teclado

## Instalación

1. Clona este repositorio en tu máquina local:

   ```sh
   git clone https://github.com/tu-usuario/shadow-ball.git
   ```
2. Abre el proyecto en Godot Engine:

   - Abre Godot Engine.
   - Haz clic en "Importar" y selecciona la carpeta del proyecto clonado.

## Uso

- Usa las teclas de flecha izquierda y derecha para mover al personaje.
- Presiona la tecla de salto (configurada como "Saltar" en las acciones de entrada) para saltar.

## Código Principal

El código principal del personaje se encuentra en el archivo [`player_1.gd`](d:/TODO%20GADOT/shadow-ball/Scrips/player_1.gd). Aquí hay un fragmento del código:

```gdscript
extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
    # Aplicar gravedad si no está en el suelo
    if not is_on_floor():
        velocity.y += get_gravity().y * delta
        animated_sprite.play("Jump")
    else:
        # Verificar si se presiona el botón de salto
        if Input.is_action_just_pressed("Saltar"):
            velocity.y = JUMP_VELOCITY
            animated_sprite.play("Jump")
  
    # Obtener dirección de movimiento
    var direction = Input.get_axis("Izquierda", "Derecha")
    if direction != 0:
        velocity.x = direction * SPEED
        animated_sprite.play("Run")
        animated_sprite.flip_h = direction < 0
    else:
        velocity.x = move_toward(velocity.x, 0, SPEED)
        if is_on_floor():
            animated_sprite.play("Idle")
  
    # Mover y deslizar el personaje
    move_and_slide()
```
