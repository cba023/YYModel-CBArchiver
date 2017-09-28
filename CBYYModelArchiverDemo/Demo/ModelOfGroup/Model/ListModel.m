//
//  ListModel.m
//  CBYYModelArchiverDemo
//
//  Created by mac on 2017/9/27.
//  Copyright © 2017年 Universal. All rights reserved.
//

#import "ListModel.h"

@implementation ListModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"list":[List class],
             @"extends":[Extends class]
             };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end

@implementation Courier

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"_id":@"id"};
}

@end
@implementation Start

@end
@implementation Consignee

@end
@implementation Shipper

@end
@implementation Order

@end
@implementation List

//+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
//    return @{
//             @"order":[Order class],
//             @"start":[Start class],
//             @"courier":[Courier class],
//             @"consignee":[Consignee class],
//             @"shipper":[Shipper class]
//             };
//}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"_id":@"id"};
}

@end


@implementation Extends

@end



