extends GutTest

var player = load('res://Characters/Player/player.gd')
var tiles = load('res://Scenes/tiles.gd')
var _player = null

func test_player():
	_player = player.new()
	_player.enemy_attack()
	
	assert_eq(_player.health, 100, "health should not decrease")
	
	_player.enemy_in_range = true
	_player.enemy_attack()
	assert_eq(player.health, 80, "player should take 20 damage")
	
func test_tiles_type_assignment():
	var _tiles = tiles.new()
	var types = _tiles.randomize_types()
	
	assert_eq(types, [])
	
	
	
	
	
	
	
	
