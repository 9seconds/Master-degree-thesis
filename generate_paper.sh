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

echo "- Converting EPS to PDF"
for eps in *.eps
do
    epstopdf ${eps}
done

echo "- Generating ${DOCNAME}.pdf"
${PDFTEX} ${REVNAME} > /dev/null && rm -f ${REVNAME}.pdf
${PDFTEX} ${REVNAME} > /dev/null

${PDFTEX} ${MAINFILE} > /dev/null && rm -f ${MAINFILE}.pdf
${PDFTEX} ${MAINFILE} > /dev/null && mv -f ${MAINFILE}.pdf ../${DOCNAME}.pdf

echo "+ Cleaning temporary files"
mv -f pakshin_sign.pdf p.back
rm -rf *.{dvi,log,aux,thm,toc,out,pdf}
mv -f p.back pakshin_sign.pdf

echo "Done"
