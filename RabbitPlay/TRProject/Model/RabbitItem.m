//
//  RabbitItem.m
//  TRProject
//
//  Created by 阳光 on 2017/1/13.
//  Copyright © 2017年 Tedu. All rights reserved.
//

#import "RabbitItem.h"

@implementation RabbitItem

@end


@implementation RabbitDataItem
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{
             @"indexpic":@"RabbitDataIndexpicItem",
             @"list":@"RabbitDataListItem"
             };
}
@end


@implementation RabbitDataIndexpicItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"tName":@"typename",
             @"des":@"description"
             };
}

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{
             @"showitem":@"RabbitDataIndexpicShowitemItem"
             };
}
@end


@implementation RabbitDataIndexpicInfochildItem

@end


@implementation RabbitDataIndexpicShowitemItem

@end


@implementation RabbitDataIndexpicShowItemInfoItem

@end


@implementation RabbitDataListItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"tName":@"typename",
             @"des":@"description"
             };
}

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{
             @"showitem":@"RabbitDataListInfochildShowitemItem"
             };
}
@end


@implementation RabbitDataListInfochildItem

@end


@implementation RabbitDataListInfochildShowitemItem

@end


@implementation RabbitDataListInfochildShowitemInfoItem

@end


