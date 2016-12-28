//
//  TimeEventModel.m
//  Client
//
//  Created by qq on 2016/12/28.
//  Copyright © 2016年 qq. All rights reserved.
//

#import "TimeEventModel.h"
#import "NSDate+DateTools.h"
#import "func.h"

@implementation TimeEventModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
-(NSDate*)getDate{
    NSDate* date= [NSDate dateWithTimeIntervalSince1970:_timestamp/1000];
    return date;
}
-(NSInteger)getYear{
    return [self getDate].year;
}
-(NSInteger)getDay{
    return [self getDate].day;
}
-(NSInteger)getMonth{
    return [self getDate].month;
}
-(NSString*)getMonthDay{
    return [NSString stringWithFormat:@"%ld月%ld日",[self getMonth],[self getDay]];
}
-(NSString*)getTime{
    return [NSString stringWithFormat:@"%ld:%ld",(long)[self getDate].hour,(long)[self  getDate].minute];
}
-(NSString*)getWeekday{
    //Weekday units are the numbers 1-n, in the Gregorian calendar, n is 7 and Sunday is represented by 1.
    return weekdayChinese([self getDate]);
}

@end
