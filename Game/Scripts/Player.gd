extends CharacterBody2D

#define movement speed in the forward direction

const SPEED = 50
var moved : bool

var mouse_pos : Vector2
var mouse_angle : float
func _process(delta):
	mouse_pos = get_viewport().get_mouse_position()
	mouse_angle = (position - get_viewport().get_mouse_position()).angle()
	position.x = wrapf(position.x, 0, get_viewport().size.x)
	position.y = wrapf(position.y, 0, get_viewport().size.y)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	moved = Input.is_key_pressed(KEY_W)
	rotation = mouse_angle
	if moved:
		velocity = SPEED * transform.basis_xform(Vector2.LEFT) * delta
	else:	
		velocity = Vector2.ZERO
	move_and_collide(velocity)	
		
