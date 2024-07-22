extends TextureProgressBar


func _process(_delta):
	if value >= max_value:
		_on_progress_complet()

func _on_progress_complet():
	get_tree().change_scene_to_file("res://levels/Factory.tscn")
	
