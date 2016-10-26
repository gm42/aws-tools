#!/bin/bash

if [ $# -lt 4 ]; then
	echo "Usage: ec2-run.sh environment purpose ssh-user script.sh" 1>&2
	exit 1
fi

ENVIRONMENT="$1"
PURPOSE="$2"
USR="$3"
SCRIPT="$4"
shift 4

SNAME="$(basename $SCRIPT)"

set -e

for HOST in $(ec2-find "$ENVIRONMENT" "$PURPOSE" | awk '{ print $NF }'); do
	scp -q "$SCRIPT" ${USR}@$HOST:/tmp/
	echo -n "$HOST: "
	ssh -q ${USR}@$HOST -t "sudo /tmp/$SNAME $@"
done
