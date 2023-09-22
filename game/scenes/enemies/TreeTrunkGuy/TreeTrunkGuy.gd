extends GMFEnemyBody2D

@onready var animaiton_player = $AnimationPlayer

@onready var skeleton = $Skeleton
@onready var original_scale = $Skeleton.scale


func _ready():
	super()
	entity_type = Gmf.ENTITY_TYPE.ENEMY
	enemy_class = "TreeTrunkGuy"

	if Gmf.is_server():
		return

	state_changed.connect(_on_state_changed)
	got_hurt.connect(_on_got_hurt)

	animaiton_player.play("Idle")


func update_face_direction():
	if velocity.x < 0:
		skeleton.scale = original_scale
	else:
		skeleton.scale = Vector2(original_scale.x * -1, original_scale.y)


func _on_state_changed(_new_state: STATE, _direction: Vector2, _duration: float):
	pass


func _on_got_hurt(_from: String, _hp: int, _damage: int):
	animaiton_player.play("Hurt")