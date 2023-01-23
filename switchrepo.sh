 #! /bin/bash
# Colors : http://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html

BOLD="\u001b[1m"
UNDERLINE="\u001b[4m"
REVERSED="\u001b[7m"
BLACK="\u001b[30;1m"
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\u001b[33;1m"
BLUE="\u001b[34;1m"
WHITE="\u001b[37;1m"
RESET="\033[0m"

SR_HOME=~/source
odoo_repos=enterprise,odoo
for repo in ${odoo_repos//,/ }
do
  echo -e "${BOLD}${RED} ** $SR_HOME/$repo to $1    {checkout . / find-delete / clean -fd / pull /  / clean}  **  ${RESET}"
  cd $SR_HOME/$repo
  git checkout .
  find . -name *.pyc -delete
  git clean -fd
  git pull
  git checkout origin/$1
done
# echo -e "${BOLD}${RED} ** changing conda environment $1 ** ${RESET}"
# conda activate $1
