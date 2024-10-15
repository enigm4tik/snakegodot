extends CanvasLayer

var button_container: HBoxContainer
@onready var restart_button = $%Restart
@onready var quit_button = $%Quit

@onready var game_over_label = $GameOverLabel
@onready var points_label = $PointsLabel

@onready var snake:Snake = $"../Snake"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	snake.on_game_over.connect(on_game_over)
	snake.on_point_scored.connect(on_point_scored)
	button_container = get_node("BoxContainer")
	quit_button.pressed.connect(_on_quit_pressed)
	restart_button.pressed.connect(_on_restart_pressed)

func on_game_over():
	button_container.visible = true
	game_over_label.visible = true 
	

func on_point_scored(points: int):
	points_label.text = "Points: %d" % points


func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()


func _on_quit_pressed() -> void:
	get_tree().quit()
