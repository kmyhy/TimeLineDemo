//
//  LifeTimeLine.h
//  Client
//
//  Created by qq on 2016/12/27.
//  Copyright © 2016年 qq. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface TimeLineView : UIView

@property(strong,nonatomic)IBInspectable UIColor* circleColor; // 圆圈颜色
@property(assign,nonatomic)IBInspectable CGFloat nodeRadius; // 节点半径；
@property(assign,nonatomic)IBInspectable CGFloat circleStrokeWidth;// 圆圈的线宽
@property(assign,nonatomic)IBInspectable CGFloat circleRadius; // 圆圈半径
@property(strong,nonatomic)IBInspectable UIColor* timeLineColor; // 周期线的颜色
@property(assign,nonatomic)IBInspectable CGFloat timeLineWidth; // 周期线的线宽
@property(assign,nonatomic)IBInspectable BOOL circleVisible; // 是否绘制终点
@property(assign,nonatomic)IBInspectable BOOL nodeVisible;// 是否绘制节点
@property(assign,nonatomic)IBInspectable BOOL timelineVisible;// 是否绘制时间线
@property(assign,nonatomic)IBInspectable CGFloat nodePosition;// 节点绘制位置，相对于整个长度的比例，0-1

-(void)setup;
@end
