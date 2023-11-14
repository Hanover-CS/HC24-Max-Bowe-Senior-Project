extends Node2D



func _ready():
	remove_child($FightScene)
	remove_child($TileSelector)

func _on_exit_box_body_entered(_body):
	remove_child($FightScene)


func _on_tile_selector_remove_tile_selector():
	remove_child($TileSelector)
	add_child($FightScene)


func _on_main_menu_remove_menu():
	get_tree().root.remove_child($MainMenu)
	add_child($TileSelector)
