import os, math

W, H = 96, 180
WOOD = 155
ROPE = 101
BODY = 246
DEAD = 87
OFF  = 0

def make_grid():
    return [[OFF]*W for _ in range(H)]

def hline(g, y, x1, x2, cor, t=2):
    for dy in range(t):
        for x in range(x1, x2+1):
            if 0<=y+dy<H and 0<=x<W:
                g[y+dy][x] = cor

def vline(g, x, y1, y2, cor, t=2):
    for dx in range(t):
        for y in range(y1, y2+1):
            if 0<=y<H and 0<=x+dx<W:
                g[y][x+dx] = cor

def diag(g, x1, y1, x2, y2, cor, t=2):
    steps = max(abs(x2-x1), abs(y2-y1))
    for i in range(steps+1):
        x = round(x1+(x2-x1)*i/steps)
        y = round(y1+(y2-y1)*i/steps)
        for dt in range(t):
            if 0<=y+dt<H and 0<=x<W:
                g[y+dt][x] = cor

def circle(g, cx, cy, r, cor, t=2):
    for angle in range(0, 360, 2):
        rad = math.radians(angle)
        for dr in range(t):
            x = round(cx+(r+dr)*math.cos(rad))
            y = round(cy+(r+dr)*math.sin(rad))
            if 0<=y<H and 0<=x<W:
                g[y][x] = cor

def draw_gallows(g):
    hline(g, 172, 4,  90, WOOD, 3)  # base
    vline(g, 16,  8, 172, WOOD, 3)  # poste
    hline(g,  8, 16,  64, WOOD, 3)  # trave
    diag(g,  16, 34,  32,  8,   WOOD, 2)  # diagonal
    vline(g, 63,  8,  28, ROPE, 2)  # corda

def save(name, g):
    os.makedirs('sprites/forca', exist_ok=True)
    path = f'sprites/forca/{name}.s'
    with open(path, 'w') as f:
        f.write(f"{name}:\n\t.word {W}, {H}\n\t.byte\n")
        for i, row in enumerate(g):
            suffix = ',' if i < H-1 else ''
            f.write('\t' + ','.join(str(v) for v in row) + suffix + '\n')
    print(f"  {path} gerado!")

# forca_0 — estrutura vazia
g = make_grid()
draw_gallows(g)
save('forca_0', g)

# forca_1 — + cabeça
g = make_grid(); draw_gallows(g)
circle(g, 63, 36, 7, BODY)
save('forca_1', g)

# forca_2 — + corpo
g = make_grid(); draw_gallows(g)
circle(g, 63, 36, 7, BODY)
vline(g, 63, 43, 90, BODY)
save('forca_2', g)

# forca_3 — + braço esquerdo
g = make_grid(); draw_gallows(g)
circle(g, 63, 36, 7, BODY)
vline(g, 63, 43, 90, BODY)
diag(g, 63, 55, 44, 74, BODY)
save('forca_3', g)

# forca_4 — + braço direito
g = make_grid(); draw_gallows(g)
circle(g, 63, 36, 7, BODY)
vline(g, 63, 43, 90, BODY)
diag(g, 63, 55, 44, 74, BODY)
diag(g, 63, 55, 82, 74, BODY)
save('forca_4', g)

# forca_5 — + perna esquerda
g = make_grid(); draw_gallows(g)
circle(g, 63, 36, 7, BODY)
vline(g, 63, 43, 90, BODY)
diag(g, 63, 55, 44, 74, BODY)
diag(g, 63, 55, 82, 74, BODY)
diag(g, 63, 90, 46, 112, BODY)
save('forca_5', g)

# forca_6 — + perna direita + boneco morto vermelho
g = make_grid(); draw_gallows(g)
circle(g, 63, 36, 7, DEAD)
vline(g, 63, 43, 90, DEAD)
diag(g, 63, 55, 44, 74, DEAD)
diag(g, 63, 55, 82, 74, DEAD)
diag(g, 63, 90, 46, 112, DEAD)
diag(g, 63, 90, 80, 112, DEAD)
# olhos X
for dx in [-2,-1,1,2]:
    g[33][61+dx] = DEAD
    g[33][65+dx] = DEAD
# boca triste
g[40][61]=DEAD; g[40][65]=DEAD
g[41][62]=DEAD; g[41][64]=DEAD
g[42][63]=DEAD
save('forca_6', g)

print("\nPronto! 7 sprites gerados em sprites/forca/")
