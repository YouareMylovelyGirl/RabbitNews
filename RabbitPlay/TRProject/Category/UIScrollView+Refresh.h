//
//  UIScrollView+Refresh.h
//  TRProject
//
//  Created by 阳光 on 2017/1/12.
//  Copyright © 2017年 Tedu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>
@interface UIScrollView (Refresh)
- (void)addHeaderRefresh:(void(^)())block;

- (void)addFooterRefresh:(void(^)())block;

- (void)beginHeaderRefresh;

- (void)endHeaderRefresh;

- (void)beginFooterRefresh;

- (void)endFooterRefresh;

- (void)endRefreshWithNoMoreData;

- (void)resetNoMoreData;
@end
