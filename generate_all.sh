#!/bin/bash

READYDIR="Ready"
GENPAPER="generate_paper"
GENPRES="generate_presentation"

rm -rf ${READYDIR}

echo "- Generating paper"
./${GENPAPER}.sh > /dev/null
echo "- Generating presentations"
./${GENPRES}.sh > /dev/null

mkdir -p ${READYDIR} && mv -f *.pdf ${READYDIR}/

echo "Documents can be found at '`pwd`/Ready' directory"
