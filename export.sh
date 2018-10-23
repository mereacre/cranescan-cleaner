#!/bin/bash

echo $1
echo $2
echo $3

sqlite3 "$1" <<!
.headers on
.mode csv
.output "$2"
select * from "$3";
!

