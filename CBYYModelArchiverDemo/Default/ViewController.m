//
//  ViewController.m
//  CBYYModelArchiverDemo
//
//  Created by mac on 2017/9/27.
//  Copyright © 2017年 Universal. All rights reserved.
//

#import "ViewController.h"
#import "ModelOfGroupVC.h"
#import "ModelOfSingleVC.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)action1:(id)sender {
    ModelOfGroupVC * vc1 = [[ModelOfGroupVC alloc] init];
    [self.navigationController pushViewController:vc1 animated:YES];
}

- (IBAction)action2:(id)sender {
    ModelOfSingleVC * vc2 = [[ModelOfSingleVC alloc] init];
    [self.navigationController pushViewController:vc2 animated:YES];
}


@end
