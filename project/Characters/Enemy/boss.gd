extends CharacterBody2D

var health = 100
var animations
var sees_player = false
var player
var speed = 100


func _ready():
	animations = $BossSprite
	
func _physics_process(delta):
	check_player_seen()

func _process(delta):
	boss_animations()
	
	
func boss_animations():
		animations.play("default")

	

func _on_boss_sight_body_entered(body):
	if (body.has_method("player")): 
		player = body
		sees_player = true

		
func check_player_seen():
	if(sees_player):
		look_at(player.position)
		move_and_collide(((player.position - position)/speed))

func _on_boss_sight_body_exited(body):
	sees_player = false
