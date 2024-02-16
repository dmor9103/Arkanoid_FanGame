extends KinematicBody2D

export var BALL_SPEED = Vector2(80, -80)
var inter_sound = false

func _ready():
	get_node(".").visible = false

func _physics_process(delta):
	if GLOBAL.activate_player:
		var collision = move_and_collide(BALL_SPEED * delta)
		if collision:
			BALL_SPEED = BALL_SPEED.bounce(collision.normal)
			
			if collision.collider.is_in_group("Inter"):
				if inter_sound:
					$Sounds/bounce_03.play()
					inter_sound = false
				else:
					$Sounds/bounce_02.play()
					inter_sound = true
					
			if collision.collider.is_in_group("Bricks"):
				$Sounds/bounce_03.play()
				GLOBAL.high_score += 10
				collision.collider.queue_free()
