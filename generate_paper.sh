#!/bin/bash

MAINFILE="main"
DOCNAME="masterdegree"

cd Paper
pdflatex ${MAINFILE} > /dev/null && rm -rf ${MAINFILE}.pdf
pdflatex ${MAINFILE} > /dev/null && mv ${MAINFILE}.pdf ../${DOCNAME}.pdf

