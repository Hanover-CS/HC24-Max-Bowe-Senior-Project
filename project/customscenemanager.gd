extends Node

class_name CustomSceneManager

@export var Scenes : Dictionary = {}

var currentSceneName : String = ""

func _ready() -> void:
	var mainScene : StringName = ProjectSettings.get_setting("application/run/main_scene")
	currentSceneName = Scenes.find_key(mainScene)

func addScene(sceneAlias : String, scenePath : String):
	Scenes[sceneAlias] = scenePath
	
func removeScene(sceneAlias : String):
	Scenes.erase(sceneAlias)
	
func SwitchScene(sceneAlias : String) -> void:
	get_tree().change_scene_to_file(Scenes[sceneAlias])
	
func restartScene():
	get_tree().reload_current_scene()

func quitGame():
	get_tree().quit()

func getCurrentSceneAlias() -> String:
	return currentSceneName
	


