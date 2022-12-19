git tag -a tlevels-resac-v1 -m "T Levels Results and Certification Pipeline"

git submodule add https://github.com/SkillsFundingAgency/tl-platform-building-blocks.git
#git config -f .gitmodules submodule.tl-platform-building-blocks.branch [branch]

git submodule update --remote

git clone --recurse-submodules https://github.com/AlanMullett/gitmoduleparent.git 

#to set the commit used in the submodule, all of these will resolve and record the commit used rather than keeping the source tag/branch
git checkout [commit|tag|branch]