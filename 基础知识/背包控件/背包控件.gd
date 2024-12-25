extends Control


# class_name需要判断类型的时候再加，平时不用加


func _ready() -> void:
	createBeiBao2()


# 动态加载图片

func loadImage():
	var tex = TextureRect.new()
	
	var img = preload("res://icon.svg")
	tex.texture = img
	return tex


# 生成背包
func createBeiBao():
	var grid = GridContainer.new()
	self.add_child(grid)
	grid.columns = 4
	grid.set("theme_override_constants/h_separation",50)
	grid.set("theme_override_constants/v_separation",50)
	grid.position = Vector2(0,0)
	
	for i in range(16):
		var 格子1 = loadImage()
		grid.add_child(格子1)
	
# 生成背包
func createBeiBao2():
	for i in range(16):
		var gz = preload("res://基础知识/背包控件/背包格子.tscn").instantiate()
		gz.id = i
		gz.点击.connect(_on_背包格子_点击)
		$GridContainer.add_child(gz)

# 自定义槽函数
func _on_背包格子_点击(n):
	print(n)
