extends Node2D

class_name CustomSceneManagerFightScene

var num_enemies : int

var enemies_present = true

var level_ending = false

# loads the eye enemy scene so that multiple copies may be dynamically created

var eye_enemy = load('res://Characters/Enemy/enemy_eye.tscn')

# spawns enemies at scene load and randomizes the number of enemies spawned

func _ready():
	num_enemies = randi_range(2,5)
	spawn_enemies()

func _process(delta):
	if(!global.playerDead):
		if global.enemies.size() == 0: 
			global.playerHealth = $Player.health
			display_level_completion()
			if level_ending == false:
				level_ending = true
				$LevelEndTimer.start()
		health_bar_follow_player()
		update_health()
	else:
		$PlayerHealthLabel.text = "0"
		display_death_notice()

# spawns enemies in a random position in the 2D space

func spawn_enemies():
	for i in range(num_enemies):
		var newEyeEnemy = eye_enemy.instantiate()
		newEyeEnemy.z_index = 10
		newEyeEnemy.position = Vector2(randi_range(20, 3000), randi_range(20, 3000))
		add_child(newEyeEnemy)
		
# makes the "you died" label visible
		
func display_death_notice():
	$DeathNotice.position = $Player.position - Vector2(600, 300)
	$DeathNotice.visible = true

# makes the "level complete" label visible

func display_level_completion():
	$LevelCompleteNotice.position = $Player.position - Vector2(700, 300)
	$LevelCompleteNotice.visible = true
	
# tracks the player's position and places the health bar relative to that position

func health_bar_follow_player():
	$PlayerHealthBar.position = $Player.position - Vector2(1000, 800)
	$PlayerHealthLabel.position = $Player.position - Vector2(1000, 815)
	
# changes the value of the health progress bar and the text of its label based on player health
	
func update_health():
	$PlayerHealthBar.value = $Player.health
	$PlayerHealthLabel.text = str($Player.health)

func _on_level_end_timer_timeout():
	custom_scene_manager.SwitchScene("tile_selector")
	
