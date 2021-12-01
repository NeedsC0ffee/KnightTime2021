# Knight Time 2021
## Documentation Incomplete/Work In Progress

Knight Time is an application that tracks the time till the next class period and allows users to customizes certain aspects of their schedule

### SettingsVC.swift ###
This is the view controller for the ***Settings View Page***. The main purpose of this page is to change the names of the classes/periods. There are 8 TextFields
and 8 labels showing the length of the string inside. There is a **13 Character Limit** on all TextFields. There is a Switch to change from dark mode to light mode. 

#### Custom Class Names
How It Works:
1. Checks if LaunchedBefore
* If **TRUE** then pass
* If **FALSE** then set all defaults to Period 1 - Period 7
* This is needed so that it does not return nil on first boot and crash
2. Saves TextField Changes to defaults 

**For Future Head Dev**
UserDefaults are bound to a string
Saved even after closing of app. 

* maxText()
  * Displays Alert if the length of the String in the TextField is greater than 13
* checkMax()
  * Checks if length of each String in TextFields is greater than 13 then clears the field if it is. 
* checkCount()
  * Changes corresponding labels to display length of the String in each TextField. 
* fixColor()
  * Fixes color when changeing from light to dark mode and vise versa
* updateF1() - updateF7()
  * **All update func works the same**
  * updates user defaults if different than String in TextField


### NormalVC.swift ###
This is the view controller for the ***Initial View Page***. This view contains several vertical and horizontal stacks. These stacks contain labels that display
the full schedule for the day. There is a button connected to a segue that takes you to the ***Settings View Page***. This page should display the full schedule
monday through friday, the current class, the next class, and the time till the next class. 

* isAppAlreadyLaunchedOnce() -> Bool
  * Must Return Bool
  * Asks if app has launched before
  * Sends bool to a UserDefaults database
* goToSettings()
  * Opens Settings Storyboard
  * _Segue_
* checkday()
  * Checks Current Day of the Week
  * Hides/Shows Labels to format schedule for the day
* convertTimeShort1(_ time: Int) -> String
  * Converts Int to Hour:Minute format
  * Int is Hours & Minutes
* convertTimeShort(_ time: Int) -> String
  * Converts Int to Hour:Minute format
* convertTime(_ time: Int) -> String
  * Converts Int to Hour:Minute:Second


### Background.swift ###


### calendarBackground.swift ###


