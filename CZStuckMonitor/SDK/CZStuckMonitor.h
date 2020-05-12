//
//  CZStuckMonitor.h
//  CZStuckMonitor
//
//  Created by 赵曙诚 on 2020/5/12.
//  Copyright © 2020 赵曙诚. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CZStuckMonitor : NSObject

+(CZStuckMonitor *)monitor;

-(void)start;

@end

NS_ASSUME_NONNULL_END
