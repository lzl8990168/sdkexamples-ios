//
//  ChatViewController.h
//  ChatDemo-UI2.0
//
//  Created by dujiepeng on 14-5-23.
//  Copyright (c) 2014年 dujiepeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatViewController : UIViewController

- (void)refreshData;
- (void)addChatData:(NSObject *)chatdata;
- (void)addChatDatas:(NSArray *)chatdatas;

@end
