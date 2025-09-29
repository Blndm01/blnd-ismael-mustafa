$ErrorActionPreference = "Stop"

# build with pnpm
pnpm docs:build

# commit main changes (ignore error if nothing new)
git add .
git commit -m "update source" 2>$null
git push origin main

# deploy build to gh-pages
git branch -D gh-pages 2>$null
git checkout --orphan gh-pages
git --work-tree docs/.vuepress/dist add --all
git --work-tree docs/.vuepress/dist commit -m "deploy"
git push origin HEAD:gh-pages --force
git checkout main
