extends Node2D



# Switches back to tile selection screen when user picks an option

func _on_item_item_selected():
	custom_scene_manager.SwitchScene("tile_selector")
