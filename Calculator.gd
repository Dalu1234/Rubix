extends Control

@onready var A = $A as Button
@onready var B = $B as Button
@onready var C = $C as Button
@onready var D = $D as Button
@onready var answer = $Answer as RichTextLabel
@onready var randnumber = $randnumber as RichTextLabel
@onready var addcounter = $addcounter as RichTextLabel
@onready var subcounter = $subcounter as RichTextLabel
@onready var multcounter = $multcounter as RichTextLabel
@onready var divcounter = $divcounter as RichTextLabel
@onready var check_timer = $CheckTimer as Timer

var num = 0
var adder = 1
var subtracter = 1
var multiplier = 1
var divider = 1
var random_number = 3 #randi() % 1001
var numbers = []
var start_time: int
var end_time: int
var running: bool = false

func start():

	start_time = Time.get_ticks_msec()
	running = true

func stop():
	end_time = Time.get_ticks_msec()
	running = false

func get_elapsed_time() -> int:
	if running:
		return Time.get_ticks_msec() - start_time
	else:
		return end_time - start_time

func _ready():
	update_randomnum(str(random_number))
	print("gsjhjsjshjshbxs")
	var stopwatch = Rubix.new()
	stopwatch.start()
	print("Stopwatch started...")
	print("Try to get to %d in record speed\nHere are the Available operations:\n" % random_number)
	print("a - Increment num by the current adder value (the adder value increases by 1 each use)")
	print("b - Decrement num by the current subtracter value (the subtracter value increases by 1 each use)")
	print("c - Multiply num by the previous value in the list (increases by 1 with each use)")
	print("d - Divide num by the divider value (which increases by one with each use)")
	print("Enter your choice (a/b/c/d): ")
	update_rich_text("")
	# Check if the nodes are correctly assigned
	print("Button A: %s" % A)
	print("Button B: %s" % B)
	print("Button C: %s" % C)
	print("Button D: %s" % D)
	print("RichTextLabel Answer: %s" % answer)
	print("Timer: %s" % check_timer)

class Rubix:
	var start_time: int
	var end_time: int
	var running: bool = false

	func start():
		start_time = Time.get_ticks_msec()
		running = true

	func stop():
		end_time = Time.get_ticks_msec()
		running = false

	func get_elapsed_time() -> int:
		if running:
			return Time.get_ticks_msec() - start_time
		else:
			return end_time - start_time

func _process(delta):
	pass
func _input(event):
	if event is InputEventKey:
		if event.pressed:
			match event.scancode:
				KEY_A:
					_on_a_pressed()
				KEY_B:
					_on_b_pressed()
				KEY_C:
					_on_c_pressed()
				KEY_D:
					_on_d_pressed()
func _on_a_pressed():
	num += adder
	print(num)
	numbers.append(num)
	adder += 1
	print("This is num: %d" % num) 
	var bowier = str(num)
	update_rich_text(bowier)
	update_counter(str(adder))
	wait_and_check()

func _on_b_pressed():
	num -= subtracter
	print(num)
	numbers.append(num)
	subtracter += 1
	print("This is num: %d" % num) 
	var bowier = str(num)
	update_rich_text(bowier)
	update_counter(str(subtracter))
	wait_and_check()

func _on_c_pressed():
	num *= multiplier
	print(num)
	numbers.append(num)
	multiplier += 1
	print("This is num: %d" % num) 
	var bowier = str(num)
	update_rich_text(bowier)
	update_counter(str(multiplier))
	wait_and_check()

func _on_d_pressed():
	num /= divider
	print(num)
	numbers.append(num)
	divider += 1
	print("This is num: %d" % num) 
	var bowier = str(num)
	update_rich_text(bowier)
	update_counter(str(divider))
	wait_and_check()

func update_rich_text(new_text: String):
	if answer:
		answer.clear()
		answer.add_text(new_text)
	else:
		print("Answer node is null")

func update_randomnum(new_text: String):
	if randnumber:
		randnumber.clear()
		randnumber.add_text(new_text)
	else:
		print("Answer node is null")
	
func update_counter(new_text: String):
	if new_text == str(adder):
		addcounter.clear()
		addcounter.add_text(new_text)
	if new_text == str(subtracter):
		subcounter.clear()
		subcounter.add_text(new_text)
	if new_text == str(multiplier):
		multcounter.clear()
		multcounter.add_text(new_text)
	if new_text == str(divider):
		divcounter.clear()
		divcounter.add_text(new_text)
	else:
		print("a counter node is null")
func wait_and_check():
	check_timer.start(0.5)  # Start the timer with a 0.5-second wait
	await check_timer.timeout    # Wait for the timer to timeout
	check_end_game()

func check_end_game():
	if num == random_number:
		stop()
		print("Stopwatch stopped...")
		var elapsed_time = get_elapsed_time()
		print("Elapsed time in milliseconds: %d" % elapsed_time)
		print("Elapsed time in seconds: %f" % (elapsed_time / 1000.0))
		var Congratulations = "Congrats You Got It!!!"
		get_tree().change_scene_to_file("res://winpage.tscn")
		update_rich_text(Congratulations)
		disable_buttons()

func disable_buttons():
	A.disabled = true
	B.disabled = true
	C.disabled = true
	D.disabled = true
