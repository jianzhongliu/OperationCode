//
//  NSDefineOpration.m
//  TestOperation
//
//  Created by jianzhongliu on 4/25/14.
//  Copyright (c) 2014 anjuke. All rights reserved.
//

#import "NSDefineOpration.h"

@implementation NSDefineOpration

- (id)initWithDelegate:(id<NSDefineOprationDelegate>) delegate
{
    if(self = [super init])
    {
        self.delegate = delegate;
    }
    return self;
}

- (void)main
{
    @autoreleasepool {
        //do something
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            sleep(15);
            NSLog(@"op1........handle......  on thread num :%@",[NSThread currentThread]);
            
            if([self.delegate respondsToSelector:@selector(handleDelegate)])
            {
                [self.delegate performSelector:@selector(handleDelegate) withObject:nil];
            }
        });
    }
}


@end
