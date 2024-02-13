extends Node

# handles scene changes

class_name CustomSceneManager

@export var Scenes : Dictionary = {}

var currentSceneName : String = ""

# starts the main(first) scene

func _ready():
	var mainScene : StringName = ProjectSettings.get_setting("application/run/main_scene")
	currentSceneName = Scenes.find_key(mainScene)
	
# allows you to add a new scene to the scene list

func addScene(sceneName : String, scenePath : String):
	Scenes[sceneName] = scenePath
	
# remove a scene from the scene list
	
func removeScene(sceneName : String):
	Scenes.erase(sceneName)
	
# standard method of switching scenes
	
func SwitchScene(sceneName : String):
	get_tree().change_scene_to_file(Scenes[sceneName])
	
# restarts a scene, reloading entire tree
	
func restartScene():
	get_tree().reload_current_scene()
	
# closes game

func quitGame():
	get_tree().quit()
	
# helper method for getting a scene's name

func getCurrentSceneName() -> String:
	return currentSceneName
	


