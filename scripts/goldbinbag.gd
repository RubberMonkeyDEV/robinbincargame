extends Area2D



func _on_body_entered(body):
	print("+3 Points")
	queue_free()
