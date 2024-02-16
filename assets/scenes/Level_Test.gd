extends Node2D


func _process(delta) -> void:
	var high_score = str(GLOBAL.high_score).pad_zeros(5)
	$Level/High_Score/score_number.text = high_score
