//
//  CrashManager.m
//  CrashManagerDemo
//
//  Created by Administrator on 15/10/8.
//  Copyright © 2015年 weiqun. All rights reserved.
//

#import "CrashManager.h"
#import "AppTools.h"

static CrashManager *crashManager = nil;
#define LocalCrashLogPath [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"/microFinanceCrashError.txt"]

@implementation CrashManager


+ (id)defaultManager
{
    @synchronized(self) {
        
        static dispatch_once_t pred;
        dispatch_once(&pred, ^{
            
            crashManager = [[self alloc]init];
        });
    }
    return crashManager;
    
}

void uncaughtExceptionHandel(NSException *exception)
{
    NSArray *listArray = [exception callStackSymbols];
    NSString *reason = [exception reason];
    NSString *name = [exception name];
    NSString *exceptionInfo = [NSString stringWithFormat:@"Exception reason: %@\nException name: %@\nException stack :%@",reason,name,listArray];
    [exceptionInfo writeToFile:LocalCrashLogPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

- (void)clearCrashLog
{
    NSFileManager *fileManager = [[NSFileManager alloc]init];
    [fileManager removeItemAtPath:LocalCrashLogPath error:nil];
}

-(BOOL)isCrashLog
{
    NSError *error;
    NSString *textFileContents = [NSString stringWithContentsOfFile:LocalCrashLogPath encoding:NSUTF8StringEncoding error:&error];
    if ([AppTools checkConverNull:textFileContents]) {
        
        return NO;
    }else {
        return YES;
    }
}

- (NSString *)crashLogContent
{
    NSError *error;
     NSString *textFileContents = [NSString stringWithContentsOfFile:LocalCrashLogPath encoding:NSUTF8StringEncoding error:&error];
    if ([AppTools checkConverNull:textFileContents]) {
        
        return @"";
    }else {
        return textFileContents;
    }
}

@end
