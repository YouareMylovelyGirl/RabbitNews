//
//  NetManager.m
//  TRProject
//
//  Created by 阳光 on 2017/1/13.
//  Copyright © 2017年 Tedu. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager
+ (id)GETRabbitItemWithChildpath:(NSString *)childPath startnumber:(NSString *)startNumber completionHandler:(void (^)(RabbitItem *, NSError *))completionHandler
{
    NSString *mainPath = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?%@%@",childPath, startNumber];
    mainPath = [mainPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [self GET:mainPath param:nil completionHandler:^(id obj, NSError *error) {
        !completionHandler ?: completionHandler([RabbitItem parse:obj], error);
    }];
}
@end
