extends ParallaxLayer

@export var scroll_speed = 100.0
@onready var parallax = $Parallax2D

func _process(delta):
	if parallax != null:
		parallax.scroll_offset.x -= scroll_speed * delta
		print("Scroll offset: ", parallax.scroll_offset.x)
	else:
		print("Parallax is null!")
