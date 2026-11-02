extends CharacterBody3D
class_name EnemyBase

## Base class for all googly quirky sci-fi aliens
## Extend this for specific weird enemies.

@export var health: int = 100
@export var move_speed: float = 4.0
@export var detection_range: float = 20.0
@export var attack_range: float = 2.0
@export var damage: int = 10

var player: Node3D
var is_dead: bool = false

enum State { IDLE, CHASE, ATTACK, DEAD }
var current_state: State = State.IDLE

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	add_to_group("enemies")

func _physics_process(delta: float) -> void:
	if is_dead or not player:
		return
	
	match current_state:
		State.IDLE:
			_idle_behavior(delta)
		State.CHASE:
			_chase_behavior(delta)
		State.ATTACK:
			_attack_behavior(delta)

func _idle_behavior(_delta: float) -> void:
	if player and global_position.distance_to(player.global_position) < detection_range:
		current_state = State.CHASE

func _chase_behavior(delta: float) -> void:
	var direction = (player.global_position - global_position).normalized()
	direction.y = 0
	velocity = direction * move_speed
	move_and_slide()
	
	look_at(player.global_position, Vector3.UP)
	
	if global_position.distance_to(player.global_position) < attack_range:
		current_state = State.ATTACK
	elif global_position.distance_to(player.global_position) > detection_range * 1.5:
		current_state = State.IDLE

func _attack_behavior(_delta: float) -> void:
	# Override in subclasses for unique attacks
	print(name, " attacks!")
	current_state = State.CHASE

func take_damage(amount: int) -> void:
	health -= amount
	if health <= 0:
		die()

func die() -> void:
	is_dead = true
	current_state = State.DEAD
	print(name, " exploded into googly bits!")
	# Add death effects, score, etc.
	queue_free()
