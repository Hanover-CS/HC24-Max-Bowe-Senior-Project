extends CharacterBody2D

var enemy_in_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true
var attacking = false
var animations

func _ready():
	animations = $PlayerSprite

func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	look_at(get_global_mouse_position())
	player_animations()
	player_attack()
	enemy_attack()
	if health <= 0:
		health = 0
		player_alive = false
		get_tree().quit()
	

func player():
	pass
	
# plays player character animations
	
func player_animations():
	if (attacking):
		animations.play("player_attack")
	else:
		animations.play("default")
		

# runs when a foreign body enters the player's hitbox

func _on_player_hitbox_body_entered(body):
	if (body.has_method("enemy_eye")):
		enemy_in_range = true

# runs when a foreign body exits the player's hitbox

func _on_player_hitbox_body_exited(body):
	if (body.has_method("enemy_eye")):
		enemy_in_range = false

# starts a player attack
		
func player_attack():
	if Input.is_action_just_pressed("player_melee"):
		global.player_attacking = true
		attacking = true
		$PlayerAttackCooldown.start()
		
# checks to see if an enemy can attack the player
		
func enemy_attack():
	if enemy_in_range and enemy_attack_cooldown:
		health = health - 20
		print("player took damage")
		enemy_attack_cooldown = false
		$EnemyAttackCooldown.start()
		print(health)
		
# runs when the enemy's attack cooldown ends	

func _on_enemy_attack_cooldown_timeout():
	enemy_attack_cooldown = true
	
# runs when the player's attack cooldown ends, update global singleton

func _on_player_attack_cooldown_timeout():
	global.player_attacking = false
	attacking = false
	



