extends CharacterBody3D

var team = "none"
var target = Vector3()

const SPEED = 5.0

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity_value")

func initialize(team):
	team = team
	if team == "white":
		target = Vector3(0, 0, -100)
	if team == "black":
		target = Vector3(0, 0, 100)

func _physics_process(delta):
	var direction = (target - global_transform.origin).normalized()
	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED

	move_and_slide()
