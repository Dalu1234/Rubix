extends Control

@onready var Stats = $Stats as RichTextLabel
@onready var Waiter = $Waiter as Timer
var Congratulations = "Congratulations"

func _ready():
	update_rich_text(Congratulations)
	data()

func _process(delta):
	pass

func update_rich_text(new_text: String):
	Stats.clear()
	Stats.add_text(new_text)

func data():
	Waiter.start(1.0)  # Start the timer with a 1.5-second wait
	await Waiter.timeout
	update_rich_text(Global.cob)
