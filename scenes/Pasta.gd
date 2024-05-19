extends Node2D

func _ready():
	pass

# DESENHA A MASSA DA PIZZA
func _draw():
	var cen = Vector2(400,300)
	var rad = 250
	var col = Color().html('#996601')
	draw_circle(cen, rad,col)
