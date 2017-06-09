//
//  ViewController.m
//  Bezier curve Practise
//
//  Created by Apple on 2017/6/9.
//  Copyright © 2017年 ganggang. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet CircleView *vc;

@end

@implementation ViewController
- (IBAction)changeValue:(UISlider *)sender {
    
    _vc.progress = sender.value;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //首次进入
    _vc.progress = 0.5;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
