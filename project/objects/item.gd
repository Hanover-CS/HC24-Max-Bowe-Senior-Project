extends Node2D

signal itemSelected

# Depending on which item the player selects, this method applies a speed or damage boost

func _on_item_list_item_selected(index):
	if index == 0:
		global.playerSpeed += 200
	elif index == 1: 
		global.playerDamage += 10
	else:
		global.playerHealth += 10
	emit_signal("itemSelected")

# makes options visible when player touches item object

func _on_area_2d_area_entered(area):
	$ItemList.visible = true
