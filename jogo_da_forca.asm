.text

#  a0 = endereço da imagem (caminho da imagem)
#  a1 = x (posição em x que vai começar a printar)
#  a2 = y (posição em y que vai começar a printar)
#  a3 = frame (0 ou 1)
##
#   t0 = endereço do bitmap display  (Endereço) = Endereço Base + linha * 512 + Coluna  (512x512)
#   t1 = endereço da imagem (onde na memória foi carregado os 4 pixels para printar) ( usando endereço base 0x10040000 )
#   t2 = contador de linha
#   t3 = contador de coluna  (os contadores são usados para pular de linha e coluna entre as chamadas de PRINT_LINHA
PRINT:
   li t0, 0x1004
   add t0, t0, a3