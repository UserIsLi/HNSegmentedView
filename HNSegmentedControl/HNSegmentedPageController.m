//
//  HNSegmentedPageController.m
//  HNSegmentedControl
//
//  Created by 杭州国鑫信息科技 on 2020/10/30.
//

#import "HNSegmentedPageController.h"

@interface HNSegmentedPageController ()

@end

@implementation HNSegmentedPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    int R = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;
    self.view.backgroundColor = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
