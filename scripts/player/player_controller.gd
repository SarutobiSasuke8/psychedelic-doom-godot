extends CharacterBody3D

## Psychedelic Doom Player Controller
## Fast, responsive Doom-like movement with mouse look and shooting.

@export var speed: float = 8.0
@export var jump_velocity: float = 6.0
@export var mouse_sensitivity: float = 0.002
@export var acceleration: float = 20.0
@export var friction: float = 15.0
@export var max_health: int = 100

var health: int = 100
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
var camera: Camera3D
var weapon_holder: Node3D
var current_weapon: Node = null
var game_manager: Node

func _ready() -> void:
	camera = $Camera3D
	weapon_holder = $Camera3D/WeaponHolder
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	health = max_health
	game_manager = get_tree().get_first_node_in_group("game_manager")
	_setup_weapon()

func _setup_weapon() -> void:
	var weapon_scene = load("res://scenes/weapons/basic_gun.tscn")
	if weapon_scene:
		current_weapon = weapon_scene.instantiate()
		weapon_holder.add_child(current_weapon)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		camera.rotate_x(-event.relative.y * mouse_sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-89), deg_to_rad(89))
	
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	if event.is_action_pressed("shoot") and current_weapon and current_weapon.has_method("try_fire"):
		current_weapon.try_fire()

func _physics_process(delta: float) -> void:
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = move_toward(velocity.x, direction.x * speed, acceleration * delta)
		velocity.z = move_toward(velocity.z, direction.z * speed, acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)
		velocity.z = move_toward(velocity.z, 0, friction * delta)
	
	if not is_on_floor():
		velocity.y -= gravity * delta
	elif Input.is_action_just_pressed("jump"):
		velocity.y = jump_velocity
	
	move_and_slide()

func get_camera() -> Camera3D:
	return camera

func take_damage(amount: int) -> void:
	health -= amount
	print("Player health: ", health)
	if health <= 0:
		die()

func die() -> void:
	print("You died! Restarting...")
	if game_manager and game_manager.has_method("on_player_died"):
		game_manager.on_player_died()
	get_tree().reload_current_scene()
