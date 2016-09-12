//
//  ViewController.m
//  MKFPSStatus
//
//  Created by xiaomk on 16/6/27.
//  Copyright © 2016年 MK. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>{
    
}

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(8, 100, [UIScreen mainScreen].bounds.size.width-16, 100)];
    lab.text = @"我是个TableView 滚我 \n I'm a tableView scroll me";
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = [UIFont systemFontOfSize:20];
    lab.textColor = [UIColor redColor];
    [self.view addSubview:lab];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    for (NSInteger i = 0; i < [UIScreen mainScreen].bounds.size.width/4; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i*4, 0, 4, 12)];
        view.backgroundColor = [UIColor colorWithRed:(255-i)/255.0f green:(255-i)/255.0f blue:(255-i)/255.0f alpha:1];
        [cell addSubview:view];
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10000;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
