.data


str0: .string "ALGORITMO"
str1: .string "COMPILADOR"
str2: .string "PONTEIRO"
str3: .string "KERNEL"
str4: .string "PILHA"
nova_linha: .string "\n"

# Vetor de ponteiros para as strings
palavras: .word str0, str1, str2, str3, str4
#quantidade de letras em cada palavra
qtd_letras: .word 9, 10, 8, 6, 5
# =========================================================
# SPRITES
# =========================================================
.include "sprites/header.s"
.include "sprites/painel_direito.s"
.include "sprites/letra_slot.s"

.include "sprites/forca/forca_0.s"
.include "sprites/forca/forca_1.s"
.include "sprites/forca/forca_2.s"
.include "sprites/forca/forca_3.s"
.include "sprites/forca/forca_4.s"
.include "sprites/forca/forca_5.s"
.include "sprites/forca/forca_6.s"

# normal
.include "sprites/letras/letras_normal/a_normal.s"
.include "sprites/letras/letras_normal/b_normal.s"
.include "sprites/letras/letras_normal/c_normal.s"
.include "sprites/letras/letras_normal/d_normal.s"
.include "sprites/letras/letras_normal/e_normal.s"
.include "sprites/letras/letras_normal/f_normal.s"
.include "sprites/letras/letras_normal/g_normal.s"
.include "sprites/letras/letras_normal/h_normal.s"
.include "sprites/letras/letras_normal/i_normal.s"
.include "sprites/letras/letras_normal/j_normal.s"
.include "sprites/letras/letras_normal/k_normal.s"
.include "sprites/letras/letras_normal/l_normal.s"
.include "sprites/letras/letras_normal/m_normal.s"
.include "sprites/letras/letras_normal/n_normal.s"
.include "sprites/letras/letras_normal/o_normal.s"
.include "sprites/letras/letras_normal/p_normal.s"
.include "sprites/letras/letras_normal/q_normal.s"
.include "sprites/letras/letras_normal/r_normal.s"
.include "sprites/letras/letras_normal/s_normal.s"
.include "sprites/letras/letras_normal/t_normal.s"
.include "sprites/letras/letras_normal/u_normal.s"
.include "sprites/letras/letras_normal/v_normal.s"
.include "sprites/letras/letras_normal/w_normal.s"
.include "sprites/letras/letras_normal/x_normal.s"
.include "sprites/letras/letras_normal/y_normal.s"
.include "sprites/letras/letras_normal/z_normal.s"

# acertou
.include "sprites/letras/letras_acertou/a_acertou.s"
.include "sprites/letras/letras_acertou/b_acertou.s"
.include "sprites/letras/letras_acertou/c_acertou.s"
.include "sprites/letras/letras_acertou/d_acertou.s"
.include "sprites/letras/letras_acertou/e_acertou.s"
.include "sprites/letras/letras_acertou/f_acertou.s"
.include "sprites/letras/letras_acertou/g_acertou.s"
.include "sprites/letras/letras_acertou/h_acertou.s"
.include "sprites/letras/letras_acertou/i_acertou.s"
.include "sprites/letras/letras_acertou/j_acertou.s"
.include "sprites/letras/letras_acertou/k_acertou.s"
.include "sprites/letras/letras_acertou/l_acertou.s"
.include "sprites/letras/letras_acertou/m_acertou.s"
.include "sprites/letras/letras_acertou/n_acertou.s"
.include "sprites/letras/letras_acertou/o_acertou.s"
.include "sprites/letras/letras_acertou/p_acertou.s"
.include "sprites/letras/letras_acertou/q_acertou.s"
.include "sprites/letras/letras_acertou/r_acertou.s"
.include "sprites/letras/letras_acertou/s_acertou.s"
.include "sprites/letras/letras_acertou/t_acertou.s"
.include "sprites/letras/letras_acertou/u_acertou.s"
.include "sprites/letras/letras_acertou/v_acertou.s"
.include "sprites/letras/letras_acertou/w_acertou.s"
.include "sprites/letras/letras_acertou/x_acertou.s"
.include "sprites/letras/letras_acertou/y_acertou.s"
.include "sprites/letras/letras_acertou/z_acertou.s"

# errou
.include "sprites/letras/letras_errou/a_errou.s"
.include "sprites/letras/letras_errou/b_errou.s"
.include "sprites/letras/letras_errou/c_errou.s"
.include "sprites/letras/letras_errou/d_errou.s"
.include "sprites/letras/letras_errou/e_errou.s"
.include "sprites/letras/letras_errou/f_errou.s"
.include "sprites/letras/letras_errou/g_errou.s"
.include "sprites/letras/letras_errou/h_errou.s"
.include "sprites/letras/letras_errou/i_errou.s"
.include "sprites/letras/letras_errou/j_errou.s"
.include "sprites/letras/letras_errou/k_errou.s"
.include "sprites/letras/letras_errou/l_errou.s"
.include "sprites/letras/letras_errou/m_errou.s"
.include "sprites/letras/letras_errou/n_errou.s"
.include "sprites/letras/letras_errou/o_errou.s"
.include "sprites/letras/letras_errou/p_errou.s"
.include "sprites/letras/letras_errou/q_errou.s"
.include "sprites/letras/letras_errou/r_errou.s"
.include "sprites/letras/letras_errou/s_errou.s"
.include "sprites/letras/letras_errou/t_errou.s"
.include "sprites/letras/letras_errou/u_errou.s"
.include "sprites/letras/letras_errou/v_errou.s"
.include "sprites/letras/letras_errou/w_errou.s"
.include "sprites/letras/letras_errou/x_errou.s"
.include "sprites/letras/letras_errou/y_errou.s"
.include "sprites/letras/letras_errou/z_errou.s"


.text

# =============================================
#  CONFIGURAÇÃO DO BITMAP DISPLAY
#  Base:       0x10040000 (heap)
#  Resolução:  512 x 512 pixels
#  Unit Width: 1 | Unit Height: 1
#  Cada pixel ocupa 1 WORD (4 bytes) na memória
# =============================================
# Configuração do jogo:
# 
# =============================================
.globl main
main:
 call SETUP

# SETUP INICIAL: MOSTRAR FORCA INICIAL, TECLADO, HEADER PADRÃO:
SETUP:
 #mostrar forcado:
	la a0, forca_0
	li a1, 4
	li a2, 49
	li a3, 0
	call PRINT
	la a0, header
	li a1,0
	li a2,0
	li a3,0
	call PRINT
	jal GERAR_ALEATORIO       # Executa a função. O índice sorteado volta em a0
    
    # 2. Copia o índice sorteado para um registrador temporário
	mv t0, a0                 # t0 = índice sorteado (0 a 4)
    
    # 3. Calcula o deslocamento no vetor (índice * 4 bytes)
    	slli t0, t0, 2            # t0 = t0 * 4
    
    # 4. Busca o endereço da palavra sorteada
    	la t1, palavras           # t1 = endereço base do vetor de palavras
    	add t1, t1, t0            # t1 = posição exata do ponteiro na memória
    	lw s0, 0(t1)              # s0 = ponteiro para a string da palavra
    
    # 5. Busca a quantidade de letras da palavra sorteada
    	la t2, qtd_letras         # t2 = endereço base do vetor de tamanhos
   	add t2, t2, t0            # t2 = posição exata do tamanho na memória
    	lw s1, 0(t2)              # s1 = quantidade de letras
    	add s2,zero, s1
    	la a0, letra_slot
    	li a1, 104
    	li a2, 140
    	jal PRINT_SLOT
    

    # --- CÓDIGO DE IMPRESSÃO ---
    # Printa a palavra
    	mv a0, s0
    	li a7, 4
    	call
    
    	# Printa quebra de linha
    	la a0, nova_linha
    	li a7, 4
    	ecall
    
    	# Printa o tamanho
    	mv a0, s1
    	li a7, 1
    	ecall
     	# Finalizar o programa com segurança
    	li a7, 10               # syscall 10: exit
    	ecall
##
#
# GERAR ALEATÓRIO
GERAR_ALEATORIO:
    li a1, 5          # Limite superior (0 a 4)
    li a7, 42         # syscall 42: rand_range
    ecall             # a0 recebe o número aleatório
    ret               # Retorna para quem chamou (o índice está em a0)
##
# 
PRINT_SLOT:
    # 1. Aloca espaço na pilha e salva o registrador de retorno (ra)
    addi sp, sp, -4     # Abre 4 bytes de espaço na pilha
    sw ra, 0(sp)        # Salva o ra original na pilha

LOOP_SLOT:
    li a3, 0
    addi a1, a1, 28
    call PRINT          # O ra muda aqui, mas o original está seguro na pilha
    
    addi s2, s2, -1     # Decrementa o contador
    bgt s2, zero, LOOP_SLOT # Se s2 > 0, volta para o começo do loop

    # 2. Restaura o ra original da pilha antes de sair
    lw ra, 0(sp)        # Recupera o ra original
    addi sp, sp, 4      # Devolve o espaço da pilha
    
    ret                 # Agora o ret vai voltar com segurança para o jogo!
# ═══════════════════════════════════════════════
#  PRINT
#  Desenha sprite no bitmap display
#  Entrada:
#    a0 = endereço do sprite
#    a1 = x (coluna inicial)
#    a2 = y (linha inicial)
#    a3 = frame (0 ou 1)
#  Cada pixel = 1 word (4 bytes) → sw
#  x deve ser múltiplo de 4
# ═══════════════════════════════════════════════
PRINT:
    # ── Endereço base do frame ──
    # frame 0 → 0x10040000
    # frame 1 → 0x10050000
    li   t0, 0x1004
    add  t0, t0, a3
    slli t0, t0, 16

    # ── Offset: (y * 512 + x) * 4 ──
    li   t1, 512
    mul  t1, t1, a2         # 512 * y
    add  t1, t1, a1         # + x
    slli t1, t1, 2          # * 4 (word por pixel)
    add  t0, t0, t1         # endereço do primeiro pixel do sprite

    # ── Header do sprite ──
    lw   t4, 0(a0)          # t4 = largura
    lw   t5, 4(a0)          # t5 = altura
    addi t1, a0, 8          # t1 = ponteiro para os pixels (pula header)

    # ── Contadores ──
    mv   t2, zero           # t2 = linha atual
    mv   t3, zero           # t3 = coluna atual

PRINT_LINHA:
    # ── Pintar 1 pixel ──
    lb   t6, 0(t1)          # lê 1 byte da imagem (cor 0-255)
    sw   t6, 0(t0)          # escreve word no bitmap (pixel = 4 bytes)

    addi t0, t0, 4          # avança 4 bytes no bitmap (1 pixel)
    addi t1, t1, 1          # avança 1 byte na imagem
    addi t3, t3, 1          # coluna++

    blt  t3, t4, PRINT_LINHA  # coluna < largura → continua

    # ── Fim de linha: pular pixels restantes da linha do display ──
    # já andamos t4 pixels = t4*4 bytes
    # faltam (512 - t4) pixels = (512 - t4) * 4 bytes
    li   t6, 512
    sub  t6, t6, t4         # 512 - largura
    slli t6, t6, 2          # * 4
    add  t0, t0, t6         # pula para início da próxima linha

    mv   t3, zero           # zera coluna
    addi t2, t2, 1          # linha++

    blt  t2, t5, PRINT_LINHA  # linha < altura → continua

    ret
