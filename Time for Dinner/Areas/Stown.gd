extends Node2D
var enemy_check = false

func _physics_process(delta):
	$Enemy_Container.get_child_count()
	if $Enemy_Container.get_child_count() == 0 and enemy_check == false:
		$Ingredients_Container/Food_Pasta.show() 
		$Ingredients_Container/Food_Pasta.collision_layer = 1
		$Ingredients_Container/Food_Pasta.collision_mask = 1
		$Ingredients_Container/Food_Pasta/Area2D.collision_layer = 1
		$Ingredients_Container/Food_Pasta/Area2D.collision_mask = 1
		$Ingredients_Container/Food_Sauce.show()
		$Ingredients_Container/Food_Sauce.collision_layer = 1
		$Ingredients_Container/Food_Sauce.collision_mask = 1
		$Ingredients_Container/Food_Sauce/Area2D.collision_layer = 1
		$Ingredients_Container/Food_Sauce/Area2D.collision_mask = 1
		enemy_check = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
