//
//  HNCategoryView.m
//  HNSegmentedControl
//
//  Created by 杭州国鑫信息科技 on 2020/12/23.
//

#import "HNCategoryView.h"
#import "UIView+Frame.h"

@interface HNCategoryView ()
/** 当前选中的按钮 */
@property (nonatomic, strong) UIButton *selectedBtn;
/** 按钮数组 */
@property (nonatomic, strong) NSMutableArray *btnsArray;
/** 指示器 */
@property (nonatomic, strong) UIView *indicatorView;
/** 分割线 */
@property (nonatomic, strong) UIView *separator;

@end

@implementation HNCategoryView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
#pragma mark - Private Method（私有方法）
- (void)setup
{
    _normalColor = [UIColor blackColor];
    _selectedColor = [UIColor redColor];
    [self addSubview:self.indicatorView];
    [self addSubview:self.separator];
}
#pragma mark - setter方法
// 指示器宽度
- (void)setIndicatorW:(CGFloat)indicatorW
{
    _indicatorW = indicatorW;
    self.indicatorView.width = indicatorW;
}
// 指示器颜色
- (void)setIndicatorColor:(UIColor *)indicatorColor
{
    _indicatorColor = indicatorColor;
    self.indicatorView.backgroundColor = indicatorColor;
}
// 文字正常颜色
- (void)setNormalColor:(UIColor *)normalColor
{
    _normalColor = normalColor;
    for (int i = 0; i < self.btnsArray.count; i++) {
        UIButton *button = [self.btnsArray objectAtIndex:i];
        [button setTitleColor:normalColor forState:UIControlStateNormal];
    }
}
// 文字选中颜色
- (void)setSelectedColor:(UIColor *)selectedColor
{
    _selectedColor = selectedColor;
    for (int i = 0; i < self.btnsArray.count; i++) {
        UIButton *button = [self.btnsArray objectAtIndex:i];
        [button setTitleColor:selectedColor forState:UIControlStateDisabled];
    }
}
- (void)setTitleArray:(NSArray *)titleArray
{
    _titleArray = titleArray;
    for (NSUInteger i = 0; i < titleArray.count; i++) {
        UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        titleBtn.tag = i;
        [titleBtn setTitle:titleArray[i] forState:UIControlStateNormal];
        [titleBtn setTitleColor:self.normalColor  forState:UIControlStateNormal];
        [titleBtn setTitleColor:self.selectedColor forState:UIControlStateDisabled];
        [titleBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:titleBtn];
        
        [self.btnsArray addObject:titleBtn];
        
        if (i == self.currentIndex) {
            titleBtn.enabled = NO;
            self.selectedBtn = titleBtn;
        }
    }
}
#pragma mark - Event Method（事件方法）
- (void)btnClick:(UIButton *)button
{
    self.currentIndex = button.tag;
    [self changeItemWithTargetIndex:button.tag];
}
#pragma mark - Public Method
// 改变索引方法
- (void)changeItemWithTargetIndex:(NSUInteger)targetIndex
{
    UIButton *button = [self.btnsArray objectAtIndex:targetIndex];
    self.selectedBtn.enabled = YES;
    button.enabled = NO;
    self.selectedBtn = button;
    
    [UIView animateWithDuration:0.25 animations:^{
        if (self.indicatorW == 0.0) {
            [button.titleLabel sizeToFit];
            self.indicatorView.width = button.titleLabel.width;
        }
        self.indicatorView.centerX = button.centerX;
    }];
    if (self.selectedItemHelper) {
        self.selectedItemHelper(button.tag);
    }
}
#pragma mark - init UI
- (NSMutableArray *)btnsArray
{
    if (!_btnsArray) {
        _btnsArray = [NSMutableArray array];
    }
    return _btnsArray;
}
- (UIView *)indicatorView
{
    if (!_indicatorView) {
        _indicatorView = [[UIView alloc] init];
        _indicatorView.height = 2;
        _indicatorView.backgroundColor = self.selectedColor;
    }
    return _indicatorView;
}
- (UIView *)separator
{
    if (!_separator) {
        _separator = [[UIView alloc] init];
        _separator.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.4];
    }
    return _separator;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.width;
    CGFloat height = self.height;
    
    CGFloat btnW = width/self.titleArray.count;
    
    self.separator.frame = CGRectMake(0, height - 0.5, width, 0.5);
    
    for (NSUInteger i = 0; i < self.titleArray.count; i++) {
        
        UIButton *btn = [self.btnsArray objectAtIndex:i];
        btn.frame = CGRectMake(i * btnW, 0, btnW, height);
        if (i == self.currentIndex) {
            // 让按钮内部的label根据文字内容来计算尺寸
            if (self.indicatorW == 0.0) {
                [btn.titleLabel sizeToFit];
                self.indicatorView.width = btn.titleLabel.width;
            }
            self.indicatorView.centerX = btn.centerX;
        }
    }
    self.indicatorView.y = self.separator.y - 1 - self.indicatorView.height;
}

@end
