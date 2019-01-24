extends KinematicBody
class_name Visiteur 

export var vitesse_deplacement : float = 10.0
export var vitesse_rotation : float = 3.0


func _physics_process(delta : float ) -> void:
	var deplacement_axeZ : float = Input.get_action_strength("avancer") - Input.get_action_strength("reculer") 
	var tourner : float = Input.get_action_strength("gauche") - Input.get_action_strength("droite")

	rotation.y += tourner * vitesse_rotation * delta

	var direction : Vector3 = Vector3.FORWARD.rotated(Vector3.UP, rotation.y)
	var mouvement : Vector3 = direction * deplacement_axeZ * delta * vitesse_deplacement
	
	move_and_collide(mouvement)
