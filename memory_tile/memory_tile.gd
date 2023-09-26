extends TextureButton

@onready var frame_image: TextureRect = $FrameImage
@onready var item_image: TextureRect = $ItemImage


var _item_name: String


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func get_item_name() -> String:
	return _item_name


func setup(ii_dict: Dictionary, fi: CompressedTexture2D) -> void:
	frame_image.texture = fi
	item_image.texture = ii_dict["item_texture"]
	_item_name = ii_dict["item_name"]

