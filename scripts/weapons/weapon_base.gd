extends Node3D
class_name WeaponBase

## Base weapon class for psychedelic Doom guns
## Extend for hitscan, projectile, or absurd weapons.

@export var damage: int = 25
@export var fire_rate: float = 0.2
@export var ammo_cost: int = 1
@export var max_ammo: int = 100

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
	# Override in subclasses
	print("Pew! (base weapon)")
	# Example hitscan
	var camera = player.get_camera() if player.has_method("get_camera") else null
	if camera:
		var space_state = camera.get_world_3d().direct_space_state
		var query = PhysicsRayQueryParameters3D.create(camera.global_position, camera.global_position + -camera.global_transform.basis.z * 100)
		var result = space_state.intersect_ray(query)
		if result and result.collider.is_in_group("enemies"):
			if result.collider.has_method("take_damage"):
				result.collider.take_damage(damage)

func reload() -> void:
	current_ammo = max_ammo
