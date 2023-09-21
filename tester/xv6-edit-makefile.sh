#! /bin/bash

infile=$1
testnames=$2

gawk -v testnames=$testnames '
($1 == "$U/_mkdir\\") {
  n = split(testnames, x, ",");
  for (i = 1; i <= n; i++) {
    printf("\t$U/_%s\\\n", x[i]);
  }
}

{
  print $0;
}' $infile
