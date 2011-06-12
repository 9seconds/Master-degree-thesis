#!/usr/bin/env bash



# ------------------------------------------------------------------------------



MAINFILE="main"
HANDOUTFILE="handout_"
DOCMAIN="speech"

PDFVERSION=5
PDFCOMPRESS=9
PDFOBJCOMPRESS=3

GENOPTS="\pdfminorversion${PDFVERSION}\pdfcompresslevel${PDFCOMPRESS}\pdfobjcompresslevel${PDFOBJCOMPRESS}\input"
PDFTEX="`which pdflatex` \"${GENOPTS}\""



# ------------------------------------------------------------------------------



cd Speech



# ------------------------------------------------------------------------------



echo "- Generating ${DOCMAIN}.pdf"
${PDFTEX} ${MAINFILE} > /dev/null && rm -f ${MAINFILE}.pdf
${PDFTEX} ${MAINFILE} > /dev/null && mv -f ${MAINFILE}.pdf ../${DOCMAIN}.pdf



# ------------------------------------------------------------------------------



echo "+ Cleaning temporary files"
rm -rf *.{log,aux,dvi,thm,out,snm,toc,nav,xml,pdf}



# ------------------------------------------------------------------------------



echo "Done"
exit 0
