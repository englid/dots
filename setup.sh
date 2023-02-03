#!/bin/bash
for f in $(ls -A | grep "^\.")
do
  if [ $f == ".git" ]; then
    continue
  fi
  ln -sf $PWD/$f ~/$f
done
