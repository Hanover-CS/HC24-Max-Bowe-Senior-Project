extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_level_passed()


func check_level_passed():
	if (global.bossDead):
		$LeaveLevelTimer.start()
		


func _on_leave_level_timer_timeout():
	custom_scene_manager.SwitchScene("main_menu")
