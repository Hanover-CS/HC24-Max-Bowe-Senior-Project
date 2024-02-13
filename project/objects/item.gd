extends Node2D

signal itemSelected

# Depending on which item the player selects, this method applies a speed or damage boost

func _on_item_list_item_selected(index):
	if index == 0:
		global.playerSpeed += 200
	else: 
		global.playerDamage += 10
	emit_signal("itemSelected")
