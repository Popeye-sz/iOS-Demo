//
//  ViewController.m
//  ScrollViewDemo
//
//  Created by 申政 on 2022/5/11.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(width * 4, height);
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    scrollView.delegate = self;
    
    NSArray *colorArray = @[[UIColor redColor], [UIColor greenColor], [UIColor yellowColor], [UIColor blueColor]];
    for (int i = 0; i < 4; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(width * i, 0, width, height)];
        view.backgroundColor = (UIColor *)colorArray[i];
        [scrollView addSubview:view];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%@", [NSString stringWithFormat:@"scrollViewDidScroll, %f", scrollView.contentOffset.x]);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"scrollViewWillBeginDragging");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidEndDragging");
}

@end
