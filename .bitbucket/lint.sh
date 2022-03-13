#!/bin/bash
failures=$(terraform fmt -write=false -list=true -recursive)
if [[ -n "${failures}" ]]; then 
  printf "Following files need to be formatted\n" 
  printf '%s' "$failures \n"
  terraform fmt -diff -write=false -recursive
  exit 1
fi
