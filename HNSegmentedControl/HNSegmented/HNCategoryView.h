//
//  HNCategoryView.h
//  HNSegmentedControl
//
//  Created by 杭州国鑫信息科技 on 2020/12/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HNCategoryView : UIView

/** 标题数据源 */
@property (nonatomic, strong) NSArray *titleArray;
/** 文字非选中状态下的颜色 */
@property (nonatomic, strong) UIColor *normalColor;
/** 文字选中状态下的颜色 */
@property (nonatomic, strong) UIColor *selectedColor;
/** 指示器的颜色(默认文字选中颜色) */
@property (nonatomic, strong) UIColor *indicatorColor;
/** 指示器宽度(默认文字宽度) */
@property (nonatomic, assign) CGFloat indicatorW;
/** 将点击按钮的索引传过来(不传默认为0) */
@property (nonatomic, assign) NSInteger currentIndex;
/** 选中回调 */
@property (nonatomic, copy) void (^selectedItemHelper)(NSUInteger index);
/** 改变索引方法 */
- (void)changeItemWithTargetIndex:(NSUInteger)targetIndex;

@end

NS_ASSUME_NONNULL_END
