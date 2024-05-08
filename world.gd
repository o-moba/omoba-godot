extends Node3D

var object_scene = null

func spawn_defenders(team):
	object_scene = preload("res://npc/defender/defender.tscn")
	
	var z_position = -100
	if team == "white":
		z_position = 100
	
	if object_scene:
		print("Type of object_scene:", typeof(object_scene), " - ", object_scene is PackedScene)
		if object_scene is PackedScene:
			for i in range(3):
				var object_instance = object_scene.instantiate()
				add_child(object_instance)
				var body = object_instance.get_node("CharacterBody3D")
				body.initialize(team)
				object_instance.global_transform.origin = Vector3(i * 2, 1, z_position)
				
		else:
			print("object_scene is not a PackedScene.")
	else:
		print("Failed to load the scene.")

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_defenders("black")
	spawn_defenders("white")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
