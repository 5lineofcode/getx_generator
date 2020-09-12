call pubver bump patch
call git add .
call git commit -m "."
call git push --force
call flutter pub publish