start "pubver bump patch"
git add .
git commit -m "."
git push --force
flutter pub publish