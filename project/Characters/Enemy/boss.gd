extends CharacterBody2D

var health = 100
var animations
var sees_player = false
var player
var player_damage: int
var speed = 100
var can_be_attacked = true
var player_in_range = false

signal boss_defeated

# lets an area know that an object is the boss

func boss():
	pass

func _ready():
	player_damage = global.playerDamage
	animations = $BossSprite
	
func _physics_process(delta):
	check_player_seen()

func _process(delta):
	boss_animations()
	check_player_attacking()
	if health <= 0 and !global.bossDead:
		boss_death()
		
# plays animations
		
func boss_animations():
	if(!global.bossDead):
		animations.play("default")
	else:
		animations.play("death")
		
# if the sees_player variable is true, points the boss at player and begins to move toward player

func check_player_seen():
	if(sees_player):
		# simple built-in method that rotates an object to face a set point on the 2D plane
		look_at(player.position)
		# another built in function that moves an object to a point in space
		move_and_collide(((player.position - position)/speed))
		

# checks that the player's attack box is in range, if the player is attacking, and if the boss's
# damage cooldown is over, then starts the damage cooldown and subtract's the player's attack damage from
# the boss's health

func check_player_attacking():
	if global.player_attacking and can_be_attacked and player_in_range:
		can_be_attacked = false
		health -= player_damage
		print(health)
		$DamageCooldown.start()
		
# waits for a signal that says something exited the boss's sight area, then marks that 
# it no longer sees the player if the object was the player

func _on_boss_sight_body_exited(body):
	if (body.has_method("player")):
		sees_player = false
		
# waits for a signal that says something entered the boss's sight area, then marks that 
# it sees the player if the object was the player

func _on_boss_sight_body_entered(body):
	if (body.has_method("player")): 
		player = body
		sees_player = true

# once the damage cooldown timer is over, marks that the boss can be attacked

func _on_damage_cooldown_timeout():
	can_be_attacked = true
	
# globally notes that the boss is dead, stops seeing the player, plays the death animation

func boss_death():
	global.bossDead = true
	sees_player = false
	$DeathAnimation.start()
	print("death timer started")

# waits for the boss's death timer to finish, then deletes the boss object

func _on_death_animation_timeout():
	emit_signal("boss_defeated")
	self.queue_free()
	
# when the boss hitbox is entered, checks if the area that entered it was the player hitbox
# and if so, marks that the player is in range to attack

func _on_hit_box_area_entered(area):
	if area.has_method('player_attack_box'):
		player_in_range = true
		
# called when an area exits its hitbox, will check if player's attack box, if so,
# player_in_range is marked false

func _on_hit_box_area_exited(area):
	if area.has_method('player_attack_box'):
		player_in_range = false
