extends Control

signal restart_button_pressed
signal main_menu_button_pressed

@onready var score_label = $NavBoxMargin/NavBox/Score

func _ready() -> void:
    self.main_menu_button_pressed.connect(_on_main_menu_button_pressed)
    self.restart_button_pressed.connect(_on_restart_button_pressed)

    self.child_entered_tree.connect(_update_score)
    _update_score()

func _update_score(_node: Node= null) -> void:
    score_label.text = "Score: " + str(StatManager.score_gained)

func _on_restart_button_pressed() -> void:
    UiManager.emit_signal("triggered_gamearea_setup")

func _on_main_menu_button_pressed() -> void:
    UiManager.emit_signal("skipped_to_main_menu")
