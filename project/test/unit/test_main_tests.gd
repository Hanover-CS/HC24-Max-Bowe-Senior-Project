extends GutTest

var player = load('res://Characters/Player/player.gd')

func test_player():
	var _player = player.new()
	_player.enemy_attack()
	
	assert_eq(_player.health, 100, "health should not decrease")
	
	_player.enemy_in_range = true
	_player.enemy_attack()
	assert_eq(_player.health, 80, "player should take 20 damage")
	
	
	
	
	
	
	
