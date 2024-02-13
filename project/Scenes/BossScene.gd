extends Node2D

func _ready():
	set_health_bar($BossHealthBar, $Boss)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_level_passed()
	health_bar_follow_player()
	update_health()

# looks to see if the boss has been defeated, then hides its health bar, resets global stats
# and starts a timer that will close the level when finished

func check_level_passed():
	if (global.bossDead && $LeaveLevelTimer.is_stopped()):
		$BossHealthBar.visible = false
		$BossHealthLabel.visible = false
		$LeaveLevelTimer.start()
		reset_global_stats()
		
# resets barious global stats
		
func reset_global_stats(): 
	global.player_attacking = false
	global.fightScene = false
	global.types = []
	global.clickedStatus = []
	global.enemies = []
	global.playerHealth = 100
	global.playerPosition = Vector2(0,0)
	
# sets a character's initial health progress bar value

func set_health_bar(bar: ProgressBar, character: CharacterBody2D):
	bar.max_value = character.health
	
# moves health bars according to player position

func health_bar_follow_player():
	$PlayerHealthBar.position = $Player.position - Vector2(1000, 800)
	$PlayerHealthLabel.position = $Player.position - Vector2(1000, 815)
	$BossHealthBar.position = $Player.position - Vector2(250, 950)
	$BossHealthLabel.position = $Player.position - Vector2(250, 975)
	
# Updates health bars
	
func update_health():
	$PlayerHealthBar.value = $Player.health
	$PlayerHealthLabel.text = str($Player.health)
	if !global.bossDead:
		$BossHealthBar.value = $Boss.health
		$BossHealthLabel.text = str($Boss.health)
	else: 
		$BossHealthBar.value = 0
		$BossHealthLabel.text = str(0)
	
# on timeout of leave level timer, switches scene back to the main menu

func _on_leave_level_timer_timeout():
	print("leaving level")
	custom_scene_manager.SwitchScene("main_menu")
