//
//  BaseNetManager.m
//  TRProject
//
//  Created by 阳光 on 2017/1/13.
//  Copyright © 2017年 Tedu. All rights reserved.
//

#import "BaseNetManager.h"

@implementation BaseNetManager
+ (id)GET:(NSString *)path param:(NSDictionary *)param completionHandler:(void (^)(id, NSError *))completionHandler
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 10;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    return [manager GET:path parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        !completionHandler ?: completionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !completionHandler ?: completionHandler(nil, error);
        NSLog(@"----------------%@", error);
    }];
}
@end