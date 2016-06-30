//
//  NSDate+Extension.h
//  EZKit
//
//  Created by leeqb on 6/5/16.
//  Copyright © 2016 powerlee. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *kEZDateFormat_FULL; // 包括毫秒
extern NSString *kEZDateFormat_DATE_AND_TIME; // 年月日时分秒
extern NSString *kEZDateFormat_DATE; // 年月日
extern NSString *kEZDateFormat_TIME; // 时分秒

@interface NSDate (Extension)

- (NSString *)stringWithFormat:(NSString *)formatString;

// 返回到当天0点0时0分
- (NSDate *)zeroDate;

+ (NSString *)timeStringWithSeconds:(NSTimeInterval)seconds formatString:(NSString *)formatString;

// 计算年龄
- (NSInteger)getAgeWithBirthDate:(NSDate *)birthday;

/**
 *  根据生日计算星座
 *
 *  @param month 月份
 *  @param day   日期
 *
 *  @return 星座名称
 */
- (NSString *)getAstroWithMonth:(NSInteger)m day:(NSInteger)d;

// 根据年份得到生肖
- (NSString *)getZodiacWithYear:(NSInteger)y;

@end
