//
//  Subject.m
//  RACDemo
//
//  Created by honglianglu on 2/14/16.
//  Copyright © 2016 decsunshine. All rights reserved.
//

#import "Subject.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation Subject

- (void)main
{
    
}

- (void)subscribeOpportunity
{
    // reference:http://tech.meituan.com/talk-about-reactivecocoas-cold-signal-and-hot-signal-part-3.html
    RACSignal *coldSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"Cold signal be subscribed.");
        [[RACScheduler mainThreadScheduler] afterDelay:1.5 schedule:^{
            [subscriber sendNext:@"A"];
        }];
        
        [[RACScheduler mainThreadScheduler] afterDelay:3 schedule:^{
            [subscriber sendNext:@"B"];
        }];
        
        [[RACScheduler mainThreadScheduler] afterDelay:5 schedule:^{
            [subscriber sendCompleted];
        }];
        
        return nil;
    }];
    
    RACSubject *subject = [RACSubject subject];
    NSLog(@"Subject created.");
    
    [[RACScheduler mainThreadScheduler] afterDelay:2 schedule:^{
        [coldSignal subscribe:subject];
    }];
    
    [subject subscribeNext:^(id x) {
        NSLog(@"Subscriber 1 recieve value:%@.", x);
    }];
    
    [[RACScheduler mainThreadScheduler] afterDelay:4 schedule:^{
        [subject subscribeNext:^(id x) {
            NSLog(@"Subscriber 2 recieve value:%@.", x);
        }];
    }];
}

@end
