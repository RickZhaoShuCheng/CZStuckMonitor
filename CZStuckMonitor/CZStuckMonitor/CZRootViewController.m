//
//  CZRootViewController.m
//  CZStuckMonitor
//
//  Created by 赵曙诚 on 2020/5/12.
//  Copyright © 2020 赵曙诚. All rights reserved.
//

#import "CZRootViewController.h"
#import "CZStuckMonitor.h"

@interface CZRootViewController ()

@end

@implementation CZRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[CZStuckMonitor monitor] start];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [NSThread sleepForTimeInterval:3];
        });
    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
