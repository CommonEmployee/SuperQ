extends Node2D

signal game_finished
var points:int = 0
var loadoriginal = load("res://Levels/school-room1.tscn")
var or_scene = loadoriginal.instantiate()
func _ready():
	var brown_medal = or_scene.get_node("brown").duplicate()
	var silver_medal = or_scene.get_node("silver").duplicate()
	var gold_medal = or_scene.get_node("gold").duplicate()
	add_child(brown_medal)
	add_child(silver_medal)
	add_child(gold_medal)
	var brown_check = or_scene.get_node("brown_check").duplicate()
	var silver_check = or_scene.get_node("silver_check").duplicate()
	var gold_check = or_scene.get_node("gold_check").duplicate()
	add_child(brown_check)
	add_child(silver_check)
	add_child(gold_check)
	var original_node = or_scene.get_node("brown_check").get_parent().help("listar funções")
	self.game_finished.connect(acabou)

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		set_points(get_points() + 1)
		print(points)
	
	if Input.is_action_just_pressed("ui_down"):
		var scene1 = load("res://Levels/classroom1.tscn").instantiate()
		scene1.get_node("Player").get_parent().set_points(get_points())
		get_tree().get_root().add_child(scene1)
		self.queue_free()

func acabou():
	print("acabou o jogo")

func set_points(point:int):
	if point > 0 and point < 11:
		points = point
	else:
		game_finished.emit()
func get_points():
	return points
