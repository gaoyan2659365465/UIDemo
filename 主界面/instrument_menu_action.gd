@tool
extends PanelContainer

@onready var label: Label = %Label
@onready var icon_node = %Icon
@onready var button_overlay: Button = $ButtonOverlay


signal selected

@export var text := "Button":
	set(v):
		text = v
		refresh()

@export var icon: Texture2D:
	set(v):
		icon = v
		refresh()


func _ready() -> void:
	refresh()


func refresh() -> void:
	if not is_inside_tree():
		return
	
	if is_instance_valid(label):
		label.text = text
	
	icon_node.texture = icon


func _on_button_overlay_mouse_entered() -> void:
	button_overlay.grab_focus()


func _on_button_overlay_mouse_exited() -> void:
	button_overlay.release_focus()


func _on_button_overlay_pressed() -> void:
	emit_signal("selected")
