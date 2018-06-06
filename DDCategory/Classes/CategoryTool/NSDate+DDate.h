//
//  NSDate+DDate.h
//  DFrame
//
//  Created by DaiSuke on 16/9/30.
//  Copyright © 2016年 DaiSuke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DDate)

/**
 *  格式化日期
 *
 *  @param dateFormat 日期格式，etg：@"yyyy-MM-dd HH:mm:ss"
 *
 *  @return 字符串
 */
- (NSString *)formatToString:(NSString *)dateFormat;

//获取固定的时间格式的当前时间 @"yyyy-MM-dd'T'HH:mm:ss"
- (NSString *)getNowDate;

+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;

@end
