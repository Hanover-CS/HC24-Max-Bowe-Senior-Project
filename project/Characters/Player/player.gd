extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	look_at(get_global_mouse_position())
	

func _unhandled_input(event):
	# starts player attack
	if Input.is_action_pressed("player_melee"):
		$AttackBox.monitoring = true
		print("attack is going!", $AttackBox.monitoring)
		$AttackTimer.start(1.2)


func _on_attack_timer_timeout():
	$AttackBox.monitoring = false
	print("Attack has stopped", $AttackBox.monitoring)
