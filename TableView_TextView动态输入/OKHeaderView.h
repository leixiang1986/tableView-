//
//  OKHeaderView.h
//  TableView_TextView动态输入
//
//  Created by mac on 2019/7/2.
//  Copyright © 2019年 okdeer. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OKHeaderView : UIView<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewHeight;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (copy, nonatomic) void (^updateHeightBlock)(CGFloat height);
@end

NS_ASSUME_NONNULL_END
