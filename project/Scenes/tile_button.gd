extends Control


func _on_button_button_up():
	if(get_meta("type") == "fight"):
		$Button.icon = ResourceLoader.load("res://graphics/fight-tile.png")
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
	elif(get_meta("type") == "boss"):
		pass
	else:
		pass
