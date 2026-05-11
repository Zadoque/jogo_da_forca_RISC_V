.data

# ─────────────────────────────────────────────
# letras para quando acertar
# ─────────────────────────────────────────────
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

# ─────────────────────────────────────────────
# letras para quando acertar
# ─────────────────────────────────────────────

.text

# ═══════════════════════════════════════════════
#  CONFIGURAÇÃO DO BITMAP DISPLAY
#  Base:       0x10040000 (heap)
#  Resolução:  512 x 512 pixels
#  Unit Width: 1 | Unit Height: 1
#  Cada pixel ocupa 1 WORD (4 bytes) na memória
# ═══════════════════════════════════════════════

main:

    # ── 2. Desenhar ZADOQUE ─────────────────────
    # 7 letras × 8px = 56px + 6 espaços × 2px = 68px
    # x inicial = (512 - 68) / 2 = 222
    # y = 250 (centro vertical)
    li   a2, 250            # y fixo para todas as letras
    li   a3, 0              # frame 0

    # Z — x = 222
    la   a0, letra_Z_acertou
    li   a1, 222
    call PRINT

    # A — x = 232
    la   a0, letra_A_acertou
    addi a1, a1, 10
    call PRINT

    # D — x = 242
    la   a0, letra_D_acertou
    addi a1, a1, 10
    call PRINT

    # O — x = 252
    la   a0, letra_O_acertou
    addi a1, a1, 10
    call PRINT

    # Q — x = 262
    la   a0, letra_Q_acertou
    addi a1, a1, 10
    call PRINT

    # U — x = 272
    la   a0, letra_U_acertou
    addi a1, a1, 10
    call PRINT

    # E — x = 282
    la   a0, letra_E_acertou
    addi a1, a1, 10
    call PRINT

    # ── 3. Loop infinito ────────────────────────
LOOP:
    j LOOP




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