extends MarginContainer

class_name CustomSceneManagerMainMenu

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# listens for input on the start button, starts tile_selector on input

func _on_start_button_gui_input(event):
	if event is InputEventMouseButton:
		custom_scene_manager.SwitchScene("tile_selector")
