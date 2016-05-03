//
//  EZNetwork.m
//  EZKit
//
//  Created by leeqb on 4/28/16.
//  Copyright © 2016 powerlee. All rights reserved.
//

#import "EZNetwork.h"

@implementation EZNetwork

+ (instancetype)sharedInstance
{
    static EZNetwork *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

@end
