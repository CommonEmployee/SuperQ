extends Sprite2D

var speed:float = 350.0
var up_limit:float = 610
var down_limit:float = 37
var right_limit:float = 1112
var left_limit:float = 40
func _process(delta):
	var directionx = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	var directiony = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	if directionx != 0:
		if position.x + directionx * speed * delta > left_limit and position.x + directionx * speed * delta < right_limit:
			self.position.x += directionx * speed * delta
	if directiony !=0:
		if position.y + directiony * speed * delta > down_limit and position.y + directiony * speed * delta < up_limit:
			self.position.y += directiony * speed * delta
