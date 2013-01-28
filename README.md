# RECurtainViewController
###A custom curtain-style transition for UIViewControllers.

![Screenshot of RECurtainViewController](https://github.com/romaonthego/RECurtainViewController/raw/master/Screenshot.png "RECurtainViewController Screenshot")

## Requirements
* Xcode 4.3 or higher
* Apple LLVM compiler
* iOS 4 or higher
* ARC

If you are not using ARC in your project, add `-fobjc-arc` as a compiler flag for all the files in this project.

## Demo

Build and run the `RECurtainViewControllerExample` project in Xcode to see `RECurtainViewController` in action.

## Installation

### CocoaPods

The recommended approach for installating RECurtainViewController is via the [CocoaPods](http://cocoapods.org/) package manager, as it provides flexible dependency management and dead simple installation.

Install CocoaPods if not already available:

``` bash
$ [sudo] gem install cocoapods
$ pod setup
```

Edit your Podfile and add RECurtainViewController:

``` bash
$ edit Podfile
platform :ios, '5.0'
pod 'RECurtainViewController', '~> 1.0.1'
```

Install into your Xcode project:

``` bash
$ pod install
```

### Simple Install

`RECurtainViewController` requires the `QuartzCore` framework, so the first thing you'll need to do is include the framework into your project.

Now that the framework has been linked, all you need to do is drop `UIViewController+RECurtainViewController.{h,m}` into your project, and add `#include "UIViewController+RECurtainViewController.h"` to the top of classes that will use it.

## Example Usage

``` objective-c
DemoViewController *test = [[DemoViewController alloc] init];
[self curtainRevealViewController:test
                  transitionStyle:RECurtainTransitionHorizontal];
```

## Contact

Roman Efimov

- http://github.com/romaonthego
- http://twitter.com/romaonthego

## License

RECurtainViewController is available under the MIT license.

Copyright © 2012 Roman Efimov.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
