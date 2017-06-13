//
//  ViewController.m
//  ScreenShotTest
//
//  Created by orange on 2017/6/13.
//  Copyright © 2017年 orange. All rights reserved.
//

#import "ViewController.h"
#import "ScreenShotView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *imageView= [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"imgOne"];
    [self.view addSubview:imageView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(screenShot:) name:UIApplicationUserDidTakeScreenshotNotification object:nil];
}

- (void)screenShot:(NSNotification *)notification{
    ScreenShotView *screenShot = [[ScreenShotView alloc]init];
    screenShot.image = [self cutFromImage:self.view];
    [screenShot show];
}

- (UIImage *)cutFromImage:(UIView *)view{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
