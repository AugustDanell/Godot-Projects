extends Node2D
onready var spawner = $Spawner
onready var roof_col = $Roof/ColorRect
onready var floor_col = $Floor/ColorRect
onready var wall_col = $Wall/ColorRect
onready var title = $Title
onready var scale_piece = 0.5

var rng = RandomNumberGenerator.new()
var start_color = Color(255, 255, 255)
var next_color = Color(0,0,0)
var t = 1.0
var h = 0.005
var piece = null

onready var long = preload("res://Pieces/long.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	_spawn_piece()
	
func _randomize_colors():
	rng.randomize()
	start_color = next_color
	next_color = Color(rng.randf_range(0,1.0), rng.randf_range(0, 1.0), rng.randf_range(0, 1.0))
	print(next_color)

func _physics_process(delta):
	if(t >= 1.0):
		t = 0.0
		_randomize_colors()
	else:		
		roof_col.color = start_color.linear_interpolate(next_color, t)
		wall_col.color = start_color.linear_interpolate(next_color, t)
		floor_col.color = start_color.linear_interpolate(next_color, t)
		title.modulate = start_color.linear_interpolate(next_color, t) 
		t += h
		
		
func _spawn_piece():
	piece = long.instance()
	piece.scale = Vector2(scale_piece, scale_piece)
	spawner.add_child(piece)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
