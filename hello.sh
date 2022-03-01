RED="\e[31m"
BLUE="\e[34m"
NC="\e[0m" # No Color
clear
echo -e "${RED}******DEPLOY HUGO******${NC}"
IFS= read -r -p "Enter your commit message: " commitMessage
echo "${RED} DELETING PUBLIC FOLDER"
rm -rf public/
echo -e "${RED} REBUILDING PUBLIC FOLDER"
hugo
git add public 
git commit -m $commitMessage
echo -e "PUSHING SUBTREE BRANCH"
git push origin `git subtree split --prefix public master`:gh-pages --force
echo -e "PUSHING TO MASTER"
git add .
git commit -m $commitMessage
git push origin master
echo -e "${RED}pushed commit $commitMessage ${NC}"
echo -e "${RED}******DEPLOYED******${NC}"
printf "I ${RED}love${NC} Stack Overflow\n"
hugo server --disableFastRender