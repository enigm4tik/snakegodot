class_name FoodSpawner

extends Node

@export var walls: Walls 
@export var food_scene: PackedScene 
@export var snake: Snake

var food_position: Vector2

var food

const BODY_SEGMENT_SIZE = 32

func _ready():
	spawn_food()
	
func spawn_food():
	food = food_scene.instantiate()
	var x_position = int(round(randi_range(walls.top_left_corner.x + BODY_SEGMENT_SIZE, walls.bottom_right_corner.x - BODY_SEGMENT_SIZE ) / BODY_SEGMENT_SIZE ) * BODY_SEGMENT_SIZE)
	var y_position = int(round(randi_range(walls.top_left_corner.y + BODY_SEGMENT_SIZE, walls.bottom_right_corner.y - BODY_SEGMENT_SIZE ) / BODY_SEGMENT_SIZE ) * BODY_SEGMENT_SIZE)
	
	# make sure food doesnt spawn in snake
	var x = snake.check_snake_collision(Vector2(x_position, y_position))
	if x: 
		destroy_food()
		spawn_food()
	
	add_child(food)
	food_position = Vector2(x_position, y_position)
	food.position = food_position
	

func destroy_food():
	if food != null: 
		food.queue_free()
