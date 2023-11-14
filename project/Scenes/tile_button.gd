extends Control


var fightScene = load("res://Scenes/main.tscn")

signal _button_clicked(button)


signal _scene_changed

# receives a signal from it's child button on press, changes scenes based on signal

func _on_button_button_up():
	emit_signal("_button_clicked", self)
	if(get_meta("type") == "fight"):
		custom_scene_manager.SwitchScene("fight_scene")
	elif(get_meta("type") == "boss"):
		custom_scene_manager.SwitchScene("fight_scene")
	else:
		custom_scene_manager.SwitchScene("fight_scene")
