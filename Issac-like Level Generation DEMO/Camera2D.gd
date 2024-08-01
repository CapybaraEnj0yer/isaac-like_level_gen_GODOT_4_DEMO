extends Camera2D



func _ready():
	position = GameManager.camera_position
	zoom = GameManager.camera_zoom


## USE THE MOUSE WHEEL TO ZOOM IN/ZOOM OUT, AND LEFT MOUSE BUTTON TO DRAG THE CAMERA

func _input(event):
	if event.get_action_strength("mouse_up"):
		zoom = clamp(zoom + Vector2.ONE * 0.01 ,Vector2.ONE * 0.1,Vector2.ONE * 5.0)
	
	if event.get_action_strength("mouse_down"):
		zoom = clamp(zoom - Vector2.ONE * 0.01 ,Vector2.ONE * 0.1,Vector2.ONE * 5.0)
	
	if event is InputEventMouseMotion and Input.is_action_pressed("MLB"):
		global_position -= event.relative / zoom
