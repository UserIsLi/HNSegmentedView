//
//  ViewController.m
//  HNSegmentedControl
//
//  Created by 杭州国鑫信息科技 on 2020/10/30.
//

#import "ViewController.h"
#import "HNSegmentedView.h"
#import "HNSegmentedPageController.h"

@interface ViewController ()<HNSegmentedViewDataSource>

@property (nonatomic, strong) HNSegmentedView *menuView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeBottom;
    self.view.backgroundColor = [UIColor whiteColor];
    self.menuView.titleArray = @[@"华盛顿", @"夏威夷", @"拉斯维加斯"];
}
- (NSArray *)itemsViewWithSetupChildVc
{
    NSArray *titles = @[@"华盛顿", @"夏威夷", @"拉斯维加斯"];
    for (int i = 0; i < titles.count; i++) {
        HNSegmentedPageController *controller = [[HNSegmentedPageController alloc] init];
        [self addChildViewController:controller];
    }
    return self.childViewControllers;
}
- (HNSegmentedView *)menuView
{
    if (!_menuView) {
        _menuView = [HNSegmentedView menuView];
        _menuView.frame = self.view.bounds;
        _menuView.dataSource = self;
        [self.view addSubview:_menuView];
    }
    return _menuView;
}

@end
