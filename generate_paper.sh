#!/bin/bash

MAINFILE="main"
DOCNAME="paper"

PDFVERSION=5
PDFCOMPRESS=9
PDFOBJCOMPRESS=3

GENOPTS="\pdfminorversion${PDFVERSION}\pdfcompresslevel${PDFCOMPRESS}\pdfobjcompresslevel${PDFOBJCOMPRESS}\input"
PDFTEX="`which pdflatex` ${GENOPTS}"

cd Paper

echo "- Generating ${DOCNAME}.pdf"
${PDFTEX} ${GENOPTS} ${MAINFILE} > /dev/null && rm -f ${MAINFILE}.pdf
${PDFTEX} ${GENOPTS} ${MAINFILE} > /dev/null && mv -f ${MAINFILE}.pdf ../${DOCNAME}.pdf

echo "+ Cleaning temporary files"
rm -rf *.{dvi,log,aux,thm,toc,out}

echo "Done"
