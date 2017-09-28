//
//  ModelOfSingleVC.m
//  CBYYModelArchiverDemo
//
//  Created by mac on 2017/9/27.
//  Copyright © 2017年 Universal. All rights reserved.
//

#import "ModelOfSingleVC.h"
#import "CBArchiver.h"
#import "ModelOfSingleModel.h"

@interface ModelOfSingleVC ()
@property (weak, nonatomic) IBOutlet UITextField *tfName;
@property (weak, nonatomic) IBOutlet UITextField *tfAge;
@property (weak, nonatomic) IBOutlet UITextField *tfAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblReminder;

@end

static NSString * SingleModelFileName = @"MODELDATA";

@implementation ModelOfSingleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AnyClass Model";
    UIBarButtonItem * button = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(packUpKeyboard)];
    self.navigationItem.rightBarButtonItem = button;
    self.tfAge.keyboardType = UIKeyboardTypeNumberPad;
}

- (void)packUpKeyboard {
    [UIApplication.sharedApplication.keyWindow endEditing:YES];
}

- (IBAction)clearTxtFields:(id)sender {
    _tfName.text = @"";
    _tfAge.text = @"";
    _tfAddress.text = @"";
    NSString * msg = [NSString stringWithFormat:@"clean Success"];
    [self showMessage:msg];
}

- (IBAction)readData:(id)sender {
    ModelOfSingleModel * model = [CBArchiver.shared readFromFileName:SingleModelFileName];
    self.tfName.text = model.name;
    self.tfAddress.text = model.address;
    self.tfAge.text = [NSString stringWithFormat:@"%ld", (long)model.age];
    NSString * msg = model == nil ? @"Read fail" : [NSString stringWithFormat:@"Read Success:%@", model];
    [self showMessage:msg];
}

- (IBAction)writeData:(id)sender {
    ModelOfSingleModel * model = [[ModelOfSingleModel alloc] init];
    model.name = self.tfName.text;
    model.address = self.tfAddress.text;
    model.age = [self.tfAge.text integerValue];
    BOOL flag = [CBArchiver.shared writeObj:model withFileName:SingleModelFileName];
    NSString * msg = flag == YES ? @"Write success" : @"Write fail";
    [self showMessage:msg];
}

- (IBAction)delData:(id)sender {
    [self clearTxtFields:nil];
    BOOL flag = [CBArchiver.shared deleteFromFileName:SingleModelFileName];
    NSString * msg = flag == YES ? @"Delete success" : @"Delete fail, maybe file does not exist ";
    [self showMessage:msg];
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
