//
//  ScreenShotView.h
//  ScreenShotTest
//
//  Created by orange on 2017/6/13.
//  Copyright © 2017年 orange. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScreenShotView : UIView
@property (nonatomic, strong)UIImage *image;
- (void)show;
- (void)disMiss;

@end