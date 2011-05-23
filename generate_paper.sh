#!/bin/bash

MAINFILE="main"
DOCNAME="paper"

cd Paper

pdflatex ${MAINFILE} > /dev/null && rm -rf ${MAINFILE}.pdf
pdflatex ${MAINFILE} > /dev/null && mv -f ${MAINFILE}.pdf ../${DOCNAME}.pdf

rm -rf *.{dvi,log,aux,thm,toc}
