#!/bin/bash
zathura resume.pdf &
git ls-files | grep -Ev "^\." | entr -cr /bin/bash -c  "docker run -v $(pwd):/app $(docker build -q .) "
