#extends KinematicBody2D
extends Node

export var direction: Vector2 = Vector2.ZERO
export var magnitude: float = 0.0

func _init() -> void:
	#OS.set_window_title("Test")
	#OS.alert("Test","T")
	pass


#func _physics_process(delta: float) -> void:
#	#move_and_slide(Vector2(10.0, 0.0))
#	direction *= magnitude
#	direction.x = min(direction.x, 200.0)
#	move_and_slide(direction)
#	print("direction: ", direction, ", magnitude: ", magnitude)

