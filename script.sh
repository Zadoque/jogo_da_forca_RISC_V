#!/bin/bash
# gera_versoes.sh

SRC="/home/dock/dev/jogo_da_forca_RISC_V/sprites/letras/letras_acertou"
# renomeia os originais para _acertou
for f in $SRC/*.s; do
    base="${f%.s}"
    sed -i 's/letra_\([A-Z]\):/letra_\1_acertou:/g' "$f"
    mv "$f" "${base}_acertou.s"
done