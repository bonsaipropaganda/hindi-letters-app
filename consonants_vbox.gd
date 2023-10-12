extends VBoxContainer

var buttons = []
var random_position_modifiers = []
var right_button_random_mod = Vector2()
@onready var right_button = $"../RightButton"
@onready var whoosh_sound = $"../../WhooshSound"
@onready var bubbles = $"../../../Bubbles"
@onready var consonants_label = $"../ConsonantsLabel"




func _ready():
	randomize()
	for hbox in get_children():
		for child in hbox.get_children():
			buttons.append(child)
	
	for button in buttons:
		random_position_modifiers.append(Vector2(randi_range(-100,100),randi_range(-100,100)))
	
	right_button_random_mod = Vector2(randi_range(-100,100),randi_range(-100,100))
	
	var tween_right = get_tree().create_tween()
	tween_right.tween_property(right_button,"scale",Vector2(0,0),.001)
	tween_right.tween_property(right_button,"scale",Vector2(11,11),1)
	
	# starting values before starting animation
	# this isn't working but they're supposed to start at zero and then scale up when the game starts so there is an intro animation
	
#	# starting animation
	bubbles.play()
	for button in buttons:
		var tween = get_tree().create_tween()
		tween.tween_property(button, "scale", Vector2(0,0),.001)
		tween.tween_property(button, "scale", Vector2(1,1),randf_range(.2,2.0))
#
#	var right_tween = get_tree().create_tween()
#	right_tween.tween_property(right_button,"position",Vector2(right_button.position.x + right_button_random_mod.x,right_button.position.y + right_button_random_mod.y), .8)
#	var right_scale = get_tree().create_tween()
#	right_scale.tween_property(right_button,"scale",Vector2(0,0),.8)







func _on_right_button_pressed():
	whoosh_sound.play()
	consonants_label.position = Vector2(0,0)
	right_button.disabled = true
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
	right_button.disabled = false
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

