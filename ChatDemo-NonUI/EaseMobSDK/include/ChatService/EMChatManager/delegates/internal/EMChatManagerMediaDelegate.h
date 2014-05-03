/*!
 @header EMChatManagerMediaDelegate.h
 @abstract 关于ChatManager中媒体相关功能的异步回调
 @author Ji Fang
 @version 1.00 2014/01/01 Creation (1.00)
 */

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import "EMChatManagerDelegateBase.h"

@class EMChatVoice;

/*!
 @protocol
 @abstract 本协议包括：播放声音时的回调、录制时的回调、取消录制时的回调等
 @discussion
 */
@protocol EMChatManagerMediaDelegate <EMChatManagerDelegateBase>

@optional

/*!
 @method
 @abstract 播放完系统声音时的回调
 @discussion
 @param soundId      iOS内部声音文件ID
 @result
 */
- (void)didPlaySystemSound:(SystemSoundID)soundId;

/*!
 @method
 @abstract 播放完声音对象时的回调
 @discussion
 @param aChatVoice 声音对象
 @param error 错误信息
 @result
 */
- (void)didPlayAudio:(EMChatVoice *)aChatVoice error:(EMError *)error;

/*!
 @method
 @abstract 录制声音完成后的回调
 @discussion
 @param aChatVoice 录制完的音频对象
 @param error 错误信息
 @result
 */
- (void)didRecordAudio:(EMChatVoice *)aChatVoice error:(EMError *)error;

/*!
 @method
 @abstract 取消录音后的回调
 @discussion
 @param aChatVoice 录制完的音频对象
 @param error 错误信息
 @result
 */
- (void)didCancelRecordAudio:(EMChatVoice *)aChatVoice error:(EMError *)error;

@end
