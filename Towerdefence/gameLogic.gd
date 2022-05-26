extends Node2D
export var gold = 300
export var passive_income = 100
export var enem_kill = 5
export var button_mapping = {}

onready var BP = $BuyingPhase
onready var cannon = preload("res://cannon.tscn")
onready var enemy = preload("res://enemy.tscn")
onready var b1 = $"BuyingPhase/Tower Buttons/Button"
onready var gold_label = $"BuyingPhase/Game Interface/Label"
onready var path = $PathFollow2D/PathFollow2D
onready var final_area = $"Take Damage/Area2D"
onready var health_label = $"Take Damage/healthLabel"
var enemies = 0
var cannon_cost = 150
var health = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	gold_label.text = "Gold %d" % (gold)
	
	if(enemies == 0 and not BP.visible):
		_finished_round()
	
	var bodies = final_area.get_overlapping_bodies()
	if(len(bodies) > 0):
		for i in range(len(bodies)):
			health -= 1
			enemies -= 1	
			bodies[i].queue_free()
			
		health_label.text = "Health: %d"%(health)
		
func _tryToBuildTower(button):
	if(gold >= cannon_cost):
		gold -= cannon_cost
		var tower_trans = BP.get_cord(int(button))
		BP.removeTower(int(button))
		
		var can_inst = cannon.instance()
		can_inst.transform = tower_trans
		can_inst.scale.x = 1
		can_inst.scale.y = 1
		can_inst.position.x += 20
		can_inst.position.y += 20
		can_inst.connect("killedEnemy", self, "killedEnem")
		add_child(can_inst)


func _on_newlevel_pressed():
	BP.visible = false
	enemies += 3
	path.offset = 0
	for i in range(enemies):
		var enemyInst = enemy.instance()
		path.add_child(enemyInst)

func _finished_round():
	BP.visible = true
	path.offset = 0
	gold += passive_income

func killedEnem():
	enemies -= 1
	gold += enem_kill

func _on_farms_pressed():
	if(gold >= 100):
		gold -= 100
		passive_income += 10
