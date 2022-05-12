//
//  ViewController.m
//  TabbarDemo
//
//  Created by 申政 on 2022/5/7.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *myView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.myView = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 100, 100)];
    self.myView.backgroundColor = [UIColor systemPinkColor];
    [self.view addSubview:self.myView];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(tapAction:)];
    [_myView addGestureRecognizer:tapGesture];
    
    
}

- (void)tapAction:(id)sender {
    UIViewController *newVC = [[UIViewController alloc] init];
    newVC.view.backgroundColor = [UIColor orangeColor];
    [self.navigationController pushViewController:newVC animated:YES];
}

@end
