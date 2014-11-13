//
//  TestSingleton.m
//  TestViewController2
//
//  Created by Alexander on 13.11.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "TestSingleton.h"


@implementation TestSingleton

+ (TestSingleton *)sharedInstance
{
    SEL selector = @selector(sharedInstance);
    NSObject *obj;
    [obj performSelector:selector];
    
    
    static TestSingleton *_test = nil;
    @synchronized(self) {
        if (!_test) {
            _test = [TestSingleton new];
        }
    }
    return _test;
}


@end
