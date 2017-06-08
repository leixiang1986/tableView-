//
//  OKShopSetupContentCell.m
//  OkdeerSeller
//
//  Created by 雷祥 on 2017/5/9.
//  Copyright © 2017年 Okdeer. All rights reserved.
//

#import "OKShopSetupContentCell.h"

@interface OKShopSetupContentCell ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentLeftConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *arrowWidthConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;
@end

@implementation OKShopSetupContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}




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
    [tableView beginUpdates];
    [tableView endUpdates];
}


- (UITableView *)tableView
{
    UIView *tableView = self.superview;
    while (![tableView isKindOfClass:[UITableView class]] && tableView) {
        tableView = tableView.superview;
    }
    return (UITableView *)tableView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
