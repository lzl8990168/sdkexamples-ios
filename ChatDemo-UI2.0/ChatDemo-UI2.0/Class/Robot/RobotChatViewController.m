//
//  RobotChatViewController.m
//  ChatDemo-UI2.0
//
//  Created by dujiepeng on 15/7/27.
//  Copyright (c) 2015年 dujiepeng. All rights reserved.
//

#import "RobotChatViewController.h"
#import "RobotManager.h"
#import "ChatSendHelper.h"
#import "EMRotbotChatViewCell.h"
#import "EMChatTimeCell.h"
@implementation RobotChatViewController

-(void)sendImageMessage:(UIImage *)image{
    NSDictionary *ext = nil;
    ext = @{kRobot_Message_Ext:[NSNumber numberWithBool:YES]};
    EMMessage *tempMessage = [ChatSendHelper sendImageMessageWithImage:image
                                                                    to:self.conversation.conversationId
                                                           messageType:[self messageType]
                                                            messageExt:ext];
    [self addMessage:tempMessage];
}

-(void)sendTextMessage:(NSString *)textMessage{
    NSDictionary *ext = nil;
    ext = @{kRobot_Message_Ext:[NSNumber numberWithBool:YES]};
    EMMessage *tempMessage = [ChatSendHelper sendTextMessage:textMessage
                                                          to:self.conversation.conversationId
                                                 messageType:[self messageType]
                                                  messageExt:ext];
    [self addMessage:tempMessage];
}

- (void)sendVoiceMessageWithLocalPath:(NSString *)localPath
                             duration:(NSInteger)duration
{
    NSDictionary *ext = nil;
    ext = @{kRobot_Message_Ext:[NSNumber numberWithBool:YES]};
    EMMessage *tempMessage = [ChatSendHelper sendVoiceMessageWithLocalPath:localPath
                                                                  duration:duration
                                                                        to:self.conversation.conversationId
                                                               messageType:[self messageType] messageExt:ext];
    
    [self addMessage:tempMessage];
}

-(void)sendLocationLatitude:(double)latitude
                  longitude:(double)longitude
                 andAddress:(NSString *)address{
    NSDictionary *ext = nil;
    ext = @{kRobot_Message_Ext:[NSNumber numberWithBool:YES]};
    EMMessage *locationMessage = [ChatSendHelper sendLocationMessageWithLatitude:latitude
                                                                       longitude:longitude
                                                                         address:address
                                                                              to:self.conversation.conversationId
                                                                     messageType:[self messageType] messageExt:ext];

    [self addMessage:locationMessage];
}

- (void)sendVideoMessageWithURL:(NSURL *)url
{
    NSDictionary *ext = nil;
    ext = @{kRobot_Message_Ext:[NSNumber numberWithBool:YES]};
    EMMessage *tempMessage = [ChatSendHelper sendVideoMessageWithURL:url to:self.conversation.conversationId messageType:[self messageType] messageExt:ext];
    
    [self addMessage:tempMessage];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < [self.dataSource count]) {
        id obj = [self.dataSource objectAtIndex:indexPath.row];
        if ([obj isKindOfClass:[NSString class]]) {
            EMChatTimeCell *timeCell = (EMChatTimeCell *)[tableView dequeueReusableCellWithIdentifier:@"MessageCellTime"];
            if (timeCell == nil) {
                timeCell = [[EMChatTimeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MessageCellTime"];
                timeCell.backgroundColor = [UIColor clearColor];
                timeCell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            timeCell.textLabel.text = (NSString *)obj;
            
            return timeCell;
        }
        else{
            MessageModel *model = (MessageModel *)obj;
            NSString *cellIdentifier = [EMRotbotChatViewCell cellIdentifierForMessageModel:model];
            EMRotbotChatViewCell *cell = (EMRotbotChatViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (cell == nil) {
                cell = [[EMRotbotChatViewCell alloc] initWithMessageModel:model reuseIdentifier:cellIdentifier];
                cell.backgroundColor = [UIColor clearColor];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            cell.messageModel = model;
            
            return cell;
        }
    }
    
    return nil;
}
@end
