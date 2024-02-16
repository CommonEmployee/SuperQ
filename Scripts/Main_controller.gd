extends Node2D

#var string_val = "lorem ipslum ipslum lorem, lorem lorem ipslum ipslum, lorem ipslum, lorem ipslum"

func _ready():
	#dal(string_val + string_val2 + string_val3 + string_val4)
	dal("testando de novo")

	#var tes = Label.new()
	#tes.set_text("aaaaaaa")
	#dialogue(string_val,-1,"res://Assets/fonts/Roboto-Black.ttf")
	#add_child(tes)
#func _process(_delta):
	#dialogue("teste2")
func dal(strdal:String = "texto secreto"):
	if has_node("Label"):
		var test = get_node("Label")
		if test.get_text().length() == 0:
			test.set_text(strdal)
			test.visible_characters = 1
		if test.visible_characters < test.get_text().length():
			test.visible_characters += 1
			if has_node("Timer"):
				var tim = get_node("Timer")
				tim.set_wait_time(0.2)
				tim.set_autostart(true)
				await $Timer.timeout
				dal(strdal)
			else:
				var tim = Timer.new()
				tim.name = "Timer"
				tim.timeout.connect(_on_timer_timeout)
				tim.set_wait_time(0.2)
				tim.set_autostart(true)
				add_child(tim)
				await $Timer.timeout
				dal(strdal)

			#print("vezes")
			
		#if test.visible_characters == test.get_text().length():
				#test.set_text("")
	else:
		var tes = Label.new()
		tes.name = "Label"
		add_child(tes)
		dal(strdal)

func _on_timer_timeout():
	pass
	
func dialogue(dialoguestr: String = "texto secreto", dialogue_speed:int = -1, path: String = "font"):
	var label_dialogue = Label.new()
	#control_dl.z_index = 1
	#label_dialogue.z_index = 1
	#add_child(control_dl)
	#control_dl.add_child(label_dialogue)
	add_child(label_dialogue)
	#var font = load("res://Assets/fonts/Roboto-Black.ttf")
	#label_dialogue.add_theme_font_override("font", load(path))
	dialoguestr = dialoguestr + " "
	var start = Time.get_ticks_msec()
	var dialogue1 = dialoguestr
	var dialogue_end = false
	var now = Time.get_ticks_msec()
	if dialogue_speed == -1:
		dialogue_speed = 9000
	var msg = ""
	while dialogue_end == false:
		now = Time.get_ticks_msec()
		var diference = now - start
		if diference > dialogue_speed:
			start = now
			print("dialoguestr.split()[0]:" + dialoguestr.split()[0])
			msg += dialoguestr.split()[0]
			#label_dialogue.text = msg
			print("msg: " + msg)
			label_dialogue.set_text(label_dialogue.get_text() +  dialoguestr.split()[0])
			print("dialoguestr.substr(1): " + dialoguestr.substr(1))
			dialoguestr = dialoguestr.substr(1)
			if dialogue1 == msg:
				#control_dl.queue_free()
				#label_dialogue.queue_free()
				dialogue_end = true
			else:
				pass
				#print(label_dialogue.get_text())
				#label_dialogue.text = msg

func dialogue_big(dialoguestr: Array = ["texto secreto"], dialogue_speed:int = -1):
	pass
