extends Camera3D

var speed = 10.0  # Скорость перемещения камеры
var mouse_sensitivity = 0.2  # Чувствительность мыши

var velocity = Vector3.ZERO  # Текущая скорость

# Временно сохраняем начальную позицию мыши для расчета смещения
var last_mouse_pos = Vector2()

func _ready():
	# Захватить курсор мыши, чтобы он не выходил за пределы окна
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * mouse_sensitivity))
		rotate_x(deg_to_rad(-event.relative.y * mouse_sensitivity))
		# Предотвратим переворот камеры вверх ногами
		rotation_degrees.x = clamp(rotation_degrees.x, -90, 90)

func _process(delta):
	var input_vector = Vector3.ZERO
	if Input.is_action_pressed("ui_up"):
		input_vector.z -= 1
	if Input.is_action_pressed("ui_down"):
		input_vector.z += 1
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1

	# Нормализуем вектор, чтобы диагональное движение не было быстрее
	input_vector = input_vector.normalized()

	# Применяем скорость и перемещаем камеру
	velocity = input_vector * speed
	translate(velocity * delta)
