//
//  ViewController.m
//  SageNavigation
//
//  Created by heke on 27/1/16.
//  Copyright © 2016年 mhk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 80, 80, 30);
    [self.view addSubview:button];
    button.backgroundColor = [UIColor grayColor];
    [button addTarget:self action:@selector(doPush:) forControlEvents:UIControlEventTouchUpInside];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)doPush:(id)sender {
    ViewController *vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
