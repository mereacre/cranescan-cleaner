#!/bin/bash

if [[ "$1" != "" ]]; then
	DIR="$1"
else
	DIR=.
fi

for entry in "$DIR"*.pridb
do
	FILENAME=${entry##*/}
	DIRNAME=${FILENAME::-6}
	DIRPATH=$DIR$DIRNAME

	echo "Creating directory:" $DIRPATH
	mkdir -v "$DIRPATH"
	
	echo "$FILENAME" > "$DIRPATH/name.txt"

	./export.sh "$entry" "$DIRPATH/acq_setup" acq_setup
	./export.sh "$entry" "$DIRPATH/ae_data" ae_data
	./export.sh "$entry" "$DIRPATH/ae_fieldinfo" ae_fieldinfo
	./export.sh "$entry" "$DIRPATH/ae_globalinfo" ae_globalinfo
	./export.sh "$entry" "$DIRPATH/ae_markers" ae_markers
	./export.sh "$entry" "$DIRPATH/ae_params" ae_params
	./export.sh "$entry" "$DIRPATH/data_integrity" data_integrity
	./export.sh "$entry" "$DIRPATH/view_ae_data" view_ae_data
	./export.sh "$entry" "$DIRPATH/view_ae_markers" view_ae_markers
done


