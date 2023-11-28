extends GutTest

var player = load('res://Characters/Player/player.gd')
var tiles = load('res://Scenes/tiles.gd')

func test_player():
	var _player = player.new()
	add_child(_player)
	_player.enemy_attack()
	
	assert_eq(_player.health, 100, "health should not decrease")
	
	_player.enemy_in_range = true
	_player.enemy_attack()
	assert_eq(_player.health, 80, "player should take 20 damage")
	
	_player.free()
	
func test_tiles_type_assignment():
	var _tiles = tiles.new()
	_tiles.numFights = 2
	_tiles.numTiles = 7
	add_child(_tiles)
	
	assert_eq(_tiles.types.size(), 7, "the array should have 7 elements")
	
	_tiles.free()
	
	
	
	
	
	
	
	
