extends NavigationRegion2D

func _ready():
	var size = DisplayServer.window_get_size()
	var navigation_polygon : NavigationPolygon = self.navigation_polygon
	var nav_poly : PackedVector2Array = PackedVector2Array()
	nav_poly.append(Vector2i(0,0))
	nav_poly.append(Vector2i(0,size.y))
	nav_poly.append(Vector2i(size.x,0))
	nav_poly.append(Vector2i(size.x, size.y))
	
	navigation_polygon.add_outline(nav_poly)
	navigation_polygon.make_polygons_from_outlines()
	
	self.navigation_polygon = navigation_polygon
