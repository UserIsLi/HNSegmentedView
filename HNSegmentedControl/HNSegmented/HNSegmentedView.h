//
//  HNSegmentedView.h
//  HNSegmentedControl
//
//  Created by 杭州国鑫信息科技 on 2020/10/30.
//

#import <UIKit/UIKit.h>
@class HNSegmentedView;

NS_ASSUME_NONNULL_BEGIN
// 声明数据源协议
@protocol HNSegmentedViewDataSource <NSObject>

@required
- (NSArray *)itemsViewWithSetupChildVc;
@end

@interface HNSegmentedView : UIView
/**初始化类方法*/
+ (instancetype)menuView;
/** 标题数据源 */
@property (nonatomic, strong) NSArray *titleArray;
/**数据源*/
@property (nonatomic, assign) id <HNSegmentedViewDataSource> dataSource;

@end

NS_ASSUME_NONNULL_END
