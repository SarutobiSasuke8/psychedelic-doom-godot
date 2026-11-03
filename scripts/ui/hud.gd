extends CanvasLayer

var health_label: Label
var score_label: Label
var ammo_label: Label
var crosshair: Control
var player: Node
var game_manager: Node
var current_weapon: Node

func _ready() -> void:
	health_label = $Margin/VBox/HealthLabel
	score_label = $Margin/VBox/ScoreLabel
	ammo_label = $Margin/VBox/AmmoLabel
	crosshair = $Crosshair
	player = get_tree().get_first_node_in_group("player")
	game_manager = get_tree().get_first_node_in_group("game_manager")
	
	if game_manager and game_manager.has_signal("score_changed"):
		game_manager.score_changed.connect(_on_score_changed)
	
	# Style for pixel look
	_apply_pixel_style()

func _apply_pixel_style() -> void:
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0, 0, 0, 0.6)
	style.set_corner_radius_all(0)
	# Labels already chunky via theme in scene

func _process(_delta: float) -> void:
	if is_instance_valid(player) and "health" in player:
		health_label.text = "HP: %d" % player.health
	
	if is_instance_valid(player) and player.current_weapon:
		var w = player.current_weapon
		if "current_ammo" in w:
			ammo_label.text = "AMMO: %d" % w.current_ammo

func _on_score_changed(new_score: int) -> void:
	score_label.text = "SCORE: %d" % new_score
