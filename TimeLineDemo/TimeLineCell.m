//
//  TimeLineself.m
//  Client
//
//  Created by qq on 2016/12/28.
//  Copyright © 2016年 qq. All rights reserved.
//

#import "TimeLineCell.h"

@implementation TimeLineCell

-(void)setup{
    self.lbEvent.text = nil;
    self.lbTime.text = nil;
    self.lbDay.text = nil;
    self.lbDate.text = nil;
    [self.timeLineView setup];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(TimeEventModel *)model{
    _model = model;
    [self setup];// 清理 UI
    
    self.lbTime.text = [model getTime];
    if([model.event isEqualToString:@"out"]){
        self.lbEvent.text = @"宝贝已经离校啦，请家长注意学生安全";
    }else if([model.event isEqualToString:@"in"]){
        self.lbEvent.text = @"宝贝已经到学校啦";
    }else{
        self.lbEvent.text = model.event;
    }
    
    // 根据 TimeEventModelType 类型分别处理
    switch (model.type) {
        case TimeEventModelTypeEndPoint:
            self.timeLineView.timelineVisible = YES;
            self.timeLineView.nodeVisible = YES;
            self.timeLineView.circleVisible = YES;
            self.lbDate.text = [model getMonthDay];
            self.lbDay.text = [model getWeekday];
            break;
        case TimeEventModelTypeNode:
            self.timeLineView.timelineVisible = YES;
            self.timeLineView.nodeVisible = YES;
            self.lbDate.text = [model getMonthDay];
            self.lbDay.text = [model getWeekday];
            break;
        default:
            self.timeLineView.timelineVisible = YES;
            break;
    }
    
    [self.timeLineView setNeedsDisplay];
}

@end
