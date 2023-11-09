extends GridContainer

var tile_button = load("res://Scenes/tile_button.tscn")

var numFights = 12

var tiles = []

signal pressed(button)

# Called when the node enters the scene tree for the first time.
func _ready():
	populate_tiles_array()
	populate_grid()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func populate_tiles_array():
	for i in range(numFights):
		var button = tile_button.instantiate()
		button.get_child(0).icon = ResourceLoader.load("res://graphics/mystery-tile.png")
		tiles.append(button)
		button.set_meta("type", "fight")
		
func populate_grid():
	for i in range(tiles.size()):
		add_child(tiles[i])
	



		

