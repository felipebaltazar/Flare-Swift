# Flare
<img align="right" src="https://cdn.2dimensions.com/flare_macbook.png" height="250">

[Flare](https://www.2dimensions.com/about-flare) is a powerful design and animation tool for app and game designers alike. The primary goal of Flare is to allow designers to work directly with assets that run in their final product, eliminating the need to redo that work in code.

# Flare-Swift

Swift runtime for Flare: export files from Flare and run them on iOS!

__Only Binary__ format is supported right now, but JSON support is in the works.

## Problems

If you encounter any problems [report them in the issue tracker](https://github.com/2d-inc/Flare-Swift/issues) and, if applicable, include your Flare file.

## Contents

The repository contains an XCode Project structured as follows:
- [FlareSwift](FlareSwift.xcodeproj) - Swift Framework for loading and drawing Flare files
    - [FlareCore](FlareCore) is the bottommost layer of the Framework: this is where Flare file contents are read, loaded and built in-memory
    - [FlareSkia](FlareSkia) handles the drawing operations in an OpenGL context. It relies on `libskia`, which is built with a custom script (see [Usage](#Usage))

This project contains multiple targets:
- `FlareSwift` - builds the Framework that runs on physical devices.
- `FlareSwiftDev` - builds the Framework that runs on Simulators.
- [Example](Example) - A simple example demonstrating how to add a [FlareSkViewController](FlareSkia/FlareSkViewController.swift) in a Single View App [ViewController](Example/ViewController.swift). It draws inside the [FlareSkView](FlareSkia/FlareSkView.swift) associated with the `FlareSkViewController`.
- [ExampleController](ExampleController) - Demonstrates how to create a [CustomController](ExampleController/CustomController.swift) that is an extension of [FlareSkViewController](FlareSkia/FlareSkViewController.swift). This class takes advantage of the available APIs by overriding `advanceControls()`, using a custom callback for swapping animations on completed (i.e. `onCompleted()`), and adding a `play()` function that plays a new animation allowing the user to specify the interpolation mix and time.

## Using the Framework

- Clone the repository:
```
git clone git@github.com:2d-inc/Flare-Swift.git
```
- Open `FlareSwift.xcodeproj`
- In the XCode window, select the scheme for the device you want to run on:
    - Use **`FlareSwift`** to build the Framework for a **physical device**
    - Use **`FlareSwiftDev`** to build the Framework for a **Simulator**

*N.B: first time building the Framework takes a while, as it is initializing and building all the dependencies. Use the Report Navigator to have an overview of what's happening.*

- Build the Framework (⌘ + B)

The Framework can be found in the `Products` folder. <br/>
Access the `Products` folder from XCode by right clicking on it > `Show in Finder`.

### In Your Project:
- Drag-and-drop the `.framework` file into the XCode window.
    - In the import dialog, select __"Copy items if needed"__ and the target in __"Add to Targets"__
- Add the Framework to the Build Phases: 
    - Select the Project in the Project Navigator 
    - Select your Target
    - __Build Phases__ 
    - Add the Framework to the __Embed Frameworks__ phase.

### Running the Examples

The examples are configured to be run on a **Simulator**. 

If you want to run them on a physical device, follow these steps:
- Select the example project in the Project Navigator
- Select the project target from the target list
- Under the `Framework, Libraries and Embedded Content` menu:
    - Select `FlareSwiftDev.framework` and press the minus (`-`) button to remove it
    - Use the plus (`+`) button to add `FlareSwift.framework`
- Run the example
*N.B. if the Framework needs to run a clean build for the device, this process might take a while. Use the Report Navigator to look at what's happening.*

## License
See the [LICENSE](LICENSE) file for license rights and limitations (MIT).

The [`Bezier`](Bezier) folder is a port of [bezier.dart](https://github.com/aab29/bezier.dart), and is complying with their [LICENSE.txt](Bezier/LICENSE.txt) (BSD 2-Clause License).
