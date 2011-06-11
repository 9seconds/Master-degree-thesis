#!/usr/bin/env bash



# ------------------------------------------------------------------------------



READYDIR="Ready"

GENPAPER="generate_paper"
GENPRES="generate_presentation"



# ------------------------------------------------------------------------------



rm -rf ${READYDIR}



# ------------------------------------------------------------------------------



echo "- Generating paper"
if [ "signed" = "$1" ]
then
    ./${GENPAPER}.sh signed > /dev/null
else
    ./${GENPAPER}.sh        > /dev/null
fi



# ------------------------------------------------------------------------------



echo "- Generating presentations"
./${GENPRES}.sh > /dev/null



# ------------------------------------------------------------------------------



mkdir -p ${READYDIR} && mv -f *.pdf ${READYDIR}/



# ------------------------------------------------------------------------------



echo "Documents can be found at '`pwd`/${READYDIR}'"
exit 0

