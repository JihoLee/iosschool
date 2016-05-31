//
//  AppDelegate.m
//  UINavigationExam
//
//  Created by LEEJIHO on 2016. 5. 31..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "AppDelegate.h"
#import "SecondViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // Full Code
//    SecondViewController *secondVC = [[SecondViewController alloc] initWithNibName:@"SecondViewController.xib" bundle:nil];
    
    // 클래스 이름과 xib이름이 같으면 Nib이하의 코드는 삭제해도 무방
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    
    // 네비게이션 컨트롤러 생성 - 꼭 init과 동시에 RootViewController를 설정해줘야 함
    UINavigationController *navigationC = [[UINavigationController alloc] initWithRootViewController:secondVC];
    
    // window객체의 rootView를 설정
    self.window.rootViewController = navigationC;
    
    // window객체의 화면을 업데이트
    [self.window makeKeyAndVisible];
     
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
