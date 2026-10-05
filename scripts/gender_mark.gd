extends Control

enum Kind { MALE, FEMALE }

@export var kind: Kind = Kind.MALE

const _COLOR := Color(0.97, 0.91, 0.84, 1)
const _WIDTH := 6.0


func _draw() -> void:
	if size.x < 8.0 or size.y < 8.0:
		return
	var radius := minf(size.x, size.y) * 0.22
	if kind == Kind.MALE:
		_draw_male(radius)
	else:
		_draw_female(radius)


func _draw_male(radius: float) -> void:
	var direction := Vector2(0.70710678, -0.70710678)
	var reach := radius * 1.95
	var center := size * 0.5 - direction * (reach - radius) * 0.5
	draw_arc(center, radius, 0.0, TAU, 64, _COLOR, _WIDTH, true)
	var tip := center + direction * reach
	draw_line(center + direction * radius, tip, _COLOR, _WIDTH, true)
	var head := radius * 0.42
	var side := direction.orthogonal()
	draw_line(tip, tip - direction * head + side * head * 0.6, _COLOR, _WIDTH, true)
	draw_line(tip, tip - direction * head - side * head * 0.6, _COLOR, _WIDTH, true)


func _draw_female(radius: float) -> void:
	var stem := radius * 0.95
	var center := size * 0.5 + Vector2(0.0, -stem * 0.28)
	draw_arc(center, radius, 0.0, TAU, 64, _COLOR, _WIDTH, true)
	var top := center + Vector2(0.0, radius)
	draw_line(top, top + Vector2(0.0, stem), _COLOR, _WIDTH, true)
	var cross := top + Vector2(0.0, stem * 0.48)
	var arm := radius * 0.55
	draw_line(cross + Vector2(-arm, 0.0), cross + Vector2(arm, 0.0), _COLOR, _WIDTH, true)
