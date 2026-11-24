#!/bin/bash
# Gera a landing (landing-saas) e copia a versão pronta para esta pasta de publicação.
set -e
cd "$(dirname "$0")/.."
P="$(pwd)"
(cd ../landing-saas && npm run build)
rsync -a --delete --exclude .git --exclude deploy --exclude .htaccess --exclude README.md --exclude CNAME ../landing-saas/dist/ "$P/"
echo "Pronto. Agora: git add -A && git commit && git push, (o GitHub Pages publica sozinho)."
