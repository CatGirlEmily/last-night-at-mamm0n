#!/bin/bash

read -p "desc: " msg
git add .
git commit -m "$msg"
git push -u origin main
