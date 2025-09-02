#!/bin/bash

echo -e "# Índica de contenidos\n" > index.md

URL="https://guillermoih.github.io/M-todos-Generativos/"
URLCOLAB="https://colab.research.google.com/github/guillermoih/M-todos-Generativos/blob/main/Notebooks"


echo -e "## Diapositivas\n" >> index.md
PDFS=$(ls ./Slides/*.tex)

for pdf in $PDFS; do
    name=$(basename "$pdf" .tex)
    echo "- [$name](./$name.pdf)" >> index.md
done

echo -e "## Notebooks\n" >> index.md
NOTEBOOKS=$(ls ./Notebooks/*.ipynb)

for notebook in $NOTEBOOKS; do
    name=$(basename "$notebook" .ipynb)
    echo "- [$name]($URLCOLAB/$name.ipynb)" >> index.md
done
