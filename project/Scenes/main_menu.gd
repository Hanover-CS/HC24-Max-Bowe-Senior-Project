extends MarginContainer

class_name CustomSceneManagerMainMenu

# listens for input on the start button, starts tile_selector on input

func _on_start_button_gui_input(event):
	if event is InputEventMouseButton:
		custom_scene_manager.SwitchScene("tile_selector")
