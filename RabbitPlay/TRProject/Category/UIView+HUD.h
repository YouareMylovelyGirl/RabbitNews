//
//  UIView+HUD.h
//  TRProject
//
//  Created by 阳光 on 2017/1/12.
//  Copyright © 2017年 Tedu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>
@interface UIView (HUD)
- (void)showHUD;
- (void)hideHUD;
- (void)showMessage:(NSString *)message;
@end
