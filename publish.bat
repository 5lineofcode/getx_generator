version=pubver get

cmd /c pubver bump patch
git add .
git commit -m "Set version to $version"
git push --force
flutter pub publish /y