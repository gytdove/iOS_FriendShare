//
//  ViewController.m
//  XDFriendShare
//
//  Created by 郎学东 on 2017/12/1.
//  Copyright © 2017年 郎学东. All rights reserved.
//

#import "ViewController.h"
#import "XDFriendShareCell.h"
#import "CellModel.h"

@interface ViewController ()
<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView * tabelView;
@property (nonatomic,strong)NSMutableArray * dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tabelView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tabelView.delegate = self;
    _tabelView.dataSource = self;
    [self.view addSubview:_tabelView];
    [self testData];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _tabelView.frame = self.view.bounds;
}

- (void)testData{
    _dataArray = [NSMutableArray array];
    for (int i =0; i<4; i++) {
        CellModel *model = [[CellModel alloc]init];
        model.avator = @"head_icon";
        model.name = @"学东";
        model.title = @"美女在哪里";
        model.time = @"5分钟";
        model.comemtNum = @"66";
        model.zanNum = @"99";
        model.content = @"我就是程序猿";
        
        if (i==1) {
            model.imgsss = @"11650430.jpg";
            model.content = @"东哥最帅,迎娶白富美,出任 CEO, 走向人生巅峰";
            
        }else if(i == 2){
            model.imgsss = @"13556621.jpg,13556684.jpg,13828270.jpg,14126650.jpg";
            model.content = @"美貌与智慧的结合,英雄与侠义的化身,人称一树梨花压海棠的玉面小飞龙,人见人爱,车见车载,花见花开,鸟见鸟呆,马车见了会爆胎,不行了,编不下去了";
            
        }else if(i == 3){
            model.imgsss = @"11650430.jpg,13556621.jpg,13556684.jpg,13566728.jpg,13721782.jpg,13828270.jpg,13864969.jpg,14126650.jpg,14183410.jpg";
        }
        [_dataArray addObject:model];
    }
    [_tabelView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellModel *model = _dataArray[indexPath.row];
    NSArray * imgs = [model.imgsss componentsSeparatedByString:@","];
    return  [XDFriendShareCell cellHeightWithStr:model.content imgs:imgs];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XDFriendShareCell * cell = [XDFriendShareCell dynamicCellWithTable:tableView];
    
    cell.model = _dataArray[indexPath.row];
    return cell;
}



@end
