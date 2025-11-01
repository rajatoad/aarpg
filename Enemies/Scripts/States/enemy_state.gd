class_name EnemyState extends Node

## Stores a reference to the enemy that this state belongs to
var enemy : Enemy
var state_machine : EnemyStateMachine

## What happens when we initialize this state
func Init() -> void:
	pass

## What happens when the player enters this State?
func Enter() -> void:
	pass

## What happens when the player exists this state?
func Exit() -> void:
	pass

## What happens during the _process update in this State?
func Process( _delta: float) -> EnemyState:
	return null

## What happends during the _physics_process update in this State?
func Physics( _delta: float) -> EnemyState:
	return null
