#!/bin/bash

echo -e "# Índica de contenidos\n" > index.md

URL="https://guillermoih.github.io/M-todos-Generativos/"
PDFS=$(ls ./Slides/*.tex)

echo -e "## Diapositivas\n" >> index.md

for pdf in $PDFS; do
    name=$(basename "$pdf" .tex)
    echo "- [$name](./$name.pdf)" >> index.md
done

