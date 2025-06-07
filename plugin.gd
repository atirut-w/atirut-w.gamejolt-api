@tool
extends EditorPlugin


var default_settings: Dictionary[String, Variant] = {
	"application/game_jolt/game_id": 0,
	"application/game_jolt/private_key": "",
}

func _enter_tree() -> void:
	for key in default_settings.keys():
		if !ProjectSettings.has_setting(key):
			ProjectSettings.set_setting(key, default_settings[key])
		ProjectSettings.set_initial_value(key, default_settings[key])
		ProjectSettings.set_as_basic(key, true)
		ProjectSettings.add_property_info({
			"name": key,
			"type": typeof(default_settings[key]),
		})
	
	add_autoload_singleton("GameJolt", "res://addons/atirut-w.game_jolt_api/api.gd")


func _exit_tree() -> void:
	for key in default_settings.keys():
		ProjectSettings.set_setting(key, null)
	
	remove_autoload_singleton("GameJolt")
