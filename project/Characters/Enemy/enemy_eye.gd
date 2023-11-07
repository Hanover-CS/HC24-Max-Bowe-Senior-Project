extends CharacterBody2D

var health = 100
var can_take_damage = true
var player_in_range = false

func _process(delta):
	damage_enemy()

func enemy_eye():
	pass


func _on_eye_hitbox_body_entered(body):
	if body.has_method('player'):
		player_in_range = true


func _on_eye_hitbox_body_exited(body):
	if body.has_method('player'):
		player_in_range = false

func damage_enemy():
	if player_in_range and global.player_attacking and can_take_damage:
		$DamageCooldown.start()
		can_take_damage = false
		health -= 20
		print("eye has taken 20 damage, current health is: ", health)
	if health <= 0:
		self.queue_free()
		


func _on_damage_cooldown_timeout():
	can_take_damage = true
