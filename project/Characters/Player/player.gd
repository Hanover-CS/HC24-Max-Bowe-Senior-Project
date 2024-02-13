extends CharacterBody2D

var enemy_in_range = false
var enemy_attack_cooldown = true
var health: int
var speed: int
var player_alive = true
var death_position = Vector2(0,0)
var boss_in_range = false
var attacking = false
var laser_sound_active = false
var death_sequence_started = false
var animations
var enemyAttackCooldown: Timer
var playerAttackCooldown: Timer

# initializes various things

func _ready():
	health = global.playerHealth
	speed = global.playerSpeed
	animations = $PlayerSprite
	
	createEnemyTimer()
	
	createPlayerTimer()
	
# standard process, handles movement and attack logic

func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	look_at(get_global_mouse_position())
	player_animations()
	player_attack()
	enemy_attack()
	global.playerPosition = position
	if health <= 0:
		health = 0
		global.playerDead = true
		if !death_sequence_started:
			player_death()
		position = death_position
		
	
# used to identify if an object that enters a certain area is the player

func player():
	pass
	
# holds the player in place and makes it invisible, also starts countdown to program close

func player_death():
	death_position = position
	death_sequence_started = true
	visible = false
	$DeathTimer.start()
	
# plays player character animations and plays laser sound
	
func player_animations():
	if (attacking):
		animations.play("player_attack")
		if (!laser_sound_active):
			$LaserSound.play()
			laser_sound_active = true
	else:
		animations.play("default")
		

# runs when a foreign body enters the player's hitbox

func _on_player_hitbox_body_entered(body):
	if (body.has_method("enemy_eye")):
		enemy_in_range = true
	if (body.has_method("boss")):
		boss_in_range = true

# runs when a foreign body exits the player's hitbox

func _on_player_hitbox_body_exited(body):
	if (body.has_method("enemy_eye")):
		enemy_in_range = false
	if (body.has_method("boss")):
		boss_in_range = false
		
# starts a player attack

func player_attack():
	if (Input.is_action_just_pressed("player_melee") and attacking == false ):
		global.player_attacking = true
		attacking = true
		playerAttackCooldown.start()
		
# checks to see if an enemy can attack the player
		
func enemy_attack():
	if enemy_in_range and enemy_attack_cooldown:
		health -= 5
		print("player took damage")
		enemy_attack_cooldown = false
		enemyAttackCooldown.start()
		print(health)
	if boss_in_range and enemy_attack_cooldown and !global.bossDead:
		health -= 7
		print("player took damage from boss")
		enemy_attack_cooldown = false
		enemyAttackCooldown.start()
		print(health)
		
# runs when the enemy's attack cooldown ends	

func _on_enemy_attack_cooldown_timeout():
	enemy_attack_cooldown = true
	
# runs when the player's attack cooldown ends, update global singleton

func _on_player_attack_cooldown_timeout():
	attacking = false
	global.player_attacking = false
	laser_sound_active = false
	
# both of the following functions start attack cooldown timers
func createEnemyTimer():
	enemyAttackCooldown = Timer.new()
	enemyAttackCooldown.wait_time = 0.85
	add_child(enemyAttackCooldown)
	enemyAttackCooldown.timeout.connect(_on_enemy_attack_cooldown_timeout)
	
func createPlayerTimer():
	playerAttackCooldown = Timer.new()
	playerAttackCooldown.wait_time = 0.75
	add_child(playerAttackCooldown)
	playerAttackCooldown.timeout.connect(_on_player_attack_cooldown_timeout)

func _on_death_timer_timeout():
	custom_scene_manager.quitGame()
