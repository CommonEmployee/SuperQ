extends Node2D
#a ideia do jogo era ser um jogo de perguntas e respostas onde cada fase teria cinco opções de respsota
#poderia ser uma sala de alavancas ou botões
# no incio de cada fase teria um dialogo da pergunta aparecendo aos poucos
# teria uma hud com medalha bronze, medalha de prata e medalha de ouro, com sinal de check
# cada meldalha daria sinal de check pela quantidae de perguntas acertadas dessa vez
#deveria ter menu inicial
#deveria ter apenas 10 perguntas por sessão de jogo
#deveria ser fácil adicionar perguntas
# deveria ter pelo menos umas 30 perguntas
# deveria desafios de puzzle e plataforma para cada um dos dois mapas de alavanca e dos botões
# deveria ter um jeito único de chegar em cada alavanca ou botão
# deveria ter uma tela final diferente para cada checagem de medalha
# deveria ter uma tela final para quem não conseguiu nenhuma medalha ou seja acertou poucas ou nenhuma questão
#deveria ter algum método no jogo de ver o texto placeholder paras os dialogos da pergunta
# deveria ser possivel ver o placeholder que está escrito "texto secreto"
# Esta é a documentação da minha função.
# Ela faz algo muito útil.
#func minhaFuncao(parametro1: int, parametro2: String) -> bool:
#    """
#    Documentação detalhada da minha função.
	
#    :param parametro1: Descrição do primeiro parâmetro.
#    :param parametro2: Descrição do segundo parâmetro.
#    :return: Descrição do valor de retorno.
#    """
#    # Corpo da função aqui.
#    return true
var string_val = "lorem ipslum ipslum lorem, lorem lorem ipslum ipslum, lorem ipslum, lorem ipslum"
var str1 = string_val + string_val + string_val + string_val
var str2 = format(str1)
var fix:bool = false
var last_points:int = 0
var points:int = 0
var step:int = 0
var current_dialogue:String = ""
func _ready():
	help("list")
	#dal(string_val + string_val2 + string_val3 + string_val4)
	#dal("testando de \nnovo")
	

	
	#var tes = Label.new()
	#tes.set_text("aaaaaaa")
	#add_child(tes)
func _process(_delta):
	if step == 0 and has_node("Label") == false:
		current_dialogue = "Esse jogo é simples você deve prestar atenção na pergunta e ir até a alavanca ou botão na resposta correta, use WSAD para andar e Enter para pular o dialogo ou interagir com os botões ou alavancas, conforme vai respondendo as medalhas vão avaliar seu sucesso, tente acertar todas as perguntas, boa sorte, se quiser ver a mensagem de novo aperte z"
		dal(format(current_dialogue))
		#step = 1
	if step == 1 and has_node("Label") == false:
		current_dialogue = "Se entendeu as regras e está pronto para começar aperte Enter, se não estiver pronto aperte z para voltar"
		dal(format(current_dialogue))
	if step == 2:
		var next_room = room_selector()
		#print(next_room)
		pass
		#start the game
	if points > last_points:
		UI_score()
		last_points = points
	if has_node("ColorRect1") and fix == false:
		UIdes_fx(220.0)
	if Input.is_action_just_pressed("z_back"):
		#if has_node("Label") == false:
			#step -= 1
		if has_node("Label") and step == 1:
			var a = get_node("Label").get_text().length()
			var b = get_node("Label").visible_characters
			if a == b:
				end_dialogue()
				step -=1
		#fade_out(get_node("silver"), 0.9)
		#dal(str2)
		#points += 2
	if Input.is_action_just_pressed("ui_accept"):
		#end_dialogue()
		if has_node("Label"):
			var a = get_node("Label").get_text().length()
			var b = get_node("Label").visible_characters
			if a == b:
				end_dialogue()
				step += 1
			else:
				end_dialogue()


func get_fix():
	return fix

func set_fix(fix1:bool):
	fix = fix1

func set_last_points(last_points1:int):
	last_points = last_points1
	
func get_last_points():
	return last_points

func set_points(points1:int):
	points = points1

func get_points():
	return points
	
func room_selector():
	var next_room_number = RandomNumberGenerator.new()
	next_room_number.randomize()
	var next_room:int = next_room_number.randi_range(1,2)
	return next_room
	
func UI_score():
	if points > 0:
		var imagem = load("res://Assets/imagens/random_ui_item/complete1.png")
		get_node("brown_check").texture = imagem
	if points > 4:
		var imagem = load("res://Assets/imagens/random_ui_item/complete1.png")
		get_node("silver_check").texture = imagem
	if points > 9:
		var imagem = load("res://Assets/imagens/random_ui_item/complete1.png")
		get_node("gold_check").texture = imagem    
func UIdes_fx(fix_number_x:float = -199999.0 , fix_number_y:float = -199999.0):
	fix = true
	if fix_number_x != -199999.0:
		get_node("ColorRect1").position.x += fix_number_x
		get_node("Label").position.x += fix_number_x
	if fix_number_y != -199999.0:
		get_node("ColorRect1").position.y += fix_number_y
		get_node("Label").position.y += fix_number_y		
	
func fade_in(node1:Node, vel:float = 0.1):
	if has_node("fade_in_timer"):
		var timer = get_node("fade_in_timer")
		timer.set_wait_time(vel)
		timer.set_autostart(true)
	else:
		var timer = Timer.new()
		timer.set_name("fade_in_timer")
		timer.set_wait_time(vel)
		timer.set_autostart(true)
		add_child(timer)
		#await $Timer.timeout
	var obj = node1
	if obj.modulate.a == 1.0:
		obj.modulate.a = 0.0
	if obj.modulate.a < 1.0:
		obj.modulate.a += 0.1
		var timer = get_node("fade_in_timer")
		await $fade_in_timer.timeout
		if obj.modulate.a >= 1.0:
			timer = get_node("fade_in_timer")
			timer.queue_free()
		else:
			fade_in(obj)
			
func fade_out(node2:Node, vel:float= 0.3):
	var timer = Timer.new()
	timer.set_name("fade_out_timer")
	timer.set_wait_time(vel)
	timer.set_autostart(true)
	add_child(timer)
	var obj = node2
	var c = [1,2,3,4,5,6,7,8,9]
	for i in c:
		await $fade_out_timer.timeout
		obj.modulate.a -= 0.1
		
	timer.queue_free()
	obj.queue_free()

func format(str:String, w:int = 100):
	var str_in = str.split(" ")
	var str_out = ""
	var l_n_pos = 0
	var str_l = 0
	var w_value = 100
	if w == 100:
		w_value = 100
	if w != 100:
		w_value = w
	for s in str_in:
		str_l = str_out.length() + s.length() 
		if str_l - l_n_pos >= w_value:
			str_out += "\n"
			l_n_pos = str_out.length()
			#add line wrap to string "\n"
			# if str_l - l_n_Pos >= 100
			# add line wrap
			# l_n_pos = str_out.length
		if str_l - l_n_pos <= w_value:
			str_out = str_out + " " + s
			#add a space and a word to string
			# if str_l - l_npos <= 100
			# add a space and a word
	return str_out

func dal(strdal:String = "texto secreto", path:String = ""):
	if has_node("Label"):
		var test = get_node("Label")
		if test.get_text().length() == 0:
			test.set_text(strdal)
			test.visible_characters = 1
		if test.visible_characters < test.get_text().length():
			test.visible_characters += 1
			if has_node("Timer"):
				var tim = get_node("Timer")
				tim.set_wait_time(0.01)
				tim.set_autostart(true)
				await $Timer.timeout
				dal(strdal)
			else:
				var tim = Timer.new()
				#tim.name = "Timer"
				tim.set_name("Timer")
				#tim.timeout.connect(_on_timer_timeout)
				tim.set_wait_time(0.01)
				tim.set_autostart(true)
				add_child(tim)
				await $Timer.timeout
				dal(strdal)

			#print("vezes")
			
		#if test.visible_characters == test.get_text().length():
				#test.set_text("")
	else:
		if has_node("ColorRect1") == false:
			var pes = ColorRect.new()
			pes.set_color(Color(0,0,0,1))
			pes.set_name("ColorRect1")
			pes.size = Vector2(760, 200)
			add_child(pes)
			
		var tes = Label.new()
		var pes = get_node("ColorRect1")
		#tes.name = "Label"
		tes.set_name("Label")
		if path == "":
			path = "res://Assets/fonts/Roboto-Black.ttf"
		tes.add_theme_font_override("font", load(path))
		#tes.set_horizontal_alignment(HORIZONTAL_ALIGNMENT_FILL)
		#tes.set_autowrap_mode(TextServer.AUTOWRAP_WORD)
		add_child(tes)
		dal(strdal)
		
func end_dialogue():
	if has_node("Label"):
		var tes = get_node("Label")
		if tes.visible_characters == tes.get_text().length():
			tes.queue_free()
			var pes = get_node("ColorRect1")
			pes.queue_free()
			fix = false
		else:
			tes.visible_characters = tes.get_text().length()
	else:
		var test = Label.new()
		test.set_name("Erro")
		test.set_text("ERRO")
		add_child(test)

func help(function:String = ""):
	var functions = ["format", "dal", "end_dialogue", "fade_out", "fade_in", "UI_score", "UIdes_fx", "room_selector"]
	var help = {"format":"tem como objetivo transformar qualquer string em uma string com quebras de linhas, recebe dois parâmetros um da string que quer formatar e outro do número onde vai quebrar a linha, é feito um loop por toda string adicionando contra barra n efetivamente quebrando a linha, sem interromper palavras", "dal":"recebe uma string e começa um dialogo, faz o sistema de dialogo do jogo funcionar, recebe parametro do texto do dialogo, velocidade do dialogo e fonte do dialogo, cria uma caixa preta atrás do dialogo também, faz isso atrásves de recrusão sempre aumentando número de caracteres visiveis de uum node do tipo Label na frente de um node do tipo colorrect.", "end_dialogue":"tem com objetivo encerrar o dialogo, essa função procura um node do tipo label e delta ele além de deletar o color rect atrás do node label assim terminando o dialogo ou também pode apenas pular o dialogo se for chamado antes do texto terminar de tornar visivel todos os caracteres", "fade_out":"tem como objetivo faz o obejto desaparecer ao poucos dando efeito de fade indo escurecendo aos poucos, recebe dois parametros um do objeto que vai apagar e outro da velocidade para apagar, faz isso mudando a opacidade do objeto.", "fade_in":"tem como objetivo faz um objeto aparecer aos poucos, parecido com fade_out, porém não deleta o objeto, ele também receb dois parametros um do objeto para aparecer e outro da velocidade que o objeto vai aparecer, faz também igual ao fade_out mudando a opcaidade do objeto porém um faz por recursão o outro faz em um loop, além de que um faz aparecer o outro deleta", "UI_score":"ajeita os checadores das medalhas do jogo de acordo com os pontos ou seja perguntas respondidas corretamente pelo jogador, se o jogador acertou pelo menos 1 muda o node texture rect de um x vermelho, para um sinal de completado verde, seguindo a regra de negócios do jogo faz a mesma coisa para as letras x vermelhas próximas as outras medalhas até completar o jogo.", "UIdes_fx":"essa função tem como objetivo posicionar melhor a caixa de dialogo dependendo do mapa se é sala do tipo 1 ou do tipo 2 ou a introdução do jogo, permite definir um valor para empurrar a direita, esquerda, cima e baixo o node do tipo label para o dialogo e node do tipo color rect preto atrás dele, recebe dois parametros o valor do x que quer modificar e o valor de y", "room_selector":"tem como objetivo selecionar o tipo da próxima da sala, a função é simples ela apenas retorna um número que pode ser o número 1 ou 2 apenas isso"}
	if function not in functions:
		print("você escreveu um nome inválido da função")
		print("ou não escreveu nome algum")
		print("segue a lista dos nomes válidos:")
		for c in functions:
			print(c)
	else:
		print(help[function])
	
	
func format_string100():
	var str_a = "string"
	var cont = 0
	var str_b = str_a.split(" ")
	var str_c = ""
	var str_len = (str_a.length() + str_a.length()/100)
	var pos_i = 0
	var pos_f = 100
	var c = 0
	var is_v = false
	while is_v == false:
		if str_c.length() >= str_len:
			is_v = true
		else:
			if str_c.length() + str_b[c].length() >= 100 and str_c.find("\n") == -1: 
				str_c += "\n"
				pos_i = str_c.length()
			if str_c.length() >= 100 and (str_c.length() + str_b[c].length()) >= 100 and str_c.find("\n") != -1:
				var last_p = str_c.find("\n")
				if str_c.length() - last_p >= 100:
					str_c += "\n"
					pos_i = str_c.lenght()
				
				pass
			str_c = str_b[c]
			c += 1
				
	
	#return str
	
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

