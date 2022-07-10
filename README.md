# cred_task

A fun task by CRED.

## Folder Structure

[]: # Architecture: MVVM

The folders were made with regards to having a scalable and maintainable architecture.

-android/ - Contains the Android project.
-assets/ - Contains the assets.
-fonts/ - Contains the fonts.
-ios/ - Contains the iOS project.
-lib/ - Contains the Flutter project.
-test/ - Contains the Dart tests.
-pubspec.yaml - Project's pubspec.yaml.
-README.md - Project's README.md.

lib is further divided into
-lib/generated/ - Contains the generated files.
-lib/modules/ - Contains the modules divided on the basis of pages.
-lib/styles/ - Contains the styling elements of the Project.

## Methodology

Used a stack to create the stackable card layout, and gave the 
cards 2 states, i.e expanded and suspended(will be collapsed by default).

The cards will be initiated with a initial value and can be changed on the go,
and the changes will be reflected in the UI.

## Tech Stack

- Riverpod for state management and dependency injection.
- MVVM for the Architecture.
- Freezed to generate states.