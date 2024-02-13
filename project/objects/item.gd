extends Node2D

signal itemSelected

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_list_item_selected(index):
	if index == 0:
		global.playerSpeed += 50
	else: 
		global.playerDamage += 10
	emit_signal("itemSelected")
