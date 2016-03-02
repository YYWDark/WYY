//
//  UIControl+LYDD.m
//  TestNStimew
//
//  Created by shao on 16/3/2.
//  Copyright © 2016年 yy. All rights reserved.
//

#import "UIButton+LYDD.h"

@implementation UIButton (LYDD)
- (void)startWithSettingTime:(uint64_t)settingTime
                buttonFrame : (CGRect)frame
                cornerRadius:(CGFloat)cornerRadius
                radiusColor : (UIColor *)radiusColor
   didCompletionedAnimation :(void(^)())completion{
    if (settingTime >10 || settingTime < 2) {//一般广告页面不会超过5秒 不会小于2秒
        settingTime = 5;
    }
    
    __block uint64_t interval = settingTime -1 ;
    //    / 创建layer并设置属性
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth =  2.0f;
    layer.lineCap = kCALineCapRound;
    layer.lineJoin = kCALineJoinRound;
    layer.strokeColor = radiusColor.CGColor;
    [self.layer addSublayer:layer];
    
    // 创建贝塞尔路径~
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:cornerRadius];
    
    // 关联layer和贝塞尔路径~
    layer.path = path.CGPath;
    
    // 创建Animation
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0.0);
    animation.toValue = @(1.0);
    layer.autoreverses = NO;
    animation.duration = interval;
    
    // 设置layer的animation
    [layer addAnimation:animation forKey:nil];
    
    layer.strokeEnd = 2;
    
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    if (_timer) {
        dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1* NSEC_PER_SEC, 0);
        dispatch_source_set_event_handler(_timer, ^{
            
            if (interval  == 0 ) {//主线程回调
                dispatch_async(dispatch_get_main_queue(), ^{
                 completion();
                    
                });
               
                dispatch_source_cancel(_timer);
            }else{
                
                interval--;
            }
        });
    }
    
    dispatch_resume(_timer);
    

}




@end
