extends TileMap

@export var numPlatforms: int = 30
@export var numSawblades: int = 15
@export var numCoins: int = 30

var rand = RandomNumberGenerator.new()

var sawbladeScene = load("res://sawblade.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	# physics_layer_0.polygon_0.one_way = false
	generate_platforms()
	generate_sawblades()
	generate_coins()

# Create all the platforms 
# level is 30x30, 1 tile border, (0,0) is top left 
func generate_platforms():
	# set_cells_terrain_connect(2, [Vector2i(12, 27), Vector2i(11, 27), Vector2i(10, 27)], 0, 0, true)
	
	for i in range(numPlatforms):
		var width = rand.randf_range(1, 7)
		var height = rand.randf_range(1, 30)
		var start = rand.randf_range(1, 28 - width)
		
		var platform = []
		
		for j in range(width):
			platform.append(Vector2i(start + j, height))
			
		set_cells_terrain_connect(2, platform, 0, 0, true)
	
# screen is 480 x 480
func generate_sawblades():

	for i in range(numSawblades):
		var blade = sawbladeScene.instantiate()
		blade.position.x = rand.randf_range(10, 480)
		blade.position.y = rand.randf_range(10, 480)
		get_tree().get_root().add_child.call_deferred(blade)
		
	
func generate_coins():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
