extends Node2D

func _ready():
	pass

func _draw():
	var cen = Vector2(400,300)
	var rad = 240
	var col = Color(255,0,0)
	draw_circle(cen, rad,col)

# QUANDO O BOTÃO DE TOMATE É PRESSIONADO
# DESENHA MOLHO DE TOMATE
func _on_btn_tomato_pressed():
	self.show();
