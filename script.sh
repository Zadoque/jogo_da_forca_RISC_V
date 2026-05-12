#!/bin/bash
# gera_versoes.sh

SRC="/home/dock/dev/jogo_da_forca_RISC_V/sprites/letras/letras_normal"
# renomeia os originais para _acertou
# converte arquivos existentes para um .byte por linha
for f in $SRC/*.s; do
	sed -i 's/[\\]*$//' "$f"
done
