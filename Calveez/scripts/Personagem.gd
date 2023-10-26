extends Area2D

# Configurações de lançamento
var objeto_a_lancar: RigidBody2D
var forca_do_lancamento: float = 500  # A força do lançamento
var angulo_do_lancamento: float = 45  # O ângulo do lançamento em graus

# Chame esta função quando quiser realizar o lançamento
func lancar_objeto():
	var direcao = Vector2(1, 0).rotated(deg_to_rad(angulo_do_lancamento))
	objeto_a_lancar.linear_velocity = direcao * forca_do_lancamento
	
func _input(event):
	if event is InputEventMouseMotion:
		# Obtém a posição do mouse em relação ao personagem
		var mouse_position = event.position - global_position
		# Calcula o ângulo em relação ao vetor direção (1, 0)
		angulo_do_lancamento = mouse_position.angle()
	elif event is InputEventKey:
		if event.is_action_pressed("seta_esquerda"):
			angulo_do_lancamento -= 5  # Ajusta o ângulo para a esquerda
		elif event.is_action_pressed("seta_direita"):
			angulo_do_lancamento += 5  # Ajusta o ângulo para a direita
			
func _on_Area2D_body_entered(body):
	if body == objeto_a_lancar:
		# O objeto lançado atingiu o alvo
		# Faça alguma coisa aqui, como destruir o objeto ou marcar pontos.
