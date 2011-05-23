#!/bin/bash

MAINFILE="main"
DOCNAME="paper"

cd Paper

echo "- Generating ${DOCNAME}.pdf"
pdflatex ${MAINFILE} > /dev/null && rm -rf ${MAINFILE}.pdf
pdflatex ${MAINFILE} > /dev/null && mv -f ${MAINFILE}.pdf ../${DOCNAME}.pdf

echo "+ Cleaning temporary files"
rm -rf *.{dvi,log,aux,thm,toc,out}

echo "Done"
