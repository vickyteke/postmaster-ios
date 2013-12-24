# Postmaster

Developer Friendly Shipping

Postmaster takes the pain out of sending shipments via UPS, Fedex, and USPS.

Save money before you ship, while you ship, and after you ship.

https://www.postmaster.io/


## Installation

1. Clone this repository (git clone --recursive)
1. Drag postmaster library xcode project file to your project in project navigator
1. In your project target, go to "Build Phases" tab
1. Open "Link Binary With Libraries" click "+" icon and select "libPostmasteriOS.a"
1. Open "Target Dependencies", click "+" icon and add PostmasteriOS library (with library icon)
1. Go to "Build Settings" tab and find "User Headers Search Paths". Add path to directory where your copy of library is located. In sample project "../../postmaster" is used.

### Source

Download the postmaster-ios source:

    $ git clone https://github.com/postmaster/postmaster-ios

## Quickstart

    Sample project is available (iOSPostmasterSimpleClient). This is example of how to configure library and its dependencies, how to use it in code for simple iOS application. 

 
## Usage

See https://www.postmaster.io/docs for tutorials and documentation.



