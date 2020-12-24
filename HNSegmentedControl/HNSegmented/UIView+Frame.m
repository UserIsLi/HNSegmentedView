//
//  UIView+Frame.m
//  HNSegmentedControl
//
//  Created by 杭州国鑫信息科技 on 2020/12/23.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
- (CGFloat)centerY
{
     return self.center.y;
}

- (void)setCenterY:(CGFloat)centetY
{
    CGPoint center = self.center;
    center.y = centetY;
    self.center = center;
}
- (CGFloat)centerX
{
    return self.center.x;
}
- (void)setCenterX:(CGFloat)centetX
{
    CGPoint center = self.center;
    center.x = centetX;
    self.center = center;
}
- (CGSize)size
{
    return self.frame.size;
}
- (void)setSize: (CGSize) aSize
{
    CGRect newframe = self.frame;
    newframe.size = aSize;
    self.frame = newframe;
}
- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

- (CGFloat)width
{
     return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x
{
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y
{
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right
{
    CGFloat delta = right - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setBottom:(CGFloat)bottom
{
    CGRect rect = self.frame;
    rect.origin.y = bottom - self.frame.size.height;
    self.frame = rect;
}
@end
