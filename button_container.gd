extends HBoxContainer


func _ready():
	for child in get_children():
		var tween = get_tree().create_tween()
		tween.tween_property(child, "scale", Vector2(1,1),.1).set_trans(Tween.TRANS_BOUNCE)
		tween.tween_property(child, "scale", Vector2(1,1),.1).set_trans(Tween.TRANS_BOUNCE)
		await get_tree().create_timer(.2).timeout
		tween.stop()
