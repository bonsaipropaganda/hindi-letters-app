extends VBoxContainer

var buttons = []
var random_position_modifiers = []
var has_switched = false
@onready var label = $"../VowelsLabel"


func _ready():
	for hbox in get_children():
		for child in hbox.get_children():
			buttons.append(child)
	
	for button in buttons:
		random_position_modifiers.append(Vector2(randi_range(-100,100),randi_range(-100,100)))



func _on_left_button_pressed():
	var i = 0
	if has_switched:
		for button in buttons:
			var tween = get_tree().create_tween()
			var tween_2 = get_tree().create_tween()
			tween.tween_property(button, "scale", Vector2(0,0),.8)
			tween_2.tween_property(button,"position",Vector2(button.position.x + random_position_modifiers[i].x, button.position.y + random_position_modifiers[i].y), .8)
			i += 1
	has_switched = true


func reset_vowels():
	var i = 0
	if has_switched:
		for button in buttons:
			var tween = get_tree().create_tween()
			var tween_2 = get_tree().create_tween()
			tween.tween_property(button, "scale", Vector2(1,1),.8)
			tween_2.tween_property(button,"position",Vector2(button.position.x - random_position_modifiers[i].x, button.position.y - random_position_modifiers[i].y), .8)
			i += 1
		
		random_position_modifiers.clear()
		for button in buttons:
			random_position_modifiers.append(Vector2(randi_range(-100,100),randi_range(-100,100)))
	has_switched = true
