//
//  ListModel.h
//  CBYYModelArchiverDemo
//
//  Created by mac on 2017/9/27.
//  Copyright © 2017年 Universal. All rights reserved.
//

#import "CBBaseModel.h"



@interface Courier :CBBaseModel<YYModel>
@property (nonatomic , copy) NSString              * _id;
@property (nonatomic , copy) NSString              * name;
@property (nonatomic , copy) NSString              * mobile;

@end

@interface Start :CBBaseModel
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , copy) NSString              * mobile;
@property (nonatomic , copy) NSString              * sendtime;
@property (nonatomic , copy) NSString              * address;

@end

@interface Consignee :CBBaseModel
@property (nonatomic , copy) NSString              * name;
@property (nonatomic , copy) NSString              * address;
@property (nonatomic , copy) NSString              * phone;

@end

@interface Shipper :CBBaseModel
@property (nonatomic , copy) NSString              * name;
@property (nonatomic , copy) NSString              * address;
@property (nonatomic , copy) NSString              * phone;

@end

@interface Order :CBBaseModel
@property (nonatomic , copy) NSString              * remark;
@property (nonatomic , copy) NSString              * goodsnum;
@property (nonatomic , copy) NSString              * paytype;
@property (nonatomic , copy) NSString              * paketype;
@property (nonatomic , copy) NSString              * taketime;
@property (nonatomic , copy) NSString              * goods;

@end

@interface List :CBBaseModel<YYModel>
@property (nonatomic , copy) NSString              * start_station;
@property (nonatomic , copy) NSString              * addtime;
@property (nonatomic , copy) NSString              * end_station;
@property (nonatomic , copy) NSString              * _id;
@property (nonatomic , copy) NSString              * transferdrivertime;
@property (nonatomic , strong) Courier              * courier;
@property (nonatomic , copy) NSString              * transferone;
@property (nonatomic , copy) NSString              * transferonetime;
@property (nonatomic , strong) Start              * start;
@property (nonatomic , copy) NSString              * statustypes;
@property (nonatomic , copy) NSString              * isdeliver;
@property (nonatomic , copy) NSString              * end_areaname;
@property (nonatomic , copy) NSString              * logistics;
@property (nonatomic , strong) Consignee              * consignee;
@property (nonatomic , strong) Shipper              * shipper;
@property (nonatomic , copy) NSString              * isexpress;
@property (nonatomic , copy) NSString              * finishtime;
@property (nonatomic , copy) NSString              * transfertwo;
@property (nonatomic , copy) NSString              * status;
@property (nonatomic , copy) NSString              * exptime;
@property (nonatomic , copy) NSString              * price;
@property (nonatomic , strong) Order              * order;
@property (nonatomic , copy) NSString              * deliverychoice;
@property (nonatomic , copy) NSString              * start_area;
@property (nonatomic , copy) NSString              * transfertwotime;
@property (nonatomic , copy) NSString              * transferdriver;
@property (nonatomic , copy) NSString              * starttime;
@property (nonatomic , copy) NSString              * start_areaname;
@property (nonatomic , copy) NSString              * pickuptime;
@property (nonatomic , copy) NSString              * arrivedtime;
@property (nonatomic , copy) NSString              * end_area;
@property (nonatomic , copy) NSString              * shortno;
@property (nonatomic , copy) NSString              * orderno;

@end

@interface Extends :CBBaseModel
@property (nonatomic , copy) NSNumber *              ordercount;
@property (nonatomic , copy) NSNumber *                total;
@property (nonatomic , copy) NSNumber *                allprice;
@property (nonatomic , copy) NSNumber *                postprice;
@property (nonatomic , copy) NSNumber *                costprice;

@end

@interface ListModel : CBBaseModel<YYModel>
@property (nonatomic , copy) NSString              * code;
@property (nonatomic , copy) NSString              * msg;
@property (nonatomic , strong) NSArray<List *>              * list;
@property (nonatomic , strong) Extends              * extends;

@end

