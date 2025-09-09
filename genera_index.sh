#!/bin/bash

# Copiar el template como base
cp Template/index.html index.html

URL="https://guillermoih.github.io/M-todos-Generativos"
URLCOLAB="https://colab.research.google.com/github/guillermoih/M-todos-Generativos/blob/main/Notebooks"

# Generar enlaces de presentaciones
PRESENTACIONES_HTML=""
PDFS=$(ls ./Slides/*.tex 2>/dev/null)

for pdf in $PDFS; do
    name=$(basename "$pdf" .tex)
    name_txt=${name//_/ }
    PRESENTACIONES_HTML="${PRESENTACIONES_HTML}                    <li><a href=\"$URL/$name.pdf\">$name_txt</a></li>\n"
done

# Generar enlaces de notebooks
NOTEBOOKS_HTML=""
NOTEBOOKS=$(ls ./Notebooks/*.ipynb 2>/dev/null)

for notebook in $NOTEBOOKS; do
    name=$(basename "$notebook" .ipynb)
    name_txt=${name//_/ }
    name_txt=${name_txt//-/ }
    NOTEBOOKS_HTML="${NOTEBOOKS_HTML}                    <li><a href=\"$URLCOLAB/$name.ipynb\">$name_txt</a></li>\n"
done

# Reemplazar los comentarios con el contenido generado
sed -i "s|                    <!-- REPLACE: Presentaciones -->|$PRESENTACIONES_HTML|g" index.html
sed -i "s|                    <!-- REPLACE: Notebooks -->|$NOTEBOOKS_HTML|g" index.html

echo "Generado index.html en la raíz del proyecto"
