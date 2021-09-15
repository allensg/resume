#!/bin/bash
attempts=0
output=""
until [[ $attempts -eq 5 || $output == *"Output written on /tmp/test.pdf"* ]]; do
	output=$(pdflatex -jobname=test -output-directory=/tmp src/resume.tex)
	echo "retrying..."
	attempts=$((attempts+1))
	echo $attempts
done
if [[ $attempts -eq 5 ]]; then
	echo "hit max retry. Got output:"
	echo "$output"
	exit 1
fi
cp /tmp/test.pdf /app/resume.pdf
echo "Finished"
