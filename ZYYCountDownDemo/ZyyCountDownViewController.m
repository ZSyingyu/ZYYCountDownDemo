//
//  ZyyCountDownViewController.m
//  ZYYCountDownDemo
//
//  Created by liguo.chen on 16/9/29.
//  Copyright © 2016年 Slience. All rights reserved.
//

#import "ZyyCountDownViewController.h"
#import "Common.h"

@interface ZyyCountDownViewController ()

{
    NSInteger secondsCountDown;//倒计时总时长
    NSTimer *countDownTimer;
}
@property(strong,nonatomic)UILabel *timeLabel;

@end

@implementation ZyyCountDownViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"倒计时展示";
    [self setBackBarButtonItemWithTitle:@"返回"];
    self.view.backgroundColor = [UIColor whiteColor];
    
    secondsCountDown = 172800;//倒计时秒数(48小时换算成的秒数,项目中需要从服务器获取)
    countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDownAction) userInfo:nil repeats:YES]; //启动倒计时后会每秒钟调用一次方法 countDownAction
    //设置倒计时显示的时间
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",secondsCountDown/3600];//时
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(secondsCountDown%3600)/60];//分
    NSString *str_second = [NSString stringWithFormat:@"%02ld",secondsCountDown%60];//秒
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    NSLog(@"time:%@",format_time);
    
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    self.timeLabel.text = [NSString stringWithFormat:@"倒计时   %@",format_time];
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    self.timeLabel.font = [UIFont systemFontOfSize:19];
    self.timeLabel.textColor = [UIColor  redColor];
    [self.view addSubview:self.timeLabel];
}

-(void) countDownAction{
    //倒计时-1
    secondsCountDown--;
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",secondsCountDown/3600];
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(secondsCountDown%3600)/60];
    NSString *str_second = [NSString stringWithFormat:@"%02ld",secondsCountDown%60];
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    //修改倒计时标签现实内容
    self.timeLabel.text=[NSString stringWithFormat:@"倒计时   %@",format_time];
    //当倒计时到0时，做需要的操作，比如验证码过期不能提交
    if(secondsCountDown==0){
        [countDownTimer invalidate];
    }
}


/**
 *  设置返回按钮标题
 */
- (void)setBackBarButtonItemWithTitle:(NSString *)title
{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"NavBackSorrow"] forState:UIControlStateNormal];
    [btn setContentMode:UIViewContentModeScaleAspectFill];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -7, 0, 50)];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 10)];
    [btn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

/**
 *  返回按钮点击事件
 */
- (void)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
