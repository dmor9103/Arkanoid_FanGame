extends StaticBody2D

export(String, "White_Brick", "Yellow_Brick", "Pink_Brick") var type: String

func _ready() -> void:
	match type:
		"White_Brick":
			$AnimationPlayer.play("White_Brick")
		"Yellow_Brick":
			$AnimationPlayer.play("Yellow_Brick")
		"Pink_Brick":
			$AnimationPlayer.play("Pink_Brick")
