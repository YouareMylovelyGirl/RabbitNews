//
//  RabbitItem.h
//  TRProject
//
//  Created by 阳光 on 2017/1/13.
//  Copyright © 2017年 Tedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RabbitDataItem,RabbitDataIndexpicItem,RabbitDataIndexpicInfochildItem,RabbitDataIndexpicShowitemItem,RabbitDataIndexpicShowItemInfoItem,RabbitDataListItem,RabbitDataListInfochildItem,RabbitDataListInfochildShowitemItem,RabbitDataListInfochildShowitemInfoItem;
@interface RabbitItem : NSObject

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) RabbitDataItem *data;

@property (nonatomic, copy) NSString *code;

@end

@interface RabbitDataItem : NSObject

@property (nonatomic, strong) NSArray<RabbitDataIndexpicItem *> *indexpic;

@property (nonatomic, strong) NSArray<RabbitDataListItem *> *list;

@end

@interface RabbitDataIndexpicItem : NSObject

@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *showtype;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *click;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *typechild;

@property (nonatomic, copy) NSString *longtitle;
//typename -> tName
@property (nonatomic, copy) NSString *tName;

@property (nonatomic, copy) NSString *html5;

@property (nonatomic, copy) NSString *toutiao;

@property (nonatomic, strong) RabbitDataIndexpicInfochildItem *infochild;

@property (nonatomic, copy) NSString *litpic;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, assign) NSInteger pictotal;

@property (nonatomic, strong) NSArray<RabbitDataIndexpicShowitemItem *> *showitem;

@property (nonatomic, copy) NSString *pubdate;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *murl;

@property (nonatomic, copy) NSString *banner;

@property (nonatomic, copy) NSString *zangs;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *timer;

@property (nonatomic, copy) NSString *comment;
//description -> des
@property (nonatomic, copy) NSString *des;

@end

@interface RabbitDataIndexpicInfochildItem : NSObject

@property (nonatomic, copy) NSString *later;

@property (nonatomic, copy) NSString *cn;

@property (nonatomic, copy) NSString *facial;

@property (nonatomic, copy) NSString *feature;

@property (nonatomic, copy) NSString *role;

@property (nonatomic, copy) NSString *shoot;

@end

@interface RabbitDataIndexpicShowitemItem : NSObject

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, strong) RabbitDataIndexpicShowItemInfoItem *info;

@end

@interface RabbitDataIndexpicShowItemInfoItem : NSObject

@property (nonatomic, copy) NSString *width;

@property (nonatomic, assign) NSInteger height;

@end

@interface RabbitDataListItem : NSObject

@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *showtype;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *click;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *typechild;

@property (nonatomic, copy) NSString *longtitle;
// typename -> tName
@property (nonatomic, copy) NSString *tName;

@property (nonatomic, copy) NSString *html5;

@property (nonatomic, copy) NSString *toutiao;

@property (nonatomic, strong) RabbitDataListInfochildItem *infochild;

@property (nonatomic, copy) NSString *litpic;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, assign) NSInteger pictotal;

@property (nonatomic, strong) NSArray<RabbitDataListInfochildShowitemItem *> *showitem;

@property (nonatomic, copy) NSString *pubdate;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *murl;

@property (nonatomic, copy) NSString *banner;

@property (nonatomic, copy) NSString *zangs;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *timer;

@property (nonatomic, copy) NSString *comment;
//description -> des
@property (nonatomic, copy) NSString *des;

@end

@interface RabbitDataListInfochildItem : NSObject

@property (nonatomic, copy) NSString *later;

@property (nonatomic, copy) NSString *cn;

@property (nonatomic, copy) NSString *facial;

@property (nonatomic, copy) NSString *feature;

@property (nonatomic, copy) NSString *role;

@property (nonatomic, copy) NSString *shoot;

@end

@interface RabbitDataListInfochildShowitemItem : NSObject

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, strong) RabbitDataListInfochildShowitemInfoItem *info;

@end

@interface RabbitDataListInfochildShowitemInfoItem : NSObject

@property (nonatomic, copy) NSString *width;

@property (nonatomic, assign) NSInteger height;

@end

