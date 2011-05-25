#!/bin/bash

MAINFILE="main"
HANDOUTFILE="handout_"
DOCMAIN="presentation"
DOCHANDOUT="${DOCMAIN}_handout"

PDFVERSION=5
PDFCOMPRESS=9
PDFOBJCOMPRESS=3

GENOPTS="\pdfminorversion${PDFVERSION}\pdfcompresslevel${PDFCOMPRESS}\pdfobjcompresslevel${PDFOBJCOMPRESS}\input"
PDFTEX="`which pdflatex` \"${GENOPTS}\""

cd Presentation

echo "- Generating ${DOCMAIN}.pdf"
${PDFTEX} ${MAINFILE} > /dev/null && rm -f ${MAINFILE}.pdf
${PDFTEX} ${MAINFILE} > /dev/null && mv -f ${MAINFILE}.pdf ../${DOCMAIN}.pdf

echo "- Generating ${DOCHANDOUT}.pdf"
cat ${MAINFILE}.tex                                                           \
    | sed -e 's/\\usetheme{Singapore}//'                                      \
    | sed -e 's/%\\usetheme/\\usetheme/; s/%\\usecolortheme/\\usecolortheme/' \
        > ${HANDOUTFILE}.tex

${PDFTEX} ${HANDOUTFILE} > /dev/null && rm -rf ${HANDOUTFILE}.pdf
${PDFTEX} ${HANDOUTFILE} > /dev/null && mv -f  ${HANDOUTFILE}.pdf ../${DOCHANDOUT}.pdf

echo "+ Cleaning temporary files"
rm -rf ${HANDOUTFILE}.tex *.{log,aux,dvi,thm,out,snm,toc,nav,xml}

echo "Done"
