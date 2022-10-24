#!/bin/sh
echo 'Start hugo hook'

hugo -D

cp -R public/* docs/

git add .

git commit -am "Upload new posts or updated to github."

git push origin main

echo 'Finished'