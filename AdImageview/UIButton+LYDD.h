//
//  UIControl+LYDD.h
//  TestNStimew
//
//  Created by shao on 16/3/2.
//  Copyright © 2016年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LYDD)
- (void)startWithSettingTime:(uint64_t)settingTime
                buttonFrame : (CGRect)frame
                cornerRadius:(CGFloat)cornerRadius
                radiusColor : (UIColor *)radiusColor
   didCompletionedAnimation :(void(^)())completion;
@end
