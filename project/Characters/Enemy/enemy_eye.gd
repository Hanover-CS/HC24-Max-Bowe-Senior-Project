extends CharacterBody2D

var health : int = 50
var can_take_damage = true
var player_in_range = false
var player_damage : int
var player_chase = false
var blinking = false

var player = null
var animations = null

var speed = 35

# ready method, assigns eye animations and sets blinking timer randomly

func _ready():
	global.enemies.append(self)
	player_damage = global.playerDamage
	animations = $EyeSprite
	$BlinkAnimationTimer.wait_time = randi_range(3,5)
	
# physics process, sets eye character body to follow player body when 
# the player enters its sight bubble

func _physics_process(delta):
	if player_chase:
		move_and_collide(((player.position - position)/speed))

# process function, run every few milliseconds

func _process(delta):
	damage_enemy()

# used to identify eye enemy body vs. other foreign bodies

func enemy_eye():
	pass

# called when a body enters its hitbox, will check if player, if so,
# player_in_range is marked true

func _on_eye_hitbox_body_entered(body):
	if body.has_method('player'):
		player_in_range = true

# called when a body exits its hitbox, will check if player, if so,
# player_in_range is marked false

func _on_eye_hitbox_body_exited(body):
	if body.has_method('player'):
		player_in_range = false

# handles damage dealt by player, has a cooldown on how often player can damage enemy

func damage_enemy():
	if player_in_range and global.player_attacking and can_take_damage:
		animations.play("damaged")
		$DamageCooldown.start()
		can_take_damage = false
		health -= player_damage
		print("eye has taken ", player_damage, " damage, current health is: ", health)
	if health <= 0:
		var index = global.enemies.find(self)
		global.enemies.pop_at(index)
		self.queue_free()
		

# run when the damage cooldown ends

func _on_damage_cooldown_timeout():
	can_take_damage = true
	
# run when player enters the enemy's sight bubble

func _on_sight_bubble_body_entered(body):
	if body.has_method('player'):
		player = body
		player_chase = true
		
# run when player exits the enemy's sight bubble
		
func _on_sight_bubble_body_exited(body):
	if body.has_method('player'):
		player = null
		player_chase = false

# runs when blink animation timer ends, will play default and blinking animations every other time

func _on_blink_animation_timer_timeout():
	if blinking:
		animations.play("blink")
		$BlinkAnimationTimer.start()
		blinking = false
	else:
		animations.play("default")
		blinking = true
		$BlinkAnimationTimer.start()
	
