RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
echo "${RED}******DEPLOY HUGO******${NC}"
echo "enter your commit message"
read commit
echo "${RED}you have entered $commit ${NC}"
hugo
cd public
git admit $commit
git push -f
cd ../
git admit $commit
git push -f
echo "${RED}******DEPLOYED******${NC}"
printf "I ${RED}love${NC} Stack Overflow\n"
hugo server --disableFastRender
#  | read message
# echo "${BLUE}$message"