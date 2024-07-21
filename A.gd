extends Button

func _ready():
	var button = Button.new()
	button.text = "Click me"
	button.pressed.connect(_on_pressed)
	add_child(button)

	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



