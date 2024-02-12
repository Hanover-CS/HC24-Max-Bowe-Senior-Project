extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	position = global.playerPosition - Vector2(500, 300)


func _on_boss_boss_defeated():
	visible = true
