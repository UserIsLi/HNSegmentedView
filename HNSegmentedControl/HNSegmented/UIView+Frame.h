//
//  UIView+Frame.h
//  HNSegmentedControl
//
//  Created by 杭州国鑫信息科技 on 2020/12/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Frame)

@property CGSize size;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@end

NS_ASSUME_NONNULL_END
