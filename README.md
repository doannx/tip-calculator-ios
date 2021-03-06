Pre-work - *Tip Calculator App*

**tippy** is a tip calculator application for iOS.

Submitted by: **Nguyen Xuan Doan**

Time spent: **10** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations.
* [x] Remembering the bill amount across app restarts (if <10mins).
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Friendly UI.
- [x] User can set the light/dark color theme in the settings view.
- [x] Display launch screen with appicon.
- [x] Adapt with different screen sizes (iPhone 4s-5-6).

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

![Video Walkthrough](tippy.gif)  
  
Displaying in different screen sizes

![Video Walkthrough](tippy_screensizes.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

The challenges encountered while building the app:  
1. Beginner in iOS programming as well as mobile development.  
2. Make friend with the most "stupid" IDE: Xcode, that says NO with refactor (for Swift)/format code/reference search...  
3. The layout is broken when rotating the phone (I found out that StackView & AutoLayout can apply for this kind of problem, tried but still not work as expected) :sweat:

## License

    Copyright [2017] [doannx]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
