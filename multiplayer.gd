extends Node2D

var peer = ENetMultiplayerPeer.new()
@export var player_scene : PackedScene
const PORT = 135
 

func _on_host_pressed() -> void:
	peer.create_server(PORT)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_add_player)
	_add_player()
	
	
func _add_player(id = 1):
	var player = player_scene.instantiate()
	player.name = str(id)
	call_deferred("add_child",player)


func _on_join_pressed() -> void:
	peer.create_client("localhost", PORT) # Replace with function body.
	multiplayer.multiplayer_peer = peer
