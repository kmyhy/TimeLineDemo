//
//  func.c
//  Client
//
//  Created by qq on 2016/12/5.
//  Copyright © 2016年 qq. All rights reserved.
//

#include "func.h"
#import "JSONModel.h"
#import "NSDate+DateTools.h"

NSString* json2str(id json){
    NSError* error;
    NSData* data = [NSJSONSerialization dataWithJSONObject:json options:0 error:&error];
    if(error == nil){
        return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}

NSString* weekdayChinese(NSDate* date){
    switch(date.weekday){
        case 1:
            return @"星期天";
        case 2:
            return @"星期一";
        case 3:
            return @"星期二";
        case 4:
            return @"星期三";
        case 5:
            return @"星期四";
        case 6:
            return @"星期五";
        default:
            return @"星期六";
            
    }
}
