extends Node

## Central Game Manager

signal player_died
signal score_changed(new_score: int)

var current_level: int = 1
var score: int = 0

func _ready() -> void:
	add_to_group("game_manager")
	print("Game Manager initialized — Welcome to the Multiverse!")

func add_score(amount: int) -> void:
	score += amount
	score_changed.emit(score)
	print("Score: ", score)

func on_player_died() -> void:
	player_died.emit()
	print("Player died.")
