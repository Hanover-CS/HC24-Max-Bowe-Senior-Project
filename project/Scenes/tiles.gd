extends GridContainer

var tile_button = load("res://Scenes/tile_button.tscn")

var numFights: int = 7
var numBoss: int = 1
var numMystery: int = 4
var numTiles: int = numFights + numBoss + numMystery


var tiles = []
var types = []
var clickedStatus = []

# Called when the node enters the scene tree for the first time. 

func _ready():
	types = global.types
	if(types.size() == 0):
		types = randomizeTypes()
		createInitialClickStatus()
	else:
		clickedStatus = global.clickedStatus
	populate_tiles_array()
	populate_grid()
	print("populated")

# populates an array of tiles(buttons), instantiating each and setting certain properties

func populate_tiles_array():
	for i in range(numTiles):
		var button = tile_button.instantiate()
		button.set_meta("type", types[i])
		button.set_meta("clicked", clickedStatus[i])
		setTypeIcon(button)
		tiles.append(button)
		button._button_clicked.connect(on_button_clicked)
		
# adds buttons from the tiles array to the GridContainer titles "Tiles"
		
func populate_grid():
	for i in range(tiles.size()):
		add_child(tiles[i])
		
# creates an array of types, organized randomly
		
func randomizeTypes():
	for i in range(numFights):
		types.append("fight")
	for i in range(numBoss):
		types.append("boss")
	for i in range(numMystery):
		types.append("mystery")
	types.shuffle()
	return types
	
# sets all entries in the clickStatus array to false and assigns that array to the global array
	
func createInitialClickStatus():
	for i in numTiles:
		clickedStatus.append("false")
	global.clickedStatus = clickedStatus
	
# sets a given tile's icon depending on type and whether it's revealed
	
func setTypeIcon(button):
	if button.get_meta("clicked") == "true":
		match button.get_meta("type"):
			"fight":
				button.get_child(0).icon = ResourceLoader.load("res://graphics/fight-tile.png")
			"mystery":
				button.get_child(0).icon = ResourceLoader.load("res://graphics/mystery-tile.png")
			"boss":
				button.get_child(0).icon = ResourceLoader.load("res://graphics/boss-tile.png")
	else:
		button.get_child(0).icon = ResourceLoader.load("res://graphics/unexplored-tile.png")
				
				
# records that a click has been made on a given tile when signalled

func on_button_clicked(button):
	var index = tiles.find(button)
	clickedStatus[index] = "true"
	global.clickedStatus = clickedStatus

# listens for input from exit button, quits on press

func _on_button_pressed():
	custom_scene_manager.quitGame()
