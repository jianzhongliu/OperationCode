//
//  SSViewController.m
//  SSOperationsExample
//
//  Created by Jonathan Hersh on 8/30/13.
//  Copyright (c) 2013 Splinesoft. All rights reserved.
//

#import "SSViewController.h"
#import "NSDefineOpration.h"

@interface SSViewController ()

@end

@implementation SSViewController {

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];

    [self forthOperationForInvocationOperation];
}

- (void)firstOperationForOperationBlock {
    NSLog(@"block start");
    NSOperationQueue *myQueue = [[NSOperationQueue alloc] init];
    myQueue.maxConcurrentOperationCount = 2;
    int i ;
    for (i = 0; i<20; i++) {
        NSBlockOperation *bop2 = [NSBlockOperation blockOperationWithBlock:^{
            sleep(2);
            NSLog(@"bop2.....handle..... on thread num%@",[NSThread currentThread]);
        }];
        [bop2 setCompletionBlock:^{
            NSLog(@"bop2........OK !!");
        }];
        //    [bop2 start];
        [myQueue addOperation:bop2];
    }
//    [myQueue cancelAllOperations];
}

//NSOperation不建议直接使用，需要继承自他然后重写方法在使用
- (void)secondOperationForOperation {
    NSDefineOpration *op1 = [[NSDefineOpration alloc] initWithDelegate:self];
    op1.completionBlock = ^(){
        NSLog(@"op1........OK !!");
    };
    [op1 start];
}

#pragma mark -- delegate
- (void) handleDelegate {

}

- (void)thirdOperationForOperationBlock {
    NSLog(@"block start");
    NSBlockOperation * op2 = [[NSBlockOperation alloc] init];
    [op2 addExecutionBlock:^{
        sleep(10);
        NSLog(@"op2.....handle..... on 10 hread num%@",[NSThread currentThread]);
    }];
    
    [op2 addExecutionBlock:^{
        sleep(6);
        NSLog(@"op2.....handle..... on 6 thread num%@",[NSThread currentThread]);
    }];
    
    [op2 addExecutionBlock:^{
        sleep(4);
        NSLog(@"op2.....handle..... on 4 thread num%@",[NSThread currentThread]);
    }];
    
    [op2 addExecutionBlock:^{
        sleep(8);
        NSLog(@"op2.....handle..... on 8 thread num%@",[NSThread currentThread]);
    }];

    [op2 addExecutionBlock:^{
        sleep(1);
        NSLog(@"op2.....handle..... on 1 thread num%@",[NSThread currentThread]);
    }];
    [op2 setCompletionBlock:^{
        NSLog(@"op2........OK !!%@",[NSThread currentThread]);
    }];
    [op2 start];
    
    //bop2
    NSBlockOperation *bop2 = [NSBlockOperation blockOperationWithBlock:^{
        sleep(15);
        NSLog(@"bop2.....handle..... on thread num%@",[NSThread currentThread]);
    }];
    [bop2 setCompletionBlock:^{
        NSLog(@"bop2........OK !!");
    }];
    [bop2 start];
    
//观察，为什么会有不同的block里面跑着同一个线程
    
}

- (void)forthOperationForInvocationOperation{
    NSInvocationOperation * op3 = [[NSInvocationOperation alloc] initWithTarget:(id)self selector:@selector(handleInvoOpDelegate) object:nil];
    [op3 setCompletionBlock:^{
        NSLog(@"op3........OK !!");
    }];
    [op3 start];
}

- (void)handleInvoOpDelegate {
    sleep(5);
    NSLog(@"op3.....handle.....  on thread num :%@",[NSThread currentThread]);
}

@end
