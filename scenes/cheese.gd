# DEFINE TIPO DO OBJETO
extends Node2D

# DEFINE COMO O OBJETO SERÁ DESENHADO
func _draw():
	var cen = Vector2(400,300)
	var rad = 230
	var col = Color().html('#f0e601')
	draw_circle(cen, rad,col)

# QUANDO O BOTÃO DE QUEIJO É PRESSIONADO
# DESENHA QUEIJO
func _on_btn_cheese_pressed():
	self.show()

