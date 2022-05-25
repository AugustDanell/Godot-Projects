extends PathFollow2D
export var speed = 150

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	offset = 0

func _physics_process(delta):
	set_offset(get_offset()+speed*delta)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
