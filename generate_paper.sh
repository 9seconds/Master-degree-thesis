#!/bin/bash

MAINFILE="main"
DOCNAME="paper"
REVNAME="reviews"

PDFVERSION=5
PDFCOMPRESS=9
PDFOBJCOMPRESS=3

GENOPTS="\pdfminorversion${PDFVERSION}\pdfcompresslevel${PDFCOMPRESS}\pdfobjcompresslevel${PDFOBJCOMPRESS}\input"
PDFTEX="`which pdflatex` \"${GENOPTS}\""

cd Paper

echo "- Generating ${DOCNAME}.pdf"
${PDFTEX} ${REVNAME} > /dev/null && rm -f ${REVNAME}.pdf
${PDFTEX} ${REVNAME} > /dev/null

${PDFTEX} ${MAINFILE} > /dev/null && rm -f ${MAINFILE}.pdf
${PDFTEX} ${MAINFILE} > /dev/null && mv -f ${MAINFILE}.pdf ../${DOCNAME}.pdf

echo "+ Cleaning temporary files"
rm -rf *.{dvi,log,aux,thm,toc,out} ${REVNAME}.pdf

echo "Done"
