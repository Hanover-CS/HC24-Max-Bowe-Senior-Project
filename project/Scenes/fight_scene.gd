extends Node2D

class_name CustomSceneManagerFightScene

var num_enemies: int = 2

var enemies_present = true

var eye_enemy = load('res://Characters/Enemy/enemy_eye.tscn')

func _ready():
	spawn_enemies()
	set_player_health_bar()

# spawns enemies in a random position in the 2D space

func _process(delta):
	if global.enemies.size() == 0:
		global.playerHealth = $Player.health
		custom_scene_manager.SwitchScene("tile_selector")	
	health_bar_follow_player()
	update_health()

func spawn_enemies():
	for i in range(num_enemies):
		var newEyeEnemy = eye_enemy.instantiate()
		newEyeEnemy.z_index = 10
		newEyeEnemy.position = Vector2(randi_range(20, 3000), randi_range(20, 3000))
		add_child(newEyeEnemy)
		
# exit body for testing scene switch

func set_player_health_bar():
	$PlayerHealthBar.max_value = $Player.health

func health_bar_follow_player():
	$PlayerHealthBar.position = $Player.position - Vector2(1000, 800)
	$PlayerHealthLabel.position = $Player.position - Vector2(1000, 815)
	
func update_health():
	$PlayerHealthBar.value = $Player.health
	$PlayerHealthLabel.text = str($Player.health)

func _on_exit_box_body_entered(body):
	custom_scene_manager.SwitchScene("tile_selector")


