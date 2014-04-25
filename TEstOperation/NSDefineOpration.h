//
//  NSDefineOpration.h
//  TestOperation
//
//  Created by jianzhongliu on 4/25/14.
//  Copyright (c) 2014 anjuke. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol NSDefineOprationDelegate <NSObject>

- (void) handleDelegate;

@end

@interface NSDefineOpration : NSOperation

@property (nonatomic, assign) id <NSDefineOprationDelegate> delegate;

- (id)initWithDelegate:(id<NSDefineOprationDelegate>) delegate;

@end
