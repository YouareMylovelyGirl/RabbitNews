//
//  NetManager.h
//  TRProject
//
//  Created by 阳光 on 2017/1/13.
//  Copyright © 2017年 Tedu. All rights reserved.
//

#import "BaseNetManager.h"
#import "RabbitItem.h"
@interface NetManager : BaseNetManager
+ (id)GETRabbitItemWithChildpath:(NSString *)childPath startnumber:(NSString *)startNumber completionHandler:(void(^)(RabbitItem *rabbitPlay, NSError *error))completionHandler;
@end
