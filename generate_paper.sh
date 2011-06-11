#!/usr/bin/env bash



# ------------------------------------------------------------------------------



MAINFILE="main"
DOCNAME="paper"
REVFILE="reviews"
TMPSIGN="_"
TITLEFILE="titlepage"

PDFVERSION=5
PDFCOMPRESS=9
PDFOBJCOMPRESS=3

GENOPTS="\pdfminorversion${PDFVERSION}\pdfcompresslevel${PDFCOMPRESS}\pdfobjcompresslevel${PDFOBJCOMPRESS}\input"
PDFTEX="`which pdflatex` \"${GENOPTS}\""



# ------------------------------------------------------------------------------



cd Paper


# ------------------------------------------------------------------------------



if [ "signed" = "$1" ]
then
    cat ${MAINFILE}.tex    | sed "s/${REVFILE}/${REVFILE}${TMPSIGN}/; s/{${TITLEFILE}}/{${TITLEFILE}${TMPSIGN}}/;" \
        > ${MAINFILE}${TMPSIGN}.tex
    cat ${REVFILE}.tex     | sed "/^[ ]*профессор/d; /^%[ ]*профессор/{s/^%//};"                                   \
        > ${REVFILE}${TMPSIGN}.tex
    cat ${TITLEFILE}.tex   | sed "/^[ ]*Научный/d; /^%[ ]*Научный/{s/^%//};"                                       \
        > ${TITLEFILE}${TMPSIGN}.tex

    MAINFILE=${MAINFILE}${TMPSIGN}
    REVFILE=${REVFILE}${TMPSIGN}
    TITLEFILE=${TITLEFILE}${TMPSIGN}
fi



# ------------------------------------------------------------------------------



echo "+ Converting EPS to PDF"
for eps in *.eps
do
    epstopdf ${eps}
done



# ------------------------------------------------------------------------------



echo "- Generating ${DOCNAME}.pdf"
${PDFTEX} ${REVFILE}  > /dev/null && rm -f ${REVFILE}.pdf
${PDFTEX} ${REVFILE}  > /dev/null

${PDFTEX} ${MAINFILE} > /dev/null && rm -f ${MAINFILE}.pdf
${PDFTEX} ${MAINFILE} > /dev/null && mv -f ${MAINFILE}.pdf ../${DOCNAME}.pdf



# ------------------------------------------------------------------------------



echo "+ Cleaning temporary files"
mv -f  pakshin_sign.pdf t
rm -rf *.{dvi,log,aux,thm,toc,out,pdf} *${TMPSIGN}.tex
mv -f  t pakshin_sign.pdf



# ------------------------------------------------------------------------------



echo "Done"
exit 0

