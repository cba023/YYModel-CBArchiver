//
//  ModelOfGroupVC.m
//  CBYYModelArchiverDemo
//
//  Created by mac on 2017/9/27.
//  Copyright © 2017年 Universal. All rights reserved.
//

#import "ModelOfGroupVC.h"
#import "ListModel.h"
#import "ModelOfGroupTCell.h"
#import "CBArchiver.h"
#define DataName @"Data"

@interface ModelOfGroupVC ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *lblReminder;
@property (nonatomic,strong) NSMutableArray<List *> * list;
@end

@implementation ModelOfGroupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self start];
}

- (void)start {
    self.title = @"Array<MODELCLASS> 模型类数组";
    self.list = [NSMutableArray array];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"ModelOfGroupTCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
}

// Load json
- (void)loadJSON {
    NSString * jsonPath = [NSBundle.mainBundle pathForResource:@"data" ofType:@"json"];
    NSData * jsonData = [NSData dataWithContentsOfFile:jsonPath];
    NSDictionary * dicJson = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    NSArray * arr = dicJson[@"list"];
#pragma mark - Convert dictionary class array to model class array
    self.list =  [arr convertToModelClass:[List class]];
    
}

- (IBAction)clearTableView:(id)sender {
    [self.list removeAllObjects];
    [self.tableView reloadData];
    NSString * msg = @"Clear TableView's data";
    [self showMessage:msg];
}

- (IBAction)loadJsonData:(id)sender {
    [self loadJSON];
    [self.tableView reloadData];
    NSString * msg = @"Load JSON and convert dictionary class array to model class array";
    [self showMessage:msg];
}

- (IBAction)writeData:(id)sender {
#pragma mark - Write data to file
     BOOL flag = [CBArchiver.shared writeObj:self.list withFileName:DataName];
    NSString * msg = flag == YES ? @"Write success" : @"Write fail";
    [self showMessage:msg];
}

- (IBAction)readData:(id)sender {
#pragma mark - Read data from file
    [self clearTableView:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSMutableArray <List *>* arrModel = [CBArchiver.shared readFromFileName:DataName];
        self.list = arrModel;
        NSString * msg = [NSString stringWithFormat:@"%@", arrModel];
        [self showMessage:msg];
        [self.tableView reloadData];
    });
    
}

- (IBAction)delData:(id)sender {
#pragma mark - Delete file of the data
    BOOL flag = [CBArchiver.shared deleteFromFileName:DataName];
    NSString * msg = flag == YES ? @" Delete success" : @"Delete fail, maybe file does not exist ";
    [self showMessage:msg];
    [self.list removeAllObjects];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ModelOfGroupTCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    List * model = self.list[indexPath.row];
    cell.lblTitle.text = model.shipper.name;
    cell.lblSubTitle.text = model.shipper.phone;
    cell.lblDesc.text = model.shipper.address;
    return cell;
}

- (void)showMessage:(NSString *)message {
    self.lblReminder.text = message;
    self.lblReminder.alpha = 1;
    NSLog(@"%@", message);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.5 animations:^{
            self.lblReminder.alpha = 0;
        }];
    });
}

@end

