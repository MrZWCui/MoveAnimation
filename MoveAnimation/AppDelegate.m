//
//  AppDelegate.m
//  MoveAnimation
//
//  Created by 崔先生的MacBook Pro on 2023/2/3.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    ViewController *vc = [ViewController new];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
