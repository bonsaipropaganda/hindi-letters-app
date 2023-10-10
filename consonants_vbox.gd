extends VBoxContainer

var buttons = []
var random_position_modifiers = []
var right_button_random_mod = Vector2()
@onready var right_button = $"../RightButton"


func _ready():
	randomize()
	for hbox in get_children():
		for child in hbox.get_children():
			buttons.append(child)
	
	for button in buttons:
		random_position_modifiers.append(Vector2(randi_range(-100,100),randi_range(-100,100)))
	
	right_button_random_mod = Vector2(randi_range(-100,100),randi_range(-100,100))
	
	# starting values before starting animation
	# this isn't working but they're supposed to start at zero and then scale up when the game starts so there is an intro animation
#	for button in buttons:
#		print(button.scale)
#		button.scale = Vector2(0.1,0.1)
#		print(button.scale)
#
#	# starting animation
#	var i_2 = 0
#	for button in buttons:
#		var tween = get_tree().create_tween()
#		var tween_2 = get_tree().create_tween()
#		tween.tween_property(button, "scale", Vector2(1,1),.8)
#		tween_2.tween_property(button,"position",Vector2(button.position.x - random_position_modifiers[i_2].x, button.position.y - random_position_modifiers[i_2].y), .8)
#		i_2 += 1
#
#	var right_tween = get_tree().create_tween()
#	right_tween.tween_property(right_button,"position",Vector2(right_button.position.x + right_button_random_mod.x,right_button.position.y + right_button_random_mod.y), .8)
#	var right_scale = get_tree().create_tween()
#	right_scale.tween_property(right_button,"scale",Vector2(0,0),.8)





func _on_right_button_pressed():
	var i = 0
	for button in buttons:
		var tween = get_tree().create_tween()
		var tween_2 = get_tree().create_tween()
		tween.tween_property(button, "scale", Vector2(0,0),.8)
		tween_2.tween_property(button,"position",Vector2(button.position.x + random_position_modifiers[i].x, button.position.y + random_position_modifiers[i].y), .8)
		i += 1
	
	var right_tween = get_tree().create_tween()
	right_tween.tween_property(right_button,"position",Vector2(right_button.position.x + right_button_random_mod.x,right_button.position.y + right_button_random_mod.y), .8)
	var right_scale = get_tree().create_tween()
	right_scale.tween_property(right_button,"scale",Vector2(0,0),.8)


func reset_consonants():
	var i = 0
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
	right_tween.tween_property(right_button,"position",Vector2(right_button.position.x - right_button_random_mod.x,right_button.position.y - right_button_random_mod.y), .8)
	var right_scale = get_tree().create_tween()
	right_scale.tween_property(right_button,"scale",Vector2(11,11),.8)
	right_button_random_mod = Vector2(randi_range(-100,100),randi_range(-100,100))

