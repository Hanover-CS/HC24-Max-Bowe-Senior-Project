extends CharacterBody2D

var enemy_in_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	look_at(get_global_mouse_position())
	enemy_attack()
	if health <= 0:
		health = 0
		player_alive = false
		get_tree().quit()
	

func player():
	pass


func _on_player_hitbox_body_entered(body):
	if (body.has_method("enemy_eye")):
		enemy_in_range = true


func _on_player_hitbox_body_exited(body):
	if (body.has_method("enemy_eye")):
		enemy_in_range = false
		
func enemy_attack():
	if enemy_in_range and enemy_attack_cooldown:
		health = health - 20
		print("player took damage")
		enemy_attack_cooldown = false
		$AttackCooldown.start()
		print(health)


func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true
