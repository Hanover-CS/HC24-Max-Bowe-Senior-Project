extends Control


var fightScene = load("res://Scenes/main.tscn")


signal _scene_changed

func _on_button_button_up():
	for i in global.tiles:
			if(i == self):
				i.set_meta("clicked", true)
	if(get_meta("type") == "fight"):
		custom_scene_manager.SwitchScene("fight_scene")
	elif(get_meta("type") == "boss"):
		pass
	else:
		pass
