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

- (NSDate *)dateWithFormat:(NSString *)dateString formatString:(NSString *)formatString
{
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateFormat = formatString;
    
    NSDate *tempDate = [fmt dateFromString:dateString];
    tempDate = tempDate.zeroDate;
    
    return tempDate;
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

// 计算年龄
+ (NSInteger)getAgeWithBirthDate:(NSDate *)birthday {
    //日历
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger unitFlags = NSCalendarUnitYear;
    
    NSDateComponents *components = [gregorian components:unitFlags fromDate:birthday toDate:[NSDate  date] options:0];
    return [components year] + 1;
    //NSLog(@"%@", [NSString stringWithFormat:@"%ld岁了",[components year]+1]);
}

/**
 *  根据生日计算星座
 *
 *  @param month 月份
 *  @param day   日期
 *
 *  @return 星座名称
 */
- (NSString *)getAstroWithMonth:(NSInteger)m day:(NSInteger)d {
    NSString *astroString = @"魔羯水瓶双鱼白羊金牛双子巨蟹狮子处女天秤天蝎射手魔羯";
    NSString *astroFormat = @"102123444543";
    NSString *result;
    
    if (m < 1 || m > 12 || d < 1 || d > 31){
        //return @"错误日期格式!";
        return @"";
    }
    
    if (m == 2 && d > 29) {
        //return @"错误日期格式!!";
        return @"";
    } else if(m == 4 || m == 6 || m == 9 || m == 11) {
        if (d > 30) {
            //return @"错误日期格式!!!";
            return @"";
        }
    }
    
    result = [NSString stringWithFormat:@"%@", [astroString substringWithRange:NSMakeRange(m*2-(d < [[astroFormat substringWithRange:NSMakeRange((m-1), 1)] intValue] - (-19))*2,2)]];
    return [result stringByAppendingString:@"座"];
}

// 根据年份得到生肖
- (NSString *)getZodiacWithYear:(NSInteger)y {
    if (y < 0) {
        //return @"错误日期格式!!!";
        return @"";
    }
    
    NSString *zodiacString = @"鼠牛虎兔龙蛇马羊猴鸡狗猪";
    NSRange range = NSMakeRange((y+9)%12-1, 1);
    NSString *result = [zodiacString substringWithRange:range];
    //return [result stringByAppendingString:@"年"];
    return result;
}

@end
