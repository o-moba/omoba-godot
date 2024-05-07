extends Node3D

var object_scene = null

func spawn_object():
	object_scene = preload("res://mob.tscn")
	
	if object_scene:
		print("Type of object_scene:", typeof(object_scene), " - ", object_scene is PackedScene)
		if object_scene is PackedScene:
			var object_instance = object_scene.instantiate()
			add_child(object_instance)
			object_instance.global_transform.origin = Vector3(0, 0, 0)
			move_to(object_instance, Vector3(10, 0, 0))
		else:
			print("object_scene is not a PackedScene.")
	else:
		print("Failed to load the scene.")
	
	
func move_to(obj, new_position):
	print("Starting move_to: from", obj.transform.origin, "to", new_position)
	var duration = 5.0
	var tween = create_tween()
	tween.tween_property(obj, "position", new_position, duration)


# Called when the node enters the scene tree for the first time.
func _ready():
	$testCamera.set_current(true)
	spawn_object()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
