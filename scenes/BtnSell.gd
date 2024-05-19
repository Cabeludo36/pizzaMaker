# DEFINE TIPO DO OBJETO
extends Button

# DECLARA VARIÁVEIS DE ELEMENTOS DA CENA
var moneyLabel:Label
var recepeLabel:TextEdit
var receita:PackedInt32Array = []
var money = 0
var rng = RandomNumberGenerator.new()

var souce:Node2D
var chease:Node2D
var mushrooms:Node2D
var olives:Node2D
var salans:Node2D

# QUANDO O ELEMENTO ESTA PRONTO
# SETA OS ELEMENTOS DA TELA EM VARIÁVEIS
# GERA RECEITA
func _ready():
	moneyLabel = $"../LblMoney"
	recepeLabel = $"../TxtRecepe"
	
	souce = $"../TomatoSouce"
	chease = $"../cheese"
	mushrooms = $"../mushrooms"
	olives = $"../olives"
	salans = $"../salans"
	
	_generate_recepe()

# QUANDO PRESSIONADO VALIDAR A RECEITA
# VERIFICA A RECEITA
# TIRA/ADICIONA DINHEIRO
# MUDA O VALOR NA LABEL
# LIMPA PIZZA
# GERA NOVA RECEITA 
func _on_pressed():
	
	if _is_valid_pizza():
		money += 10
	else:
		money -= 10
	
	moneyLabel.text = "R$ " + str(money)
	
	_clear_pizza()
	_generate_recepe()

# GERA RECEITA
func _generate_recepe():
	var ingredients:PackedInt32Array = []
	
	for i in range(5):
		var ingredient = rng.randi_range(1,5)
		
		if not ingredient in ingredients:
			ingredients.append(ingredient)
	
	print(ingredients)
	
	recepeLabel.text = ""
	for i in ingredients:		
		if i == 1:
			recepeLabel.text = recepeLabel.text + "Molho de Tomate\n"
		elif i == 2:
			recepeLabel.text = recepeLabel.text + "Queijo\n"
		elif i == 3:
			recepeLabel.text = recepeLabel.text + "Cogumelos\n"
		elif i == 4:
			recepeLabel.text = recepeLabel.text + "Azeitonas\n"
		elif i == 5:
			recepeLabel.text = recepeLabel.text + "Salames\n"
		
	receita = ingredients
	print(ingredients)

# BUSCA INGREDIENTES JÁ INSERIDOS PELO USUÁRIO
func _get_active_ingredients() -> PackedInt32Array:
	var active_ingredients: PackedInt32Array = []
	if souce.visible:
		active_ingredients.append(1)
	if chease.visible:
		active_ingredients.append(2)
	if mushrooms.visible:
		active_ingredients.append(3)
	if olives.visible:
		active_ingredients.append(4)
	if salans.visible:
		active_ingredients.append(5)
		
	return active_ingredients

# FAZ VALIDAÇÃO DA PIZZA
func _is_valid_pizza():
	var active_ingridients = _get_active_ingredients()
	
	for i in active_ingridients:
		if not i in receita:
			return false
	for i in receita:
		if not i in active_ingridients:
			return false
	
	return true

# LIMPA PIZZA 
func _clear_pizza():
	souce.hide()
	chease.hide()
	mushrooms.hide()
	olives.hide()
	salans.hide()
