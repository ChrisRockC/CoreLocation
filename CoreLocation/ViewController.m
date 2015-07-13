//
//  ViewController.m
//  CoreLocation
//
//  Created by mac on 15/7/13.
//  Copyright (c) 2015年 CC. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()<CLLocationManagerDelegate>
@property (nonatomic,strong) CLLocationManager *locMgr;

@end


@implementation ViewController

-(CLLocationManager *)locMgr{
    if (_locMgr == nil) {
        //1.创建定位管理者
        CLLocationManager *locMgr = [[CLLocationManager alloc] init];
        
        //2.设置代理
        locMgr.delegate = self;

    }
    return _locMgr;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //3.开始定位用户的位置
    [self.locMgr startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate代理方法

//只要定位到用户的位置，就会调用,调用的频率是特别的高
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"didUpdateLocations----");
    
    //1.locations 是数组的原因是：定位所在的区域包含两个地方，一般是取第一个精确度比较高。
    //CLLocation *loc = [locations firstObject];
    
    //2. 取出经纬度
//    CLLocationCoordinate2D coordinate = loc.coordinate;
    
    
    //停止定位（省电模式：定位一次之后立即关闭）
    [manager stopUpdatingLocation];
}

@end
