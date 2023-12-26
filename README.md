# 100DaysOfCode Challenge

This is my first #100DaysOfCode challenge. I have been challenging myself to code for at least an hour a day for 100 consecutive days from November 22, 2023. This repository is created on its 31st day. I am joining the challenge with Swift and iOS App development. I am following the course [iOS & Swift - The Complete iOS App Development Bootcamp](https://www.udemy.com/course/ios-13-app-development-bootcamp/) by Angela Yu at The App Brewery which is the best iOS course ever! Let's get coding!


### Contents
* [Rules](https://github.com/SoyeongKimm/100DaysOfCode?tab=readme-ov-file#rules)
* [Study Plan & Do](https://github.com/SoyeongKimm/100DaysOfCode?tab=readme-ov-file#study-plan--do)
* [Challenge Calendar](https://github.com/SoyeongKimm/100DaysOfCode?tab=readme-ov-file#challenge-calendar)
* [Daily Log](https://github.com/SoyeongKimm/100DaysOfCode?tab=readme-ov-file#dayily-log)

---
<br>

## Rules
1. **Make a commitment to myself**: <br>
  I pledge to code for at least an hour a day for 100 days. I am committed to completing the course. I wll keep myself on track, even though some days I might feel tired and frustrated. I will keep myself accountable. I wll make this a priority during my day. I will overcome difficulties and achieve my goal. (Reference from [100 Days of Python](https://kmooc.udemy.com/course/100-days-of-code/))
2. **Log my progress every day**: <br>
  I will push commits to this repository daily. 

<br>

## Study Plan & Do
Link to [Course Study Plan-Do Sheets](https://docs.google.com/spreadsheets/d/1ZdgHI7o52geekRd0zQQbenZRAjpSLaNTBQVupDP0t88/edit#gid=89486382)

<br>

## Challenge Calendar
A click on any day leads me straight to its corresponding daily log.
<table>
<tr><th>100 Days Of Code</th><th>Monthly Calendar</th></tr>
<tr><td>

|Wk.|M|T|W|T|F|S|S|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|**#47**| | |1|2|3|4|5|
|**#48**|6|7|8|9|10|11|12|
|**#49**|13|14|15|16|17|18|19|
|**#50**|20|21|22|23|24|25|26|
|**#51**|27|28|29|30|[31](https://github.com/SoyeongKimm/100DaysOfCode?tab=readme-ov-file#day-31-dec-22-2023)|[32](https://github.com/SoyeongKimm/100DaysOfCode?tab=readme-ov-file#day-32-dec-23-2023)|[33](https://github.com/SoyeongKimm/100DaysOfCode?tab=readme-ov-file#day-33-dec-24-2023)|
|**#52**|[34](https://github.com/SoyeongKimm/100DaysOfCode?tab=readme-ov-file#day-34-dec-25-2023)|35|36|37|38|39|40|
|**#01**|41|42|43|44|45|46|47|
|**#02**|48|49|50|51|52|53|54|
|**#03**|55|    56|    57|    58|    59|    60|    61|
|**#04**|62|    63|    64|    65|    66|    67|    68|
|**#05**|69|    70|    71|    72|    73|    74|    75|
|**#06**|76|    77|    78|    79|    80|    81|    82|
|**#07**|83|    84|    85|    86|    87|    88|    89|
|**#08**|90|    91|    92|    93|    94|    95|    96|
|**#09**|97|    98|    99|    100|  |  |  |

</td><td>

|Mo.|M|T|W|T|F|S|S|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|**Nov**| | |22|23|24|25|26|                
|   |27|28|29|30|1|2|3|
|**Dec**|4|5|6|7|8|9|10|
| |11|    12|    13|    14|    15|    16|    17|
| |18|    19|    20|    21|    22|    23|    24|
| |25|    26|    27|    28|    29|    30|    31|
|**Jan**|1|    2|    3|    4|    5|    6|    7|
| |8|    9|    10|    11|    12|    13|    14|
| |15|    16|    17|    18|    19|    20|    21|
| |22|    23|    24|    25|    26|    27|    28|
| |29|    30|    31|    1|    2|    3|    4|
|**Feb**|5|    6|    7|    8|    9|    10|    11|
| |12|    13|    14|    15|    16|    17|    18|
| |19|    20|    21|    22|    23|    24|    25|
| |26|    27|    28|    29|

</td></tr> </table>

<br>

## Daily Log 

### Day 34 (Dec 25, 2023) 

- Removed Realm from the project installed by using CocoaPods
- Installed [Realm](https://www.mongodb.com/docs/realm/sdk/swift/install/#installation) again by using Swift Package Manager

<br>

### Day 33 (Dec 24, 2023) 

**Implement the functionality of cell deletion by using a third party library** <br>
1. Go to [CocoaPods](https://cocoapods.org/) > Search "swipe" > Select "[SwipeCellKit](https://cocoapods.org/pods/SwipeCellKit)" <br>
or Go to [SwipeCellKit](https://github.com/SwipeCellKit/SwipeCellKit) on GitHub
2. [Install](https://github.com/SwipeCellKit/SwipeCellKit/blob/develop/README.md#installation)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; In Terminal,
  ```
  $ pod init
  $ open Podfile -a Xcode
  ```
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; In Podfile,
```
$ pod 'SwipeCellKit'
```
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Back in Terminal,
```
$ pod install
```
3. Add `import SwipeCellKit`
4. Set the `delegate` property on `SwipeTableViewCell`
   ```swift
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! SwipeTableViewCell
    cell.delegate = self
    return cell
   }
   ```
5. Adopt the `SwipeTableViewCellDelegate` protocol -> Create an extension to modularize and split up the functionality
   ```swift
   extension ViewController: SwipeTableViewCellDelegate {
   }
   ```
6. Add the delegate methods
   ```swift
   func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
    guard orientation == .right else { return nil }
     //orientation of the swipe is from the right

    let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
     // "title" means the text underneath the icon
     // inside this closure, handle action by updating model with deletion
    }

    deleteAction.image = UIImage(named: "delete")
     // customize the action appearance
   
    return [deleteAction]
   }
   ```
7. Find the image of "delete(trash)" and Drag it into my Assets.xcassets folder <br>
   SwipeCellKit > Example > MailExample > Assets.xcassets > Trash.imageset > [Trash Icon.png](https://github.com/SwipeCellKit/SwipeCellKit/blob/develop/Example/MailExample/Assets.xcassets/Trash.imageset/Trash%20Icon.png) <br>
   *Note: Rename the image with no space in-bewteen the two words. Place the image in 2x position*
8. Add action
   ```swift
   func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
    guard orientation == .right else { return nil }
   
    let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
     // handle action by updating model with deletion
     print("Deleted")
    }

    deleteAction.image = UIImage(named: "delete")
     // match the name with the image name

    return [deleteAction]
   }
   ```

<br>

### Day 32 (Dec 23, 2023) 

Swipeable `UITableViewCell` <br>
[SwipeCellKit](https://github.com/SwipeCellKit/SwipeCellKit)

Markdown Syntax <br>
[Basic writing and formatting syntax](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

<br>

### Day 31 (Dec 22, 2023) 

<br>

Framework 
- dynamic framework
- static framework 

How to install Realm using CocoaPods
1. `$ pod repo update`
2. `$ pod init`
3. `$ open Podfile -a Xcode`
4. In Podfile, make sure `use_frameworks!` is not commented out. And add `pod 'RealmSwift', '~>10'`
5. `$ pod install`

How to remove CocoaPods and all traces from project 
1. `$ pod deintegrate`
2. `$ pod cache clean --all`
3. Delete 1) Podfile, 2) Podfile.lock, 3) ProjectName.xcworkspace

Resources <br>
[MongoDB Documentation](https://www.mongodb.com/docs/realm/sdk/swift/install/#installation)

---



