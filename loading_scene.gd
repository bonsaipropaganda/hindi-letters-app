extends Node2D

var progress = []
var scene_load_status = 0
@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	ResourceLoader.load_threaded_request("res://main.tscn")
	animation_player.play("loading")

func _process(delta):
	scene_load_status = ResourceLoader.load_threaded_get_status("res://main.tscn",progress)
	if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
		var new_scene = ResourceLoader.load_threaded_get("res://main.tscn")
		get_tree().change_scene_to_packed(new_scene)
