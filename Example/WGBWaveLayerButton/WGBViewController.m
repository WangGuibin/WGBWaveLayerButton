//
//  WGBViewController.m
//  WGBWaveLayerButton
//
//  Created by Wangguibin on 09/18/2019.
//  Copyright (c) 2019 Wangguibin. All rights reserved.
//

#import "WGBViewController.h"
#import <WGBWaveLayerButton.h>

@interface WGBViewController ()

@end

@implementation WGBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    WGBWaveLayerButton *waveButton = [WGBWaveLayerButton buttonWithType:UIButtonTypeCustom];
    waveButton.frame = CGRectMake(0, 0, 300, 100);
    waveButton.center = CGPointMake(screenBounds.size.width/2.0, 110);
    waveButton.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];;
    waveButton.waveLayerColor = [UIColor orangeColor];
    [waveButton setTitle:@"Click Me" forState:UIControlStateNormal];
    [self.view addSubview:waveButton];
    
    // 在app里获取git提交记录 参考学习https://github.com/y500/GetGitInfo
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];

    CGFloat offsetY = CGRectGetMaxY(waveButton.frame) + 30;
    UILabel *commitLabel = [self createLabelWithOffsetY:offsetY];
    commitLabel.text = [NSString stringWithFormat:@"最后提交SHA：%@", [infoDic objectForKey:@"GitCommitSHA"]];
    
    offsetY = CGRectGetMaxY(commitLabel.frame);
    UILabel *branchLabel = [self createLabelWithOffsetY:offsetY];
    branchLabel.text = [NSString stringWithFormat:@"当前所在分支：%@", [infoDic objectForKey:@"GitCommitBranch"]];
    
     offsetY = CGRectGetMaxY(branchLabel.frame);
    UILabel *authorLabel = [self createLabelWithOffsetY:offsetY];
    authorLabel.text = [NSString stringWithFormat:@"最后提交用户：%@", [infoDic objectForKey:@"GitCommitUser"]];
    
    offsetY = CGRectGetMaxY(authorLabel.frame);
    UILabel *dateLabel = [self createLabelWithOffsetY:offsetY];
    dateLabel.text = [NSString stringWithFormat:@"最后提交时间：%@", [infoDic objectForKey:@"GitCommitDate"]];
    
    offsetY = CGRectGetMaxY(dateLabel.frame);
    UILabel *buildTimeLabel = [self createLabelWithOffsetY:offsetY];
    buildTimeLabel.text = [NSString stringWithFormat:@"本次编译时间：%@", [infoDic objectForKey:@"BuildTime"]];
   
    offsetY = CGRectGetMaxY(buildTimeLabel.frame) + 20;
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(30, offsetY, self.view.bounds.size.width - 60 , 200)];
    [self.view addSubview: textView];
    
    textView.editable = NO;
    textView.text = [NSString stringWithFormat:@"Git提交日志：%@", [infoDic objectForKey:@"GitLog"]];

}

- (UILabel *)createLabelWithOffsetY:(CGFloat)offsetY {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, offsetY, self.view.bounds.size.width - 30 , 44)];
    label.textColor = [UIColor colorWithRed:arc4random()%256/255.0f green:arc4random()%256/255.0f  blue:arc4random()%256/255.0f alpha:1.0f];
    label.font = [UIFont systemFontOfSize:13];
    [self.view addSubview: label];
    return label;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
