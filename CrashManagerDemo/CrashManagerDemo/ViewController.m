//
//  ViewController.m
//  CrashManagerDemo
//
//  Created by Administrator on 15/10/8.
//  Copyright © 2015年 weiqun. All rights reserved.
//

#import "ViewController.h"
#import "CrashManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CrashManager *crashManager = [CrashManager defaultManager];
    if ([crashManager isCrashLog]) {
        NSString *crashString = [crashManager crashLogContent];//Crash日志内容
        NSLog(@"crashString = %@",crashString);//
    }
    [crashManager clearCrashLog];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
