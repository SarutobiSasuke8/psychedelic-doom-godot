extends Node3D
class_name WeaponBase

## Base weapon class for psychedelic Doom guns

@export var damage: int = 25
@export var fire_rate: float = 0.15
@export var ammo_cost: int = 1
@export var max_ammo: int = 100
@export var weapon_name: String = "Basic Gun"

var current_ammo: int = 50
var can_fire: bool = true
var player: CharacterBody3D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

func try_fire() -> void:
	if not can_fire or current_ammo < ammo_cost:
		return
	
	current_ammo -= ammo_cost
	_fire()
	can_fire = false
	await get_tree().create_timer(fire_rate).timeout
	can_fire = true

func _fire() -> void:
	print(weapon_name, " fired! Ammo: ", current_ammo)
	var camera = player.get_camera() if player and player.has_method("get_camera") else null
	if not camera:
		return
	
	var space_state = camera.get_world_3d().direct_space_state
	var from = camera.global_position
	var to = from + -camera.global_transform.basis.z * 100.0
	var query = PhysicsRayQueryParameters3D.create(from, to)
	query.collision_mask = 0b101  # World + Enemies
	var result = space_state.intersect_ray(query)
	
	if result and result.collider.is_in_group("enemies"):
		if result.collider.has_method("take_damage"):
			result.collider.take_damage(damage)
			print("Hit enemy for ", damage, " damage")
