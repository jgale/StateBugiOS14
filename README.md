# Bug Description

I have a `List` of `GroupedListStyle()` with 2 `Section`s.

When I tap on one of the items in the `Section`, it sets an optional ListItem var `shownItem` to the item that was tapped. It also sets a `showSheet` @State var to display the sheet.

```swift
    @State var showSheet = false
    @State var shownItem: ListItem?
```

However, in the `.sheet()` modifier, the shownItem has somehow been re-initialized and become nil. This should not happen.

I say "reinitialized" because I've also tried it by storing a non-optional UUID as a @State var, i.e. `@State var shownItemUUID = UUID()` In that case, the var also got reinitialized to a new UUID in the `.sheet()` modifier.

## Steps to reproduce

Version 12.0 beta (12A6159).
iPhone 11 Pro Simulator (iOS 13.5 and iOS 14)

1. Run the app
2. Tap on the Item A text

iOS 13: 
 * Shows a sheet with "Item A" (correct)

iOS 14:
 * Shows a sheet with a red color view (incorrect)

I believe this is a regression on iOS 14. 

I've filed a Feedback with Apple: FB7776085.


