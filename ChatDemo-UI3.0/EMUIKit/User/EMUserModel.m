//
//  EMUserModel.m
//  ChatDemo-UI3.0
//
//  Created by dhc on 15/6/24.
//  Copyright (c) 2015年 easemob.com. All rights reserved.
//

#import "EMUserModel.h"

#import "EMBuddy.h"

@implementation EMUserModel

- (instancetype)initWithBuddy:(EMBuddy *)buddy
{
    self = [super init];
    if (self) {
        _buddy = buddy;
        _nickname = _buddy.username;
        _avatarImage = [UIImage imageNamed:@"user"];
    }
    
    return self;
}

@end
