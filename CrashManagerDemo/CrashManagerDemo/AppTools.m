//
//  AppTools.m
//  CrashManagerDemo
//
//  Created by Administrator on 15/10/8.
//  Copyright © 2015年 weiqun. All rights reserved.
//

#import "AppTools.h"

@implementation AppTools

+ (BOOL)checkConverNull:(NSString *)object
{
    if ([object isEqual:[NSNull null]] || [object isKindOfClass:[NSNull class]] || object == nil || [object isEqualToString:@""]) {
        
        return YES;
    }else {
      
        return NO;
    }
}

@end
