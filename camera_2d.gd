extends Camera2D

@export var Zoom = Vector2 (4, 4)
@export var target_zoom: Vector2 = Vector2(100, 100)
@export var zoom_time: float = 6.0  # How long to zoom in

func _on_timer_timeout():
	var tween = create_tween()
	tween.tween_property(self, "zoom", target_zoom, zoom_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
