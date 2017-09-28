//
//  CBArchiver.h
//  CBYYModelArchiverDemo
//
//  Created by mac on 2017/9/27.
//  Copyright © 2017年 Universal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+YYModel.h"

@interface NSArray (YYModelArchiver)

- (NSMutableArray *)convertToModelClass:(Class)aClass;

@end

@interface CBArchiver : NSObject

+ (CBArchiver *)shared;
- (BOOL)writeObj:(id)obj withFileName:(NSString *)name;
- (id)readFromFileName:(NSString *)name;
- (BOOL)deleteFromFileName:(NSString *)name;
@end
