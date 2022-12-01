extends Node2D
var enemy_check = false
var Ingredients_Container = get_node_or_null("res://Game/Ingredients_Container")
func _physics_process(delta):
	$Enemy_Container.get_child_count()
	if $Enemy_Container.get_child_count() == 0 and enemy_check == false:
		$Ingredients_Container/Food_Pasta.show() 
		$Ingredients_Container/Food_Pasta.collision_layer = 1
		$Ingredients_Container/Food_Pasta.collision_mask = 1
		$Ingredients_Container/Food_Pasta/Area2D.collision_layer = 1
		$Ingredients_Container/Food_Pasta/Area2D.collision_mask = 1
		
		$Ingredients_Container/Food_Pasta2.show() 
		$Ingredients_Container/Food_Pasta2.collision_layer = 1
		$Ingredients_Container/Food_Pasta2.collision_mask = 1
		$Ingredients_Container/Food_Pasta2/Area2D.collision_layer = 1
		$Ingredients_Container/Food_Pasta2/Area2D.collision_mask = 1
		
		$Ingredients_Container/Food_Pasta3.show() 
		$Ingredients_Container/Food_Pasta3.collision_layer = 1
		$Ingredients_Container/Food_Pasta3.collision_mask = 1
		$Ingredients_Container/Food_Pasta3/Area2D.collision_layer = 1
		$Ingredients_Container/Food_Pasta3/Area2D.collision_mask = 1
		
		$Ingredients_Container/Food_Pasta4.show() 
		$Ingredients_Container/Food_Pasta4.collision_layer = 1
		$Ingredients_Container/Food_Pasta4.collision_mask = 1
		$Ingredients_Container/Food_Pasta4/Area2D.collision_layer = 1
		$Ingredients_Container/Food_Pasta4/Area2D.collision_mask = 1
		
		$Ingredients_Container/Food_Pasta5.show() 
		$Ingredients_Container/Food_Pasta5.collision_layer = 1
		$Ingredients_Container/Food_Pasta5.collision_mask = 1
		$Ingredients_Container/Food_Pasta5/Area2D.collision_layer = 1
		$Ingredients_Container/Food_Pasta5/Area2D.collision_mask = 1
		
		$Ingredients_Container/Food_Pasta6.show() 
		$Ingredients_Container/Food_Pasta6.collision_layer = 1
		$Ingredients_Container/Food_Pasta6.collision_mask = 1
		$Ingredients_Container/Food_Pasta6/Area2D.collision_layer = 1
		$Ingredients_Container/Food_Pasta6/Area2D.collision_mask = 1
		
		$Ingredients_Container/Food_Sauce.show()
		$Ingredients_Container/Food_Sauce.collision_layer = 1
		$Ingredients_Container/Food_Sauce.collision_mask = 1
		$Ingredients_Container/Food_Sauce/Area2D.collision_layer = 1
		$Ingredients_Container/Food_Sauce/Area2D.collision_mask = 1
		
		$Ingredients_Container/Food_Sauce2.show()
		$Ingredients_Container/Food_Sauce2.collision_layer = 1
		$Ingredients_Container/Food_Sauce2.collision_mask = 1
		$Ingredients_Container/Food_Sauce2/Area2D.collision_layer = 1
		$Ingredients_Container/Food_Sauce2/Area2D.collision_mask = 1
		
		$Ingredients_Container/Food_Sauce3.show()
		$Ingredients_Container/Food_Sauce3.collision_layer = 1
		$Ingredients_Container/Food_Sauce3.collision_mask = 1
		$Ingredients_Container/Food_Sauce3/Area2D.collision_layer = 1
		$Ingredients_Container/Food_Sauce3/Area2D.collision_mask = 1
		
		$Ingredients_Container/Food_Sauce4.show()
		$Ingredients_Container/Food_Sauce4.collision_layer = 1
		$Ingredients_Container/Food_Sauce4.collision_mask = 1
		$Ingredients_Container/Food_Sauce4/Area2D.collision_layer = 1
		$Ingredients_Container/Food_Sauce4/Area2D.collision_mask = 1
		
		$Flag/Label.show()
		
		

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	$CanvasModulate.show()
