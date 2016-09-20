# Pre-work - *Tipssy*

**Tipssy** is a tip calculator application for iOS.

Submitted by: **Edmund Li**

Time spent: **4** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Slider to adjust percentage
- [x] User can also edit tip percentage by tapping the tip percentage label

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

![gif_walkthrough]

[gif_walkthrough]: tipssy.gif

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

- It was tricky to bind action to the back button. I ended up using viewWillDisappear life cycle method on the Settings View
- To make the slider user friendly, and make sure it keeps sliding and changing value real time requires both Touch Drag Inside and Touch Drag Outside

## License

    Copyright [2016] [Edmund Li]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
