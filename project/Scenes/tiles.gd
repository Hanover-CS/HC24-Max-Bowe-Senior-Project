extends GridContainer

var tile_button = load("res://Scenes/tile_button.tscn")

const numFights = 7
const numBoss = 1
const numMystery = 4
const numTiles = numFights + numBoss + numMystery

var tiles = []

# Called when the node enters the scene tree for the first time.
func _ready():
	tiles = global.tiles
	if(tiles.size() == 0):
		populate_tiles_array()
	populate_grid()
	print("populated")
	$SaveTimer.start()
	global.tiles = tiles


func populate_tiles_array():
	print(tiles)
	for i in range(numTiles):
		var button = tile_button.instantiate()
		button.get_child(0).icon = ResourceLoader.load("res://graphics/mystery-tile.png")
		tiles.append(button)
		button.set_meta("type", "fight")
		
func populate_grid():
	for i in range(tiles.size()):
		if(tiles[i].get_meta("clicked")):
			tiles[i].get_child(0).icon = ResourceLoader.load("res://graphics/fight-tile.png")
		add_child(tiles[i])
		
func randomizeTypes():
	var types = []
	var fight = numFights
	var boss = numBoss
	var mystery = numMystery
#	for i in numTiles:
#		if fight > 0 and boss > 0 and mystery > 0:
#			var randomTile = randi_range(1, numTiles-i)
#			if(randomTile > fight):
#				if(randomTile > fight+1):
#					types.append("mystery")
#					mystery -= 1
#				else:
#					types.append("boss")
#					boss -= 1
#			else:
#				types.append("fight")
#				fight -= 1
#		if fight == 0 and boss > 0 and mystery > 0:
#			var randomTile = randi_range(1, numTiles-i)
#			if(randomTile > boss):
#				types.append("mystery")
#				mystery -= 1
#			else:
#				types.append("boss")
#				boss -= 1 
	return types
			
					
					
			
