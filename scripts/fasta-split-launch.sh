#!/usr/bin/env bash
#
# This script is intended to break up your fasta files into more manageable chunks
#

set -u
source ./config.sh
export CWD="$PWD"

PROG=`basename $0 ".sh"`
STDOUT_DIR="$CWD/pbs_logs/$PROG"

init_dir "$STDOUT_DIR"

mkdir -p $SPLIT_FA_DIR

cd "$PRJ_DIR"


JOB=$(qsub -V -N fastasplitter -j oe -o "$STDOUT_DIR" $WORKER_DIR/split_fa.sh)

if [ $? -eq 0 ]; then
  echo "Submitted job \"$JOB\" for you."
else
  echo -e "\nError submitting job\n$JOB\n"
fi



