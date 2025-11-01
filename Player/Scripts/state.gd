class_name State extends Node

## Stores a reference to the player that this State belongs to
static var player: Player
static var state_machine : PlayerStateMachine

func _ready() -> void:
	pass # Replace with function body.

## What happens when we initialize this state?
func Init() -> void:
	pass

## What happens when the player enters this State?
func Enter() -> void:
	pass

## What happens when the player exists this state?
func Exit() -> void:
	pass

## What happens during the _process update in this State?
func Process( _delta: float) -> State:
	return null

## What happends during the _physics_process update in this State?
func Physics( _delta: float) -> State:
	return null

## What happens with input events in this State?
func HandleInput( _event: InputEvent) -> State:
	return null
