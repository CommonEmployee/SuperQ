extends Node2D

var points:int = 0
var loadoriginal = load("res://Levels/school-room1.tscn")
var or_scene = loadoriginal.instantiate()
#var points = 0
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
	var loadoriginal2 = load("res://Levels/classroom2.tscn")
	var or_scene2 = loadoriginal2.instantiate()
	points = or_scene2.get_node("Player").get_parent().get_points()
	print(points)

func set_points(point:int):
	if point > 0 and point < 11:
		points = point
	else:
		print("ERRO points não está no intervalo entre 0 e 10")
func get_points():
	return points	

