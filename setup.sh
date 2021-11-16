#!/bin/bash
for f in $(ls -A | grep "^\.")
do
  ln -sf $PWD/$f ~/$f
done
