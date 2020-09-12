cmd /c pubver bump patch
git add .
git commit -m "Set new version"
git push --force
flutter pub publish /y