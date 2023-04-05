extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	generate_terrain()
	

# Create all the platforms 
func generate_terrain():
	set_cells_terrain_connect(2, [Vector2i(12, 27), Vector2i(11, 27), Vector2i(10, 27)], 0, 0, true)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
