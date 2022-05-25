extends KinematicBody2D
onready var sprite = $Sprite
onready var col = $CollisionShape2D
onready var label = $Label
onready var timer = $Timer
onready var tween = $Label/Tween
export var death_time = 1
var alive = true

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func killed():
	queue_free()


func _on_Timer_timeout():
	queue_free()
