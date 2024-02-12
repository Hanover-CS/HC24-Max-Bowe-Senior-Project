extends CharacterBody2D

var health = 100
var animations
var sees_player = false
var player
var speed = 100
var can_be_attacked = true
var player_in_range = false

signal boss_defeated

func boss():
	pass

func _ready():
	animations = $BossSprite
	
func _physics_process(delta):
	check_player_seen()

func _process(delta):
	boss_animations()
	check_player_attacking()
	if health <= 0 and !global.bossDead:
		boss_death()
		
func boss_animations():
	if(!global.bossDead):
		animations.play("default")
	else:
		animations.play("death")

func check_player_seen():
	if(sees_player):
		# simple built-in method that rotates an object to face a set point on the 2D plane
		look_at(player.position)
		# another built in function that moves an object to a point in space
		move_and_collide(((player.position - position)/speed))

func check_player_attacking():
	if global.player_attacking and can_be_attacked:
		can_be_attacked = false
		health -= 10
		print(health)
		$DamageCooldown.start()

func _on_boss_sight_body_exited(body):
	sees_player = false

func _on_boss_sight_body_entered(body):
	if (body.has_method("player")): 
		player = body
		sees_player = true


func _on_damage_cooldown_timeout():
	can_be_attacked = true

func boss_death():
	global.bossDead = true
	sees_player = false
	$DeathAnimation.start()
	print("death timer started")


func _on_death_animation_timeout():
	emit_signal("boss_defeated")
	self.queue_free()
	
