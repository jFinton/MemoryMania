extends Control


@onready var moves_label: Label = $NinePatchRect/MC/VB/HB/MovesLabel
@onready var sound: AudioStreamPlayer = $Sound


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_game_over.connect(on_game_over)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func on_game_over(moves: int) -> void:
	moves_label.text = str(moves)
	show()
	SoundManager.play_sound(sound, SoundManager.SOUND_GAME_OVER)


func _on_exit_button_pressed() -> void:
	hide()
	SignalManager.on_game_exit_pressed.emit()
