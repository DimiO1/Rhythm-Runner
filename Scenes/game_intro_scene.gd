extends CanvasLayer


const conductorLine1: Array[String] = [
	"Melody.....",
	"Wake up.",
	"The world has gone silent.",
	"Mute has turned his record label into a dangerous tower.",
	"Hes going to ruin music forever if you don't stop him.",
	"I will be with you.",
	"Go..."
]

const conductorLineTest: Array[String] = [
	"test"
]

var startedDialog = false

func _ready() -> void:
	$"../AnimationPlayer".play("FadeIn")
	$"../Music".play()
	
	
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if (anim_name == "FadeIn"):
		$"../AnimationPlayer".play("BackgroundAnimation")
	if (anim_name == "FadeOut"):
		get_tree().change_scene_to_file("res://Scenes/game.tscn")
	if not startedDialog:
		DialogManager.start_dialog($ConductorLocation.global_position,conductorLineTest,"Conductor","Intro")
		startedDialog = true
	if (anim_name == "BackgroundAnimation"):
		$"../AnimationPlayer".play("BackgroundAnimationReverse")
	if (anim_name == "BackgroundAnimationReverse"):
		$"../AnimationPlayer".play("BackgroundAnimation")


func _on_music_finished() -> void:
	$"../Music".play()
