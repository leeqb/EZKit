//
//  NSDate+Extension.m
//  EZKit
//
//  Created by leeqb on 6/5/16.
//  Copyright © 2016 powerlee. All rights reserved.
//

#import "NSDate+Extension.h"

NSString *kEZDateFormat_FULL = @"yyyy-MM-dd HH:mm:ss.SSS"; // 包括毫秒
NSString *kEZDateFormat_DATE_AND_TIME = @"yyyy-MM-dd HH:mm:ss"; // 年月日时分秒
NSString *kEZDateFormat_DATE = @"yyyy-MM-dd"; // 年月日
NSString *kEZDateFormat_TIME = @"HH:mm:ss"; // 时分秒

@implementation NSDate (Extension)

- (NSString *)stringWithFormat:(NSString *)formatString
{
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateFormat = formatString;
    return [fmt stringFromDate:self];
}

- (NSDate *)zeroDate
{
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateFormat = kEZDateFormat_DATE;
    NSString *dateString = [fmt stringFromDate:self];
    
    fmt.dateFormat = kEZDateFormat_FULL;
    dateString = [NSString stringWithFormat:@"%@ 00:00:00.000", dateString];
    
    return [fmt dateFromString:dateString];
}

+ (NSString *)timeStringWithSeconds:(NSTimeInterval)seconds formatString:(NSString *)formatString
{
    NSDate *zeroDate = [[NSDate date] zeroDate];
    NSTimeInterval timeInterval = [zeroDate timeIntervalSince1970];
    timeInterval += seconds;
    
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
    return [newDate stringWithFormat:formatString];
}

@end
