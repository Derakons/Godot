extends Control

# Llamado cuando el nodo entra en el árbol de la escena por primera vez.
func _ready() -> void:
    # Obtenemos el tamaño de la pantalla al iniciar
    var screen_size = DisplayServer.screen_get_size()
    # Establecemos un tamaño inicial de ventana (por ejemplo, 80% del tamaño de la pantalla)
    var window_size = Vector2i(screen_size.x * 0.8, screen_size.y * 0.8)
    # Centramos la ventana
    var window_position = Vector2i((screen_size.x - window_size.x) / 2, (screen_size.y - window_size.y) / 2)
    DisplayServer.window_set_size(window_size)
    DisplayServer.window_set_position(window_position)

# Función para manejar el cambio de pantalla completa
func _on_fullscreen_toggled(button_pressed: bool) -> void:
    if button_pressed:
        DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
    else:
        DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
        # Cuando volvemos a modo ventana, reajustamos el tamaño y la posición
        var screen_size = DisplayServer.screen_get_size()
        var window_size = Vector2i(screen_size.x * 0.8, screen_size.y * 0.8)
        var window_position = Vector2i((screen_size.x - window_size.x) / 2, (screen_size.y - window_size.y) / 2)
        DisplayServer.window_set_size(window_size)
        DisplayServer.window_set_position(window_position)

# Función para manejar el cambio de volumen
func _on_volumen_2_value_changed(value: float) -> void:
    AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))

func _on_atras_pressed() -> void:
    get_tree().change_scene_to_file("res://niveles/control.tscn")
