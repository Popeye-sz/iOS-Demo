//
//  SceneDelegate.m
//  TabbarDemo
//
//  Created by 申政 on 2022/5/7.
//

#import "SceneDelegate.h"
#import "ViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
//
//    UIViewController *vc1 = [[UIViewController alloc] init];
//    vc1.view.backgroundColor = [UIColor redColor];
//    vc1.tabBarItem.title = @"新闻";
//    vc1.tabBarItem.image = [UIImage imageNamed:@"news_light"];
//    vc1.tabBarItem.selectedImage = [UIImage imageNamed:@"news_fill"];
    ViewController *vc1 = [[ViewController alloc] init];

    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor greenColor];
    vc2.tabBarItem.title = @"视频";
    vc2.tabBarItem.image = [UIImage imageNamed:@"video_light"];
    vc2.tabBarItem.selectedImage = [UIImage imageNamed:@"video_fill"];

    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor blueColor];
    vc3.tabBarItem.title = @"推荐";

    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor = [UIColor yellowColor];
    vc4.tabBarItem.title = @"我的";

    [tabbarController setViewControllers:@[vc1, vc2, vc3, vc4]];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
