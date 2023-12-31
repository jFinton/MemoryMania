extends Control


@export var mem_tile_scene: PackedScene


@onready var tile_container: GridContainer = $HB/MC1/TileContainer
@onready var sound: AudioStreamPlayer = $Sound
@onready var scorer: Scorer = $Scorer
@onready var moves_label: Label = $HB/MC2/VB/HB/MovesLabel
@onready var pairs_label: Label = $HB/MC2/VB/HB2/PairsLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_level_selected.connect(on_level_selected)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	moves_label.text = scorer.get_moves_made_str()
	pairs_label.text = scorer.get_pairs_made_str()


func _on_exit_button_pressed() -> void:
	SoundManager.play_button_click(sound)
	SignalManager.on_game_exit_pressed.emit()


func on_level_selected(level_num: int) -> void:
	
	var level_selected = GameManager.get_level_selection(level_num)
	var frame_image = ImageManager.get_random_frame_image()
	
	tile_container.columns = level_selected["num_cols"]
	
	for ii_dict in level_selected["image_list"]:
		add_memory_tile(ii_dict, frame_image)
	
	scorer.clear_new_game(level_selected["target_pairs"])


func add_memory_tile(ii_dict: Dictionary, frame_image: CompressedTexture2D) -> void:
	var new_tile = mem_tile_scene.instantiate()
	tile_container.add_child(new_tile)
	new_tile.setup(ii_dict, frame_image)



