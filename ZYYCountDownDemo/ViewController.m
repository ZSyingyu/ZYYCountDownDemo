//
//  ViewController.m
//  ZYYCountDownDemo
//
//  Created by liguo.chen on 16/9/29.
//  Copyright © 2016年 Slience. All rights reserved.
//

#import "ViewController.h"
#import "Common.h"
#import "ZyyCountDownViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"倒计时";
    self.navigationController.navigationBar.barTintColor = [UIColor purpleColor];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:[UIColor redColor]}];
    
    UIButton *numBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, SCREEN_WIDTH - 20, 50)];
    numBtn.backgroundColor = [UIColor purpleColor];
    [numBtn setTitle:@"倒计时按钮" forState:UIControlStateNormal];
    [numBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [numBtn addTarget:self action:@selector(numAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:numBtn];
    
}

-(void)numAction {
    ZyyCountDownViewController *countVc = [[ZyyCountDownViewController alloc] init];
    [self.navigationController pushViewController:countVc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
