extends Panel

# 自定义信号
signal 点击(n)

var id = 0

func _on_texture_button_pressed() -> void:
	点击.emit(id)
