//
//  ViewController.m
//  TimeLineDemo
//
//  Created by qq on 2016/12/28.
//  Copyright © 2016年 qq. All rights reserved.
//

#import "ViewController.h"
#import "TimeLineCell.h"
#import "TimeEventModel.h"

@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray<TimeEventModel*>* models;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadModels:^{
        [self reorganizeModels];
        [_tableView reloadData];
    }];
}
-(void)loadModels:(dispatch_block_t)completion{
    NSError* err;
    NSString* file = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:@"timeline.json"];
    
    NSData* data = [NSData dataWithContentsOfFile:file];
    
    // 注意数据源中的数据必须按时间(timestamp）反序排序
    NSArray *arr = [TimeEventModel arrayOfModelsFromData:data error:&err];
    if(err==nil){
        
        _models = [[NSMutableArray alloc]initWithArray:arr];
        completion();
    }else{
        NSLog(@"load cell model failed:%@",err.localizedDescription);
    }
}
// 设置 model 的 type 属性
-(void)reorganizeModels{
    NSInteger i=0;
    NSInteger day = 0;
    NSInteger year = 0;
    NSInteger month = 0;
    
    for (TimeEventModel* model in _models){
        if(i == 0){
            year = [model getYear];
            month = [model getMonth];
            day = [model getDay];
            model.type = TimeEventModelTypeEndPoint;
        }else{
            if(day == [model getDay] && month == [model getMonth] && year == [model getYear]){
                model.type = TimeEventModelTypeNormal;
            }else{// 日期改变
                model.type = TimeEventModelTypeNode;
                day = [model getDay];// 重置 dayOfYear 变量，以便下次比对
                month = [model getMonth];
                year = [model getYear];
            }
        }
        NSLog(@"date:%@,time:%@",[model getDate],[model getTime]);
        NSLog(@"model:%@",model);
        
        i++;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// MARK: - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _models.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TimeLineCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.model = _models[indexPath.row];
    return cell;
}


@end
