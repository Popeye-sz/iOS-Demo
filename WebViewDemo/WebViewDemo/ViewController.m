//
//  ViewController.m
//  WebViewDemo
//
//  Created by 申政 on 2022/5/12.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()<WKNavigationDelegate, WKUIDelegate>
@property (nonatomic, strong)WKWebView *webView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *refreshBtn;
@property (weak, nonatomic) IBOutlet UIButton *forwardBtn;
@property (nonatomic, strong) UIProgressView *progressView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:({
        NSString *urlString = @"https://www.xvideos.com/";
        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 80)];
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
        self.webView.UIDelegate = self;
        self.webView.navigationDelegate = self;
        self.webView;
    })];
    
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
        self.progressView;
    })];
    [self.webView addObserver:self
                   forKeyPath:@"estimatedProgress"
                      options:NSKeyValueObservingOptionNew
                      context:nil];
}

- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

#pragma mark -- WKNavigationDelegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSLog(@"decidePolicyForNavigationAction");
    decisionHandler(WKNavigationActionPolicyAllow);
    [self.view addSubview:self.progressView];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self.progressView removeFromSuperview];
    NSLog(@"didFinishNavigation");
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"%@", error);
}

#pragma mark -- Action

- (IBAction)goBack:(id)sender {
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }
}
- (IBAction)refresh:(id)sender {
    [self.webView reload];
}
- (IBAction)forward:(id)sender {
    if ([self.webView canGoForward]) {
        [self.webView goForward];
    }
}

#pragma mark -- KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progressView.progress = self.webView.estimatedProgress;
    }
}

@end
