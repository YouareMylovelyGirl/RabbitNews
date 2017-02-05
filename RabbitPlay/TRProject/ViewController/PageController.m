//
//  PageController.m
//  TRProject
//
//  Created by 阳光 on 2017/1/13.
//  Copyright © 2017年 Tedu. All rights reserved.
//

#import "PageController.h"
#import "ViewController.h"
@interface PageController ()
@property (nonatomic, strong) PageController *vc;
@end

@implementation PageController

- (NSArray<NSString *> *)titles
{
    return @[
             @"头条",
             @"独家",
             @"暗黑3",
             @"魔兽",
             @"风暴",
             @"炉石",
             @"星际2",
             @"守望",
             @"图片",
             @"视频",
             @"攻略",
             @"幻化",
             @"趣闻",
             @"COS",
             @"美女"
             ];
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController
{
    return self.titles.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index
{
    ViewController *vc = [[ViewController alloc]initWithIndex:index];
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)init
{
    if (self = [super init]) {
        self.vc.showOnNavigationBar = YES;
        self.vc.menuBGColor = [UIColor orangeColor];
        self.vc.menuViewStyle = WMMenuViewStyleLine;
    }
    return self;
}

@end
