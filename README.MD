![CBArchiverLogo](http://upload-images.jianshu.io/upload_images/2484280-6a7485126a4b6571.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


基于YYModel的轻量级高效归档缓存框架CBArchiver

## 开发环境

 Mac OS 10.12+ / Xcode 9+ / Objective-C
## 支持环境
iOS 8+, iPhone & iPad
## 项目获取
此处代码由Objective-C展示，项目已经上传至github中[CBArchiver](https://github.com/cba023/YYModel-CBArchiver)(https://github.com/cba023/YYModel-CBArchiver)，若要使用，请导入文件到您的项目。

## 功能展示

![功能演示](http://upload-images.jianshu.io/upload_images/2484280-9d598797a69d7621.gif?imageMogr2/auto-orient/strip)


## 使用说明
### 导入项目
####  手动导入
![手动导入项目需要将该文件夹的所有内容引入项目中](http://upload-images.jianshu.io/upload_images/2484280-35e9a26a68edbdcd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

如图所示，将“CBArchiver”文件夹拖入要用到该框架的工程中，在Swift项目中，可直接对其进行使用。 

![你需要将CBArchiver的文件导入到Target的Build Phase 中 (You should import some file to there)](http://upload-images.jianshu.io/upload_images/2484280-fecbddb0de1f3fa5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 函数调用

* 转换字典型数组为model型数组
```
NSArray * arr = dicJson[@"list"];
// arr: 字典型数组 ，self.list: 自定义的List类型的数组 
self.list =  [arr convertToModelClass:[List class]];
```
* 保存数据模型到本地

```
// flag: 存储是否成功
BOOL flag = [CBArchiver.shared writeObj:self.list withFileName:DataName];
NSString * msg = flag == YES ? @"Write success" : @"Write fail";
```

* 从本地读取之前存入的数据模型

```
NSMutableArray <List *>* arrModel = [CBArchiver.shared readFromFileName:DataName];
```

* 从本地删除之前存入的数据模型

```
// flag: YES为成功 ,NO表示不存在该归档
BOOL flag = [CBArchiver.shared deleteFromFileName:DataName];
NSString * msg = flag == YES ? @" Delete success" : @"Delete fail, maybe file does not exist ";
```
### 实现原理

#### 函数封装

* 获取归档文件路径名称
```
/// Get data's name
- (NSString *)getPathWithFileName:(NSString *)name {
    NSString * pathsToDocuments = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString * dataPath = [NSString stringWithFormat:@"%@/%@.bin",pathsToDocuments,name];
    return dataPath;
}
```

* 转换字典型数组为model型数组
```
- (NSMutableArray *)convertToModelClass:(Class)aClass {
    NSMutableArray * list = [NSMutableArray array];
    for(id obj in self) {
        id model = [aClass yy_modelWithDictionary:obj];
        [list addObject:model];
    }
    return list;
}
```
* 保存数据模型到本地

```
// Write data to file
- (BOOL)writeObj:(id)obj withFileName:(NSString *)name {
    NSString * p = [self getPathWithFileName:name];
    BOOL flag = [NSKeyedArchiver archiveRootObject:obj toFile:p];
    return flag;
}
```

* 从本地读取之前存入的数据模型

```
// Read data from file
- (id)readFromFileName:(NSString *)name {
    NSString * p = [self getPathWithFileName:name];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:p];
}
```

* 从本地删除之前存入的数据模型

```
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
```

亲， 看上上面的介绍是不是觉得归档操作简单多了呀？是的，通过封装我们可以在非常简洁的情况下调用归档实现快速的文件本地化，可以为你的页面做缓存，或者存储其他的轻量的数据，没有读懂？请原谅我写得不太优美，欢迎去github下载https://github.com/cba023/YYModel-CBArchiver。
亲，学会了吧？赶快去嗨皮吧！

## 致读者
该项目已经上传至github中[YYModel-CBArchiver](https://github.com/cba023/YYModel-CBArchiver)(https://github.com/cba023/YYModel-CBArchiver)
，可以在那里直接star 或者fork 该项目，它可能会长期的帮助您高效地进行程序开发，当然也欢迎留言，有不足或者错误的地方可以随时指正，您的指导和建议是我前行路上新的动力！

