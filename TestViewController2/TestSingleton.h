//
//  TestSingleton.h
//  TestViewController2
//
//  Created by Alexander on 13.11.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestSingleton : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong) NSString *someString;

@end
