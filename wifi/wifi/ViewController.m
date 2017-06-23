//
//  ViewController.m
//  wifi
//
//  Created by apple on 16/12/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "MYView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    MYView * view = [[MYView alloc] init];
    [self.view addSubview:view];
    view.frame = CGRectMake(50, 50, 150, 150);
    view.backgroundColor = [UIColor clearColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
