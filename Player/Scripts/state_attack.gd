class_name State_Attack extends State

var attacking : bool = false

@export var attack_sound : AudioStream
@export_range(1, 20, 0.5) var decelerate_speed : float = 5.0

@onready var idle: State = $"../Idle"
@onready var walk: State = $"../Walk"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var attack_animation_player: AnimationPlayer = $"../../Sprite2D/AttackEffectSprite/AnimationPlayer"
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"

@onready var hurt_box: HurtBox = %AttackHurtBox


func _ready() -> void:
	pass # Replace with function body.

## What happens when the player enters this State?
func Enter() -> void:
	player.UpdateAnimation("attack")
	attack_animation_player.play("attack_" + player.AnimDirection())
	animation_player.animation_finished.connect(EndAttack)
	
	audio_stream_player_2d.stream = attack_sound
	audio_stream_player_2d.pitch_scale = randf_range(0.9, 1.1)
	audio_stream_player_2d.play()
	
	attacking = true
	
	await get_tree().create_timer(0.075).timeout
	hurt_box.monitoring = true
	pass

## What happens when the player exists this state?
func Exit() -> void:
	animation_player.animation_finished.disconnect(EndAttack)
	attacking = false
	hurt_box.monitoring = false
	pass

## What happens during the _process update in this State?
func Process( _delta: float) -> State:
	player.velocity -= player.velocity * decelerate_speed * _delta
	if not attacking:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk

	return null

## What happends during the _physics_process update in this State?
func Physics( _delta: float) -> State:
	return null

## What happens with input events in this State?
func HandleInput( _event: InputEvent) -> State:
	return null

func EndAttack( _newAnimName : String) -> void:
	attacking = false
