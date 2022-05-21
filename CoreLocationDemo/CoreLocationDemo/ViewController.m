//
//  ViewController.m
//  CoreLocationDemo
//
//  Created by 申政 on 2022/5/21.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *manager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.manager = [[CLLocationManager alloc] init];
    self.manager.delegate = self;
    
    BOOL enabled = [self.manager locationServicesEnabled];
    if (!enabled) {
        //跳转设置
        
    }
    
    CLAuthorizationStatus status = [self.manager authorizationStatus];
    if (status < 3) {
        [self.manager requestWhenInUseAuthorization];
    }
}

#pragma mark - CLLocationManagerDelegate
// 当授权状态发生变化之后，如果是允许，则获取一把地理位置
- (void)locationManagerDidChangeAuthorization:(CLLocationManager *)manager {
    CLAuthorizationStatus status = [manager authorizationStatus];
    NSLog(@"%d", status);
    if ( status >= 3) {
        CLLocation *location = [manager location];
        NSLog(@"lcoation : %@", location);
    }
}

@end
