extends KinematicBody2D


onready var ball: KinematicBody2D = get_tree().get_nodes_in_group("Ball")[0]
export var MOVE_SPEED = 120

func _ready():
	GLOBAL.activate_player = false
	$AnimationPlayer.play("idle")
	get_node(".").visible = false
	$level_intro.play()

func _physics_process(delta) -> void:
	var direction = Vector2.ZERO
	moving_faster()
	
	if GLOBAL.activate_player:
		if Input.is_action_pressed("ui_left"):
			direction = Vector2.LEFT
		elif Input.is_action_pressed("ui_right"):
			direction = Vector2.RIGHT
		
	var direction_speed = direction * MOVE_SPEED
	move_and_collide(direction_speed * delta)

func moving_faster() -> void:
	if Input.is_action_just_pressed("ui_space"):
		print("velocida +")
		MOVE_SPEED = 160
	elif Input.is_action_just_released("ui_space"):
		print("velocidad -")
		MOVE_SPEED = 120

func _on_level_intro_finished():
	get_node(".").visible = true
	$AnimationPlayer.play("start")

func _on_AnimationPlayer_animation_finished(anim_name) -> void:
	match anim_name:
		"start":
			$Timer.start()
			$AnimationPlayer.play("idle")

func _on_Timer_timeout():
	ball.get_node(".").visible = true
	GLOBAL.activate_player = true
