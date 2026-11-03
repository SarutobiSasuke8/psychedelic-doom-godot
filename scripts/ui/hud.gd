extends CanvasLayer

var health_label: Label
var score_label: Label
var player: Node
var game_manager: Node

func _ready() -> void:
	health_label = $HealthLabel
	score_label = $ScoreLabel
	player = get_tree().get_first_node_in_group("player")
	game_manager = get_tree().get_first_node_in_group("game_manager")
	
	if game_manager and game_manager.has_signal("score_changed"):
		game_manager.score_changed.connect(_on_score_changed)

func _process(_delta: float) -> void:
	if is_instance_valid(player) and "health" in player:
		health_label.text = "Health: %d" % player.health

func _on_score_changed(new_score: int) -> void:
	score_label.text = "Score: %d" % new_score
