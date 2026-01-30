extends Camera2D

# How much to zoom in (smaller scale = closer)
var target_zoom: Vector2 = Vector2(0.5, 0.5)
# How fast to zoom
var zoom_speed: float = 2.0
# Flag to start zooming
var start_zoom: bool = false

func _ready():
	# Setup the timer
	$Timer.wait_time = 3.0  # time in seconds before zoom
	$Timer.one_shot = true
	$Timer.start()
	$Timer.connect("timeout", Callable(self, "_on_timer_timeout"))

func _process(delta):
	if start_zoom:
		# Smoothly interpolate zoom
		zoom = zoom.linear_interpolate(target_zoom, zoom_speed * delta)

func _on_timer_timeout():
	start_zoom = true
