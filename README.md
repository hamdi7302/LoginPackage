# Movie Login Package

A SwiftUI package that provides a login screen with a half-sheet modal and an animated movie picture gallery that auto-scrolls from bottom to top.

## Features

- SwiftUI-based login screen with a half-sheet presentation.
- Auto-scrolling movie gallery with smooth animations.
  
## Installation

### Swift Package Manager (SPM)

1. In Xcode, select **File > Add Packages**.
2. Enter the repository URL:
    ```bash
    git@github.com:hamdi7302/LoginPackage.git
    ```
3. Choose the appropriate version and add the package to your project.

## Usage

1. Import the package in your SwiftUI view:
    ```swift
    import LoginPackage
    ```

2. Use the `LoginUIView()` in your SwiftUI view to display the login screen:
    ```swift
    struct ContentView: View {
        var body: some View {
            LoginUIView()
        }
    }
    ```

This will display the login interface along with the animated movie gallery in your SwiftUI app.
