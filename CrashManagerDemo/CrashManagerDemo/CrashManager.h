//
//  CrashManager.h
//  CrashManagerDemo
//
//  Created by Administrator on 15/10/8.
//  Copyright © 2015年 weiqun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CrashManager : NSObject

void uncaughtExceptionHandel(NSException *exception);

+ (id)defaultManager;

- (void)clearCrashLog;
- (BOOL)isCrashLog;

- (NSString *)crashLogContent;
@end
