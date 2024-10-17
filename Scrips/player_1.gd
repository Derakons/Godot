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
