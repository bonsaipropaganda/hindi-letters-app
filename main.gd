extends Node2D

@onready var anim_player = $AnimationPlayer


func _on_right_button_pressed():
	anim_player.play("switch_to_vowels")


func _on_left_button_pressed():
	anim_player.play("switch_to_consonants")
