extends VBoxContainer

var buttons = []
var random_position_modifiers = []
var right_button_random_mod = Vector2()
@onready var left_button = $"../LeftButton"
var has_switched = false


func _ready():
	for hbox in get_children():
		for child in hbox.get_children():
			buttons.append(child)
	
	for button in buttons:
		random_position_modifiers.append(Vector2(randi_range(-100,100),randi_range(-100,100)))
	
	right_button_random_mod = Vector2(randi_range(-100,100),randi_range(-100,100))
#	var i = 0
#	for button in buttons:
#		button.position += random_position_modifiers[i]
#		i += 1



func _on_right_button_pressed():
	var i = 0
	if has_switched:
		for button in buttons:
			var tween = get_tree().create_tween()
			var tween_2 = get_tree().create_tween()
			tween.tween_property(button, "scale", Vector2(0,0),.8)
			tween_2.tween_property(button,"position",Vector2(button.position.x + random_position_modifiers[i].x, button.position.y + random_position_modifiers[i].y), .8)
			i += 1

		var right_tween = get_tree().create_tween()
		right_tween.tween_property(left_button,"position",Vector2(left_button.position.x + right_button_random_mod.x,left_button.position.y + right_button_random_mod.y), .8)
		var right_scale = get_tree().create_tween()
		right_scale.tween_property(left_button,"scale",Vector2(0,0),.8)
	has_switched = true

func reset_consonants():
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
		
		var right_tween = get_tree().create_tween()
		right_tween.tween_property(left_button,"position",Vector2(left_button.position.x - right_button_random_mod.x,left_button.position.y - right_button_random_mod.y), .8)
		var right_scale = get_tree().create_tween()
		right_scale.tween_property(left_button,"scale",Vector2(11,11),.8)
		right_button_random_mod = Vector2(randi_range(-100,100),randi_range(-100,100))
	has_switched = true
