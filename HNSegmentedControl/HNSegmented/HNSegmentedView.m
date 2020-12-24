//
//  HNSegmentedView.m
//  HNSegmentedControl
//
//  Created by 杭州国鑫信息科技 on 2020/10/30.
//

#import "HNSegmentedView.h"
#import "HNCategoryView.h"
#import "UIView+Frame.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width //屏幕宽度

@interface HNSegmentedView ()<UIScrollViewDelegate>

/** 标题view  */
@property (nonatomic, strong) HNCategoryView *titleView;
/** 内容的scrollView */
@property (nonatomic, strong) UIScrollView *contentView;
/** 所有子控制器 */
@property (nonatomic, strong) NSArray *childVcs;

@end

@implementation HNSegmentedView

+ (instancetype)menuView
{
    return [[self alloc] init];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        __weak typeof(self) weakSelf = self;
        [self.titleView setSelectedItemHelper:^(NSUInteger index) {
            //发出通知改变按钮选中状态
            [weakSelf.contentView setContentOffset:CGPointMake(index * self.contentView.width, 0) animated:NO];
            [weakSelf scrollViewDidEndScrollingAnimation:weakSelf.contentView];
        }];
    }
    return self;
}
#pragma mark - setter
- (void)setTitleArray:(NSArray *)titleArray
{
    _titleArray = titleArray;
    self.titleView.titleArray = titleArray;
    //调用dataSource
    if (_dataSource && [_dataSource respondsToSelector:@selector(itemsViewWithSetupChildVc)]) {
        self.childVcs = [_dataSource itemsViewWithSetupChildVc];
    }
    self.contentView.contentSize = CGSizeMake(titleArray.count * ScreenWidth, 0);
    [self scrollViewDidEndScrollingAnimation:self.contentView];
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    
    NSInteger index = offsetX / ScreenWidth;
    
    UIViewController *vc = self.childVcs[index];
    // 如果当前位置的view已经显示过了，就直接返回
    if ([vc isViewLoaded]) return;
    
    vc.view.frame = CGRectMake(offsetX, 0, scrollView.width, scrollView.height);
    
    [scrollView addSubview:vc.view];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 点击按钮
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    [self.titleView changeItemWithTargetIndex:index];
}
#pragma mark - <初始化控件>
- (HNCategoryView *)titleView
{
    if (_titleView == nil) {
        _titleView = [[HNCategoryView alloc] init];
        [self addSubview:_titleView];
    }
    return _titleView;
}

- (UIScrollView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIScrollView alloc] init];
        _contentView.delegate = self;
        _contentView.pagingEnabled = YES;
        _contentView.showsVerticalScrollIndicator = NO;
        _contentView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_contentView];
    }
    return _contentView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    self.titleView.width = ScreenWidth;
    self.titleView.height = 35;
    
    self.contentView.y = self.titleView.height;
    self.contentView.width = ScreenWidth;
    self.contentView.height = self.height - self.contentView.y;
    
}

@end
