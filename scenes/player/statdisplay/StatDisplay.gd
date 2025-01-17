extends Control

@export var stats: StatsSynchronizerComponent

@onready var hp_value_label: Label = $ScrollContainer/StatList/HPSplitContainer/Value
@onready var hp_max_value_label: Label = $ScrollContainer/StatList/HPMaxSplitContainer/Value
@onready var energy_value_label: Label = $ScrollContainer/StatList/EnergySplitContainer/Value
@onready var energy_max_value_label: Label = $ScrollContainer/StatList/EnergyMaxSplitContainer/Value
@onready
var energy_regeneration_value_label: Label = $ScrollContainer/StatList/EnergyRegenSplitContainer/Value
@onready var level_value_label: Label = $ScrollContainer/StatList/LevelSplitContainer/Value
@onready var experience_value_label: Label = $ScrollContainer/StatList/ExperienceSplitContainer/Value
@onready
var experience_needed_value_label: Label = $ScrollContainer/StatList/ExperienceNeededSplitContainer/Value
@onready
var attack_power_min_value_label: Label = $ScrollContainer/StatList/AttackPowerMinSplitContainer/Value
@onready
var attack_power_max_value_label: Label = $ScrollContainer/StatList/AttackPowerMaxSplitContainer/Value
@onready var defense_value_label: Label = $ScrollContainer/StatList/DefenseSplitContainer/Value


func _ready() -> void:
	if stats:
		stats.stats_changed.connect(_on_stats_changed)
		renew_values()
	else:
		GodotLogger.error("Stats is not assigned")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("j_toggle_stats"):
		visible = !visible


func renew_values():
	hp_value_label.text = str(stats.hp)
	hp_max_value_label.text = str(stats.hp_max)
	energy_value_label.text = str(stats.energy)
	energy_max_value_label.text = str(stats.energy_max)
	energy_regeneration_value_label.text = str(stats.energy_regen)
	level_value_label.text = str(stats.level)
	experience_value_label.text = str(stats.experience)
	experience_needed_value_label.text = str(stats.experience_needed)
	attack_power_min_value_label.text = str(stats.attack_power_min)
	attack_power_max_value_label.text = str(stats.attack_power_max)
	defense_value_label.text = str(stats.defense)


func _on_stats_changed(type: StatsSynchronizerComponent.TYPE):
	match type:
		StatsSynchronizerComponent.TYPE.HP_MAX:
			hp_max_value_label.text = str(stats.hp_max)
		StatsSynchronizerComponent.TYPE.HP:
			hp_value_label.text = str(stats.hp)
		StatsSynchronizerComponent.TYPE.ENERGY:
			energy_value_label.text = str(stats.energy)
		StatsSynchronizerComponent.TYPE.ENERGY_MAX:
			energy_max_value_label.text = str(stats.energy_max)
		StatsSynchronizerComponent.TYPE.ENERGY_REGEN:
			energy_regeneration_value_label.text = str(stats.energy_regen)
		StatsSynchronizerComponent.TYPE.ATTACK_POWER_MIN:
			attack_power_min_value_label.text = str(stats.attack_power_min)
		StatsSynchronizerComponent.TYPE.ATTACK_POWER_MAX:
			attack_power_max_value_label.text = str(stats.attack_power_max)
		StatsSynchronizerComponent.TYPE.ATTACK_SPEED:
			# TODO: not added yet
			pass
		StatsSynchronizerComponent.TYPE.ATTACK_RANGE:
			# TODO: not added yet
			pass
		StatsSynchronizerComponent.TYPE.DEFENSE:
			defense_value_label.text = str(stats.defense)
		StatsSynchronizerComponent.TYPE.MOVEMENT_SPEED:
			# TODO: not added yet
			pass
		StatsSynchronizerComponent.TYPE.LEVEL:
			level_value_label.text = str(stats.level)
		StatsSynchronizerComponent.TYPE.EXPERIENCE:
			experience_value_label.text = str(stats.experience)
		StatsSynchronizerComponent.TYPE.EXPERIENCE_NEEDED:
			experience_needed_value_label.text = str(stats.experience_needed)
