//
//  CBBaseModel.h
//  CBYYModelArchiverDemo
//
//  Created by mac on 2017/9/27.
//  Copyright © 2017年 Universal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"

@interface CBBaseModel : NSObject<NSCopying, NSCoding>

- (void)encodeWithCoder:(NSCoder*)aCoder;
- (id)initWithCoder:(NSCoder*)aDecoder;
- (id)copyWithZone:(NSZone*)zone;
- (NSUInteger)hash;
- (BOOL)isEqual:(id)object;
- (NSString *)description;

@end
