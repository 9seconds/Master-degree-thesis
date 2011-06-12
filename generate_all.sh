#!/usr/bin/env bash



# ------------------------------------------------------------------------------



READYDIR="Ready"

GENTPL="generate"
GENPAPER="${GENTPL}_paper"
GENPRES="${GENTPL}_presentation"
GENSPEECH="${GENTPL}_speech"



# ------------------------------------------------------------------------------



rm -rf ${READYDIR}



# ------------------------------------------------------------------------------



echo "- Generating paper"
./${GENPAPER}.sh $1 > /dev/null



# ------------------------------------------------------------------------------



echo "- Generating presentations"
./${GENPRES}.sh > /dev/null



# ------------------------------------------------------------------------------



echo "- Generating speech"
./${GENSPEECH}.sh > /dev/null



# ------------------------------------------------------------------------------



mkdir -p ${READYDIR} && mv -f *.pdf ${READYDIR}/



# ------------------------------------------------------------------------------



echo "Documents can be found at '`pwd`/${READYDIR}'"
exit 0

