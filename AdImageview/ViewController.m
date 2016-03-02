//
//  ViewController.m
//  AdImageview
//
//  Created by shao on 16/3/2.
//  Copyright © 2016年 wyy. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+LYDD.h"
#define countDownBtnSide 40.0f
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image=[UIImage imageNamed:@"qd01.png"];
    imageView.center = self.view.center;
    imageView.bounds = self.view.bounds;
    [self.view addSubview:imageView];
    
    UIButton * countDownBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width - countDownBtnSide -10, 30, countDownBtnSide, countDownBtnSide)];
    countDownBtn.backgroundColor = [UIColor purpleColor];
    countDownBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    countDownBtn.titleLabel.numberOfLines = 0;
    countDownBtn.layer.cornerRadius = countDownBtnSide/2;
    [countDownBtn setTitle:@"跳过" forState:0];
    
    [countDownBtn startWithSettingTime:1 buttonFrame:countDownBtn.frame cornerRadius:countDownBtnSide/2 radiusColor:[UIColor whiteColor]  didCompletionedAnimation:^{
        
        if (imageView.superview) {
            [imageView removeFromSuperview];
        }
    }];
    
    [imageView addSubview:countDownBtn];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
