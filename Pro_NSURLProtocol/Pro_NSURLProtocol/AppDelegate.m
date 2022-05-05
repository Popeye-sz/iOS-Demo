//
//  AppDelegate.m
//  Pro_NSURLProtocol
//
//  Created by 申政 on 2022/4/28.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "CustomURLProtocol.h"
#import "NSURLProtocol+WebKitSupport.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    ViewController *vc = [[ViewController alloc] init];
    _window.contentViewController = vc;
    [vc.view setAutoresizingMask:NSViewHeightSizable | NSViewWidthSizable];
    
    [NSURLProtocol wk_registerScheme:@"myapp"];

    [NSURLProtocol registerClass:[CustomURLProtocol class]];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
