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
	
func player_animations():
	if (attacking):
		animations.play("player_attack")
	else:
		animations.play("default")
		


func _on_player_hitbox_body_entered(body):
	if (body.has_method("enemy_eye")):
		enemy_in_range = true


func _on_player_hitbox_body_exited(body):
	if (body.has_method("enemy_eye")):
		enemy_in_range = false
		
func player_attack():
	if Input.is_action_just_pressed("player_melee"):
		global.player_attacking = true
		attacking = true
		$PlayerAttackCooldown.start()
		
func enemy_attack():
	if enemy_in_range and enemy_attack_cooldown:
		health = health - 20
		print("player took damage")
		enemy_attack_cooldown = false
		$EnemyAttackCooldown.start()
		print(health)
		

func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true


func _on_player_attack_cooldown_timeout():
	global.player_attacking = false
	attacking = false
	
