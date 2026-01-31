extends Camera2D

@export var Zoom = Vector2(4, 4)
@export var target_zoom: Vector2 = Vector2(30, 30)
@export var zoom_time: float = 6.0

func _on_timer_timeout():
	var tween = create_tween()
	tween.tween_property(self, "zoom", target_zoom, zoom_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.finished.connect(_on_zoom_finished)

func _on_zoom_finished():
	SceneTransition.change_scene("res://scenes/tren_interior.tscn")
