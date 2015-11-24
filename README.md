# Tab Bar Demo
iOS 9 Project demonstrating how to add view controllers to a UITabBar at runtime.

The trick is to grab a reference to the current view controller rather than instantiating a new one from the storyboard. 

Once that's done, create a new array of view controllers and add it to the tab bar controller via setViewcontrollers:animated.
