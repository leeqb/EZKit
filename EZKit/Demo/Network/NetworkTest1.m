//
//  NetworkTest1.m
//  EZKit
//
//  Created by leeqb on 5/3/16.
//  Copyright © 2016 powerlee. All rights reserved.
//

#import "NetworkTest1.h"

@implementation NetworkTest1

- (void)startRequest
{
    [[EZNetwork sharedInstance] POST:@"http://api.map.baidu.com/telematics/v3/weather?location=%E5%98%89%E5%85%B4&output=json&ak=5slgyqGDENN7Sy7pw29IUvrZ" params:nil success:^(NSDictionary *result) {
        NSLog(@"%@", result);
    } failed:^(NSDictionary *result, NSError *error) {
    } finally:^{
    }];
}

@end
