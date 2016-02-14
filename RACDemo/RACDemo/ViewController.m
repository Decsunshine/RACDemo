//
//  ViewController.m
//  RACDemo
//
//  Created by honglianglu on 2/14/16.
//  Copyright © 2016 decsunshine. All rights reserved.
//

#import "ViewController.h"
#import "Subject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    Subject *subject = [Subject new];
    [subject main];
}

@end
