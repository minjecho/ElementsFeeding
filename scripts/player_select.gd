extends Control

const MAIN_MENU_SCENE := "res://scenes/main_menu.tscn"

@onready var _male_button: Button = $Center/Column/Choices/MaleButton
@onready var _female_button: Button = $Center/Column/Choices/FemaleButton

var _normal_style: StyleBox
var _selected_style: StyleBox
var _selected := ""


func _ready() -> void:
	_normal_style = _male_button.get_theme_stylebox("normal")
	_selected_style = _male_button.get_theme_stylebox("hover")
	_male_button.grab_focus()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		_back()


func _on_male_pressed() -> void:
	_selected = "male"
	_refresh()


func _on_female_pressed() -> void:
	_selected = "female"
	_refresh()


func _on_back_pressed() -> void:
	_back()


func _back() -> void:
	get_tree().change_scene_to_file(MAIN_MENU_SCENE)


func _refresh() -> void:
	_apply(_male_button, _selected == "male")
	_apply(_female_button, _selected == "female")


func _apply(button: Button, selected: bool) -> void:
	button.add_theme_stylebox_override("normal", _selected_style if selected else _normal_style)
