extends Node2D
class_name Main

var btnSell: Button
var tmrTime: Timer
var lblTime: Label
var lblTarget: Label
var lblMoney: Label
var target = 40

var losePopup: Node2D
var winPopup: Node2D

# DEFINE ELEMENTOS QUE SERÃO UTILIZADOS 
# PELA CENA PRINCIPAL
func _ready():
	btnSell = $BtnSell
	tmrTime = $TmrTime
	lblTime = $LblTime
	lblTarget = $LblTarget
	lblMoney = $LblMoney
	
	losePopup = $LosePopup
	winPopup = $WinPopup
	
	lblTarget.text = "Meta: R$" + str(target)
	lblMoney.text = "R$ " + str(btnSell.money)
	tmrTime.start()

# DEFINE SE O JOGADOR
# PERDEU OU GANHOU APÓS O TEMPO
func _on_tmr_time_timeout():
	if btnSell.money < target:
		print("Perdeu")
		losePopup.show()
	else:
		winPopup.show()
		print("Ganhou")

# DEFINE QUE TEXTO A LABEL DE TEMPO 
# TERÁ
func _process(delta):
	lblTime.text = "%d:%02d" % [floor(tmrTime.time_left / 60), int(tmrTime.time_left) % 60]

# REINICIA O ESTADO DO JOGO
func _restart():
	btnSell._clear_pizza()
	btnSell.money = 0
	
	losePopup.hide()
	winPopup.hide()
	
	tmrTime.start()
	lblTarget.text = "Meta: R$" + str(target)
	lblMoney.text = "R$ " + str(btnSell.money)

# DEFINE O QUE SERÁ FEITO DEPOIS DE PERDER
func _restart_after_lose(): 
	target = 40
	_restart()

# DEFINE O QUE SERÁ FEITO DEPOIS DE GANHAR 
func _restart_after_win(): 
	target += 20
	_restart()

# AÇÃO DEPOIS DE PRESSIONAR BOTÃO DE 
# PRÓXIMO NIVEL
func _on_btn_next_pressed():
	_restart_after_win()

# AÇÃO DEPOIS DE PRESSIONAR BOTÃO DE
# REINICIAR
func _on_btn_restart_pressed():
	_restart_after_lose()
