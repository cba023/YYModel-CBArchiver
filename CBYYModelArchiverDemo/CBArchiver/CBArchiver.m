//
//  CBArchiver.m
//  CBYYModelArchiverDemo
//
//  Created by mac on 2017/9/27.
//  Copyright © 2017年 Universal. All rights reserved.
//

#import "CBArchiver.h"

@implementation CBArchiver

+ (CBArchiver *)shared {
    static CBArchiver *defaultManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultManager = [[CBArchiver alloc] init];
    });
    return defaultManager;
}

/// Get data's name
- (NSString *)getPathWithFileName:(NSString *)name {
    NSString * pathsToDocuments = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString * dataPath = [NSString stringWithFormat:@"%@/%@.bin",pathsToDocuments,name];
    return dataPath;
}

// Write data to file
- (BOOL)writeObj:(id)obj withFileName:(NSString *)name {
    NSString * p = [self getPathWithFileName:name];
    BOOL flag = [NSKeyedArchiver archiveRootObject:obj toFile:p];
    return flag;
}

// Read data from file
- (id)readFromFileName:(NSString *)name {
    NSString * p = [self getPathWithFileName:name];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:p];
}

// Delete file by input name
- (BOOL)deleteFromFileName:(NSString *)name {
    NSString * p = [self getPathWithFileName:name];
    NSFileManager * fManager = NSFileManager.defaultManager;
    BOOL isExist = [fManager fileExistsAtPath:p];
    if (isExist == NO) {
        return NO;
    }
    BOOL flag = [fManager isDeletableFileAtPath:p];
    NSError *error;
    @try {
        [fManager removeItemAtPath:p error:&error];
    } @catch (NSException *exception) {
        return NO;
    } @finally {
        return flag;
    }
}

@end

@implementation NSArray (YYModelArchiver)

- (NSMutableArray *)convertToModelClass:(Class)aClass {
    NSMutableArray * list = [NSMutableArray array];
    for(id obj in self) {
        id model = [aClass yy_modelWithDictionary:obj];
        [list addObject:model];
    }
    return list;
}

@end


