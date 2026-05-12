import os, math

# ─────────────────────────────────────────────
# CORES (BB GGG RRR)
# ─────────────────────────────────────────────
SURFACE    = 9    # #141720 fundo
SURFACE2   = 16   # #1a1e2a superfície secundária
PRIMARY    = 186  # #4af0c0 teal
MUTED      = 155  # #6a7a9a texto muted
FAINT      = 64   # #3a4460 texto faint
BORDER     = 18   # rgba(100,200,255,0.12) borda sutil
DANGER     = 87   # #ff4466 vermelho
OFF        = 0    # preto / transparente

os.makedirs('sprites', exist_ok=True)

def save(name, g, W, H):
    path = f'sprites/{name}.s'
    with open(path, 'w') as f:
        f.write(f"{name}:\n\t.word {W}, {H}\n\t.byte\n")
        for i, row in enumerate(g):
            suffix = ',' if i < H-1 else ''
            f.write('\t' + ','.join(str(v) for v in row) + suffix + '\n')
    print(f"  {path} ({W}x{H})")

def hline(g, y, x1, x2, cor, W, H, t=1):
    for dy in range(t):
        for x in range(x1, x2+1):
            if 0<=y+dy<H and 0<=x<W:
                g[y+dy][x] = cor

def vline(g, x, y1, y2, cor, W, H, t=1):
    for dx in range(t):
        for y in range(y1, y2+1):
            if 0<=y<H and 0<=x+dx<W:
                g[y][x+dx] = cor

def fill_rect(g, x1, y1, x2, y2, cor, W, H):
    for y in range(y1, y2+1):
        for x in range(x1, x2+1):
            if 0<=y<H and 0<=x<W:
                g[y][x] = cor

# ═══════════════════════════════════════════════
# 1. HEADER — 512 × 48
# ═══════════════════════════════════════════════
W, H = 512, 48
g = [[SURFACE2]*W for _ in range(H)]

# borda inferior
hline(g, 47, 0, 511, BORDER, W, H, 1)

# linha decorativa teal no topo
hline(g, 0, 0, 511, PRIMARY, W, H, 1)

save('header', g, W, H)

# ═══════════════════════════════════════════════
# 2. UNDERLINE DA LETRA — 20 × 16
# Uma barra embaixo para cada letra da palavra
# Largura 20 (múltiplo de 4), altura 16
# ═══════════════════════════════════════════════
W, H = 20, 16
g = [[OFF]*W for _ in range(H)]

# linha teal na base (y=14 e y=15)
hline(g, 14, 0, 19, PRIMARY, W, H, 2)

save('letra_slot', g, W, H)

# ═══════════════════════════════════════════════
# 3. PAINEL DIREITO — 312 × 320
# Inclui labels: Categoria, Letras erradas, Vidas
# ═══════════════════════════════════════════════
W, H = 312, 320
g = [[SURFACE]*W for _ in range(H)]

# borda esquerda
vline(g, 0, 0, 319, BORDER, W, H, 2)

# ── Label "CATEGORIA" ──
# Desenhado como bloco de pixels (sem fonte, só indicação de área)
# y=16: linha separadora faint
hline(g, 16, 8, 303, FAINT, W, H, 1)

# caixinha de dica (y=24 até y=64, x=8 até x=303)
fill_rect(g, 8, 24, 303, 64, SURFACE2, W, H)
# borda da caixinha
hline(g, 24,  8, 303, BORDER, W, H, 1)
hline(g, 64,  8, 303, BORDER, W, H, 1)
vline(g,  8, 24,  64, BORDER, W, H, 1)
vline(g, 303,24,  64, BORDER, W, H, 1)

# ── Separador "LETRAS ERRADAS" ──
hline(g, 90, 8, 303, FAINT, W, H, 1)

# área letras erradas (y=98 até y=148)
fill_rect(g, 8, 98, 303, 148, SURFACE2, W, H)
hline(g, 98,  8, 303, BORDER, W, H, 1)
hline(g, 148, 8, 303, BORDER, W, H, 1)
vline(g, 8,  98, 148, BORDER, W, H, 1)
vline(g, 303,98, 148, BORDER, W, H, 1)

# ── Separador "VIDAS" ──
hline(g, 170, 8, 303, FAINT, W, H, 1)

# 6 bolinhas de vida (círculos simples) y=185, x=16,30,44,58,72,86
for i in range(6):
    cx = 16 + i*16
    cy = 182
    for dx in range(-4, 5):
        for dy in range(-4, 5):
            if dx*dx + dy*dy <= 16:
                if 0<=cy+dy<H and 0<=cx+dx<W:
                    g[cy+dy][cx+dx] = PRIMARY

save('painel_direito', g, W, H)

print("\nPronto! 3 sprites gerados em sprites/")
