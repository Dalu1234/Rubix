extends Control
@onready var next = $next as Button
@onready var back = $back as Button
@onready var instruction = $Instructions as RichTextLabel
var index = 0
var x = false

var manual = [["Here's how to play:"], ["Try to get to the number given a in record speed"], 
["\nHere are the Available operations:\n"],
 ["a - Increment num by the current adder value (the adder value increases by 1 each use)"],
 ["b - Decrement num by the current subtracter value (the subtracter value increases by 1 each use)"], 
["c - Multiply num by the previous value in the list (increases by 1 with each use)"],
 ["d - Divide num by the divider value (which increases by one with each use)"], ["Let's Start The Game!!!!"]] 
# +str(Calculator.random_number)+
# Called when the node enters the scene tree for the first time.
func _ready():
	update_rich_text("")
	$Start.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if index == 0:
		$back.visible = false
	elif index != 0:
		$back.visible = true
	if x == true: 
		$Start.visible = true



func _on_next_pressed():
	if index < len(manual):

		var text = manual[index][0]
		update_rich_text(text)
		index +=1
		print(index) 
	if index == len(manual):
		x = true
		

	

func update_rich_text(new_text: String):
	instruction.clear()
	instruction.add_text(new_text)



func _on_back_pressed():
	if index > -1:
		index -=1
		print(index)
		var text = manual[index][0]
		update_rich_text(text)


func _on_start_pressed():
	get_tree().change_scene_to_file("res://Calculator.tscn")
#test
