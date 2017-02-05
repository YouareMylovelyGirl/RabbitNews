//
//  DetailWebController.h
//  TRProject
//
//  Created by 阳光 on 2017/1/13.
//  Copyright © 2017年 Tedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailWebController : UIViewController
@property (nonatomic, strong) NSString *detailPath;
- (instancetype)initWithDetailPath:(NSString *)detailPath;
@end
