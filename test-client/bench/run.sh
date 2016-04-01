#!/bin/sh

# config
CONFIGFILE="vagrant.config"

# execute everything in tmp directory to make it work in a vagrant box too (missing symlinks on windows)
SCRIPT=`realpath -s $0`
SCRIPTPATH=`dirname $SCRIPT`

TESTDIR="/tmp/basho-bench"
RESULTSDIR="${TESTDIR}/tests"

mkdir -p $RESULTSDIR
cp $CONFIGFILE ${TESTDIR}/tmp.config
rm -R ${RESULTSDIR}/*

cd $TESTDIR
basho_bench --results-dir ${TESTDIR}/ ${TESTDIR}/tmp.config

# copy results back
mkdir -p ${SCRIPTPATH}/tests
cp -R ${RESULTSDIR} ${SCRIPTPATH}/tests
