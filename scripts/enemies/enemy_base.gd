extends CharacterBody3D
class_name EnemyBase

## Base class for googly quirky sci-fi aliens

@export var health: int = 50
@export var move_speed: float = 3.5
@export var detection_range: float = 25.0
@export var attack_range: float = 1.8
@export var damage: int = 15
@export var attack_cooldown: float = 1.0

var player: Node3D
var is_dead: bool = false
var can_attack: bool = true

enum State { IDLE, CHASE, ATTACK, DEAD }
var current_state: State = State.IDLE

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	add_to_group("enemies")

func _physics_process(delta: float) -> void:
	if is_dead or not is_instance_valid(player):
		return
	
	match current_state:
		State.IDLE:
			_idle_behavior()
		State.CHASE:
			_chase_behavior(delta)
		State.ATTACK:
			_attack_behavior()

func _idle_behavior() -> void:
	if player and global_position.distance_to(player.global_position) < detection_range:
		current_state = State.CHASE

func _chase_behavior(_delta: float) -> void:
	var direction = (player.global_position - global_position).normalized()
	direction.y = 0
	velocity = direction * move_speed
	move_and_slide()
	
	if global_position.distance_to(player.global_position) > 0.1:
		look_at(Vector3(player.global_position.x, global_position.y, player.global_position.z), Vector3.UP)
	
	var dist = global_position.distance_to(player.global_position)
	if dist < attack_range:
		current_state = State.ATTACK
	elif dist > detection_range * 1.5:
		current_state = State.IDLE

func _attack_behavior() -> void:
	if can_attack and is_instance_valid(player) and player.has_method("take_damage"):
		player.take_damage(damage)
		can_attack = false
		await get_tree().create_timer(attack_cooldown).timeout
		can_attack = true
	current_state = State.CHASE

func take_damage(amount: int) -> void:
	health -= amount
	print(name, " took ", amount, " damage. Health: ", health)
	if health <= 0:
		die()

func die() -> void:
	is_dead = true
	current_state = State.DEAD
	print(name, " exploded into googly bits!")
	var gm = get_tree().get_first_node_in_group("game_manager")
	if gm and gm.has_method("add_score"):
		gm.add_score(100)
	queue_free()
