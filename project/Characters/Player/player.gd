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
	print(enemy_in_range)
	

func _unhandled_input(event):
	# starts player attack
	if Input.is_action_pressed("player_melee"):
		$AttackBox.monitoring = true
		print("attack is going!", $AttackBox.monitoring)
		$AttackTimer.start(1.2)


func _on_attack_timer_timeout():
	$AttackBox.monitoring = false
	print("Attack has stopped", $AttackBox.monitoring)

func player():
	pass


func _on_player_hitbox_body_entered(body):
	if (body.has_method("enemy_eye")):
		enemy_in_range = true


func _on_player_hitbox_body_exited(body):
	if (body.has_method("enemy_eye")):
		enemy_in_range = false
		
func enemy_attack():
	if enemy_in_range:
		print("player took damage")
