extends Control
signal tryToBuildTower(button)
signal tryToBuildQuarry(button)

onready var button1 = $"Tower Buttons/Button"
onready var button2 = $"Tower Buttons/Button2"
onready var button3 = $"Tower Buttons/Button3"
onready var button4 = $"Tower Buttons/Button4"
onready var button5 = $"Tower Buttons/Button5"
onready var button6 = $"Tower Buttons/Button6"
onready var button7 = $"Tower Buttons/Button7"
onready var button8 = $"Tower Buttons/Button8"

onready var button_list = [button1, button2, button3, button4, button5, button6, button7, button8]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func removeTower(index):
	button_list[index].queue_free()

func get_cord(index):
	return button_list[index].get_global_transform()

func _on_Button_pressed():
	emit_signal("tryToBuildTower", 0)


func _on_Button2_pressed():
	emit_signal("tryToBuildTower", 1)


func _on_Button3_pressed():
	emit_signal("tryToBuildTower", 2)

func _on_Button4_pressed():
	emit_signal("tryToBuildTower", 3)


func _on_Button5_pressed():
	emit_signal("tryToBildQuarry", 4)


func _on_Button6_pressed():
	emit_signal("tryToBildQuarry", 5)
	
func _on_Button7_pressed():
	emit_signal("tryToBildQuarry", 6)

func _on_Button8_pressed():
	emit_signal("tryToBildQuarry", 7)
