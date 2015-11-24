//
//  ViewController.m
//  TabBarTest
//
//  Created by Jay Versluis on 24/11/2015.
//  Copyright © 2015 Pinkstone Pictures LLC. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addButtonPressed:(id)sender {
    
    // add another tab
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *redController = [storyboard instantiateViewControllerWithIdentifier:@"Red"];
    UIViewController *greenController = [storyboard instantiateViewControllerWithIdentifier:@"Green"];
    UIViewController *blueController = [storyboard instantiateViewControllerWithIdentifier:@"Blue"];
    
    redController.tabBarItem.title = @"Red";
    greenController.tabBarItem.title = @"Green";
    blueController.tabBarItem.title = @"Blue";
    
    // grab a reference to the current Tab Bar Controller
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    UITabBarController *rootTab = (UITabBarController *)appDelegate.window.rootViewController;
    
    NSArray *controllers = @[self, redController, greenController, blueController];
    [rootTab setViewControllers:controllers animated:YES];
    // rootTab.selectedIndex = 1;
    
    NSLog(@"Root Tab has %lu view controllers now.", rootTab.viewControllers.count);
    
}


- (IBAction)removeButtonPressed:(id)sender {
    
    // remove the last tab if there's more than one
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    UITabBarController *rootTab = (UITabBarController *)appDelegate.window.rootViewController;
    
    if (rootTab.viewControllers.count > 1) {
        NSMutableArray *controllers = [rootTab.viewControllers mutableCopy];
        [controllers removeLastObject];
        NSArray *newControllers = [NSArray arrayWithArray:controllers];
        
        [rootTab setViewControllers:newControllers animated:YES];
        
        NSLog(@"Root Tab has %lu view controllers now.", rootTab.viewControllers.count);

    }
}

@end
