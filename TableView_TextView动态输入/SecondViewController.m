//
//  SecondViewController.m
//  TableView_TextView动态输入
//
//  Created by mac on 2019/7/2.
//  Copyright © 2019年 okdeer. All rights reserved.
//

#import "SecondViewController.h"
#import "OKHeaderView.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGSize size = [UIScreen mainScreen].bounds.size;
    OKHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"OKHeaderView" owner:nil options:nil] lastObject];
    CGSize headerSize = [headerView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    NSLog(@"size:%@",NSStringFromCGSize(headerSize));
    [self.view addSubview:headerView];
    headerView.frame = CGRectMake(0, 100, size.width, headerSize.height);
    
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
