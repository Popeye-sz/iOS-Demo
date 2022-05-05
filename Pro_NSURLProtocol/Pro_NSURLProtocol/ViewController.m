//
//  ViewController.m
//  Pro_NSURLProtocol
//
//  Created by 申政 on 2022/4/28.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()
@property (nonatomic, strong) WKWebView *webview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webview = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [self.webview setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.view addSubview:self.webview];
    
//  Test
//    NSURL *url = [NSURL URLWithString:@"http://raywenderlich.com"];
//    [self.webview loadRequest:[NSURLRequest requestWithURL:url]];
    
    NSString *localHtmlFilePath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    if ([localHtmlFilePath length]) {
        NSURL *url = [NSURL fileURLWithPath:localHtmlFilePath];
        [self.webview loadFileURL:url allowingReadAccessToURL:[url URLByDeletingLastPathComponent]];
    } else {
        NSLog(@"Local file path not exist!");
    }
}

@end
