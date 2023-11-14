extends Node2D

class_name CustomSceneManagerFightScene

var num_enemies = 6

var eye_enemy = load('res://Characters/Enemy/enemy_eye.tscn')

func _ready():
	spawn_enemies()


# spawns enemies in a random position in the 2D space	
func spawn_enemies():
	for i in range(num_enemies):
		var newEyeEnemy = eye_enemy.instantiate()
		newEyeEnemy.position = Vector2(randi_range(20, 1000), randi_range(20, 1000))
		add_child(newEyeEnemy)
		
	
