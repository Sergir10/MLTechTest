#!/bin/sh
find . -name "*.xcodeproj" | while read project; do pod deintegrate ${project}; done;