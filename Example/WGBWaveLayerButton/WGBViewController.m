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
    waveButton.frame = CGRectMake(0, 0, 300, 300);
    waveButton.center = CGPointMake(screenBounds.size.width/2.0, screenBounds.size.height/2.0);
    waveButton.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];;
    waveButton.waveLayerColor = [UIColor orangeColor];
    [waveButton setTitle:@"Click Me" forState:UIControlStateNormal];
    [self.view addSubview:waveButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
