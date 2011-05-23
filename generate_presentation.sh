#!/bin/bash

MAINFILE="main"
HANDOUTFILE="handout_"
DOCMAIN="presentation"
DOCHANDOUT="${DOCMAIN}_handout"

cd Presentation

echo "- Generating ${DOCMAIN}.pdf"
pdflatex ${MAINFILE} > /dev/null && rm -rf ${MAINFILE}.pdf
pdflatex ${MAINFILE} > /dev/null && mv -f  ${MAINFILE}.pdf ../${DOCMAIN}.pdf

echo "- Generating ${DOCHANDOUT}.pdf"
cat ${MAINFILE}.tex                                                           \
    | sed -e 's/\\usetheme{Singapore}//'                                      \
    | sed -e 's/%\\usetheme/\\usetheme/; s/%\\usecolortheme/\\usecolortheme/' \
        > ${HANDOUTFILE}.tex

pdflatex ${HANDOUTFILE} > /dev/null && rm -rf ${HANDOUTFILE}.pdf
pdflatex ${HANDOUTFILE} > /dev/null && mv -f  ${HANDOUTFILE}.pdf ../${DOCHANDOUT}.pdf

echo "+ Cleaning temporary files"
rm -rf ${HANDOUTFILE}.tex *.{log,aux,dvi,thm,out,snm,toc,nav,xml}

echo "Done"
