extends Node

## Central Game Manager for the Psychedelic Doom framework
## Handles state, scoring, level flow, and weird events.

signal player_died
signal level_completed
signal weird_event_triggered(event_name: String)

var current_level: int = 1
var score: int = 0
var is_paused: bool = false

func _ready() -> void:
	print("Game Manager initialized — Welcome to the Multiverse, Morty!")

func add_score(amount: int) -> void:
	score += amount
	print("Score: ", score)

func trigger_weird_event(event_name: String) -> void:
	weird_event_triggered.emit(event_name)
	print("Weird event: ", event_name)

func player_died() -> void:
	player_died.emit()
	print("Player died. Get schwifty or restart.")
