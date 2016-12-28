//
//  TimeLineCell.h
//  Client
//
//  Created by qq on 2016/12/28.
//  Copyright © 2016年 qq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeLineView.h"
#import "TimeEventModel.h"

@interface TimeLineCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbDate;
@property (weak, nonatomic) IBOutlet UILabel *lbDay;
@property (weak, nonatomic) IBOutlet TimeLineView *timeLineView;
@property (weak, nonatomic) IBOutlet UILabel *lbTime;
@property (weak, nonatomic) IBOutlet UILabel *lbEvent;
@property (strong,nonatomic)TimeEventModel* model;

-(void)setup;
@end
