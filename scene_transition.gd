extends CanvasLayer

var fade_rect: ColorRect

func _ready():
	# Create the fade overlay
	fade_rect = ColorRect.new()
	fade_rect.color = Color.BLACK
	fade_rect.color.a = 0  # Start transparent
	fade_rect.set_anchors_preset(Control.PRESET_FULL_RECT)
	fade_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(fade_rect)

func change_scene(scene_path: String, fade_out_time: float = 0.5, fade_in_time: float = 0.5):
	# Fade out
	var tween = create_tween()
	tween.tween_property(fade_rect, "color:a", 1.0, fade_out_time)
	await tween.finished
	
	# Change scene
	get_tree().change_scene_to_file(scene_path)
	await get_tree().process_frame  # Wait for scene to load
	
	# Fade in
	var tween2 = create_tween()
	tween2.tween_property(fade_rect, "color:a", 0.0, fade_in_time)
