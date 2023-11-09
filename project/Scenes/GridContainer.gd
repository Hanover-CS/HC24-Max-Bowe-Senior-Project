extends GridContainer

var numFights = 10

var tiles = [] 

# Called when the node enters the scene tree for the first time.
func _ready():
	populate_grid() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func populate_grid():
	for i in range(numFights):
		var button = Button.new()
		button.icon = 'fight-tile.png'
		
		
		
