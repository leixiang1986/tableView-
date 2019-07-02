//
//  OKHeaderView.m
//  TableView_TextView动态输入
//
//  Created by mac on 2019/7/2.
//  Copyright © 2019年 okdeer. All rights reserved.
//

#import "OKHeaderView.h"

@implementation OKHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    self.textView.delegate = self;
    
}

/*
 修改tableViewHeaderView
 */
- (void)textViewDidChange:(UITextView *)textView {
    CGRect bounds = textView.bounds;
    // 计算 text view 的高度
    CGSize maxSize = CGSizeMake(bounds.size.width, CGFLOAT_MAX);
    CGSize newSize = [textView sizeThatFits:maxSize];
    
    NSLog(@"大小:%@",NSStringFromCGSize(newSize));
    bounds.size = CGSizeMake(bounds.size.width, newSize.height);
    textView.bounds = bounds;
    // 让 table view 重新计算高度
    UITableView *tableView = [self tableView];
#warning 最重要的一步，通过重新设置约束，可以实现自动适配高度
    self.textViewHeight.constant = newSize.height;
    UIView *headerView = tableView.tableHeaderView;
    CGSize headerSize = [headerView systemLayoutSizeFittingSize:UILayoutFittingExpandedSize];
    NSLog(@"高度是:%f",headerSize.height);
//    NSLog(@"size:%@",NSStringFromCGSize(newSize.height));
#warning 注意这里返回的高度是textView的高度加上固定高度,
    
    if (self.updateHeightBlock) {
        //方法一：通过返回指定高度也可以实现高度自动适配，但是对于复杂界面，40这个高度就比较难计算。
        self.updateHeightBlock(newSize.height + 40);
    }
}

- (UITableView *)tableView
{
    UIView *tableView = self.superview;
    while (![tableView isKindOfClass:[UITableView class]] && tableView) {
        tableView = tableView.superview;
    }
    return (UITableView *)tableView;
}


@end
