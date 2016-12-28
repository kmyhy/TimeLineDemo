//
//  TimeEventModel.h
//  Client
//
//  Created by qq on 2016/12/28.
//  Copyright © 2016年 qq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

typedef NS_ENUM(NSUInteger,TimeEventModelType){
    TimeEventModelTypeEndPoint, // 终点，绘制时间线（时间线只画到一半）、节点和圆圈
    TimeEventModelTypeNode, // 时间节点，绘制时间线和节点
    TimeEventModelTypeNormal // 普通节点，只绘制时间线
    
};

@interface TimeEventModel : JSONModel

@property(assign,nonatomic)NSInteger timestamp;
@property(strong,nonatomic)NSString* event;
@property(assign,nonatomic)TimeEventModelType type;


-(NSInteger)getYear;
-(NSInteger)getMonth;
-(NSInteger)getDay;
-(NSString*)getMonthDay;
-(NSString*)getTime;
-(NSDate*)getDate;
-(NSString*)getWeekday;

@end
