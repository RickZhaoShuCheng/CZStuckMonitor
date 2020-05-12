//
//  CZStuckMonitor.m
//  CZStuckMonitor
//
//  Created by 赵曙诚 on 2020/5/12.
//  Copyright © 2020 赵曙诚. All rights reserved.
//

#import "CZStuckMonitor.h"

static dispatch_queue_t stuckQueue;
static CZStuckMonitor *monitor;
static BOOL monitering;
static dispatch_semaphore_t sem;
static dispatch_time_t t;

@implementation CZStuckMonitor

+(CZStuckMonitor *)monitor
{
    if (!monitor) {
        monitor = [[CZStuckMonitor alloc] init];
    }
    return monitor;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        stuckQueue = dispatch_queue_create([NSStringFromClass([self class]) UTF8String], NULL);
        sem = dispatch_semaphore_create(0);
        t = dispatch_time(DISPATCH_TIME_NOW, 100.0 * NSEC_PER_SEC);
        monitering = YES;
    }
    return self;
}

-(void)start
{
    dispatch_async(stuckQueue, ^{
        while (monitering) {
            __block BOOL timeOut = YES;
            dispatch_async(dispatch_get_main_queue(), ^{
                timeOut = NO;
                dispatch_semaphore_signal(sem);
            });
            [NSThread sleepForTimeInterval:2];
            if (timeOut) {
                NSLog(@"卡主啦，打印堆栈看看");
            }
            dispatch_semaphore_wait(sem, t);
        }
    });
}
@end
