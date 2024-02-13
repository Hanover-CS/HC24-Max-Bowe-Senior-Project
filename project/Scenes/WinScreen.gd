extends Control


func _process(delta):
	
	# simply positions the win message according to the player
	
	position = global.playerPosition - Vector2(500, 300)

# waits for a signal saying that the boss has been defeated, then makes win message visible

func _on_boss_boss_defeated():
	visible = true
