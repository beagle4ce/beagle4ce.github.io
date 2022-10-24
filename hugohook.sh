#!/bin/sh
echo 'Start hugo hook'

hugo -D

echo '\n\n'

cp -R public/* docs/

git add .

git commit -am "Upload new posts or updated to github."

echo '\n\n'

git push origin main

echo 'Finished'