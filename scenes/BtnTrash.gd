# DEFINE TIPO DO OBJETO
extends Button

# DEFINE ELEMENTOS DA TELA
@export var tomato:Node2D
@export var cheese:Node2D
@export var mushrooms:Node2D
@export var olives:Node2D
@export var salans:Node2D

# QUANDO PRESSIONADO
# LIMPA TUDO DA PIZZA
func _on_pressed():
	tomato.hide()
	cheese.hide()
	mushrooms.hide()
	olives.hide()
	salans.hide()
	
