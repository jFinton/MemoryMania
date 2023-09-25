extends TextureButton

@onready var label: Label = $Label
@onready var sound: AudioStreamPlayer = $Sound


var _level_number: int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func set_level_number(level_number: int) -> void:
	_level_number = level_number
	var l_data = GameManager.LEVELS[_level_number]
	label.text = "%s x %s" % [l_data["rows"], l_data["cols"]]


func _on_pressed() -> void:
	SoundManager.play_button_click(sound)
