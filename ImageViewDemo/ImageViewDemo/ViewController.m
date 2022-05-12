//
//  ViewController.m
//  ImageViewDemo
//
//  Created by 申政 on 2022/5/12.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 200, 200)];
    [self.view addSubview:imageView];
    UIImage *image1 = [UIImage imageNamed:@"pic1.png"];
    UIImage *image2 = [UIImage imageNamed:@"pic2.png"];
    UIImage *image3 = [UIImage imageNamed:@"pic3.png"];
    UIImage *image4 = [UIImage imageNamed:@"pic4.png"];
    imageView.animationImages = @[image1, image2, image3, image4];
    imageView.animationDuration = 1;
    [imageView startAnimating];
}


@end
