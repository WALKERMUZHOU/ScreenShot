//
//  ScreenShotView.m
//  ScreenShotTest
//
//  Created by orange on 2017/6/13.
//  Copyright © 2017年 orange. All rights reserved.
//

#import "ScreenShotView.h"
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@implementation ScreenShotView{
    UIImageView *_imageView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = [UIScreen mainScreen].bounds;
        
        UIBlurEffect    *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView  *effectview = [[UIVisualEffectView alloc]initWithEffect:effect];
        effectview.frame = self.bounds;
        [self addSubview:effectview];
        
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 0,screenWidth-200, screenHeight*(screenWidth - 200)/screenWidth)];
        [self addSubview:_imageView];
        
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(screenTap:)];
        [self addGestureRecognizer:tapGes];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)setImage:(UIImage *)image{
    [_imageView setImage:image];
}

- (void)show{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
    [UIView animateWithDuration:0.5 animations:^{
        _imageView.center = CGPointMake(self.center.x, self.center.y);
    }];
}

- (void)screenTap:(UITapGestureRecognizer *)tap{
    [self disMiss];
}

- (void)disMiss{
    [self removeFromSuperview];
}

@end
