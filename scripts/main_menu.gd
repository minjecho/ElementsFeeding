extends Control

const PLAYER_SELECT_SCENE := "res://scenes/player_select.tscn"

@onready var _notice: Label = $Center/Column/Notice


func _ready() -> void:
	$Center/Column/Buttons/StartButton.grab_focus()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		_quit()


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file(PLAYER_SELECT_SCENE)


func _on_settings_pressed() -> void:
	_notice.text = "설정은 아직 연결되지 않았습니다."


func _on_quit_pressed() -> void:
	_quit()


func _quit() -> void:
	get_tree().quit()
