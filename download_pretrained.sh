#!/bin/bash

mkdir pretrained
cd pretrained

git init
git config core.sparsecheckout true
git remote add origin https://huggingface.co/lj1995/VoiceConversionWebUI

cat << 'EOF' > .git/info/sparse-checkout
hubert_base.pt
pretrained
pretrained_v2
uvr5_weights
EOF

git pull origin main
