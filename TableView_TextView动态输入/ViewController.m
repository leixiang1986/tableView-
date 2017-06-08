//
//  ViewController.m
//  TableView_TextView动态输入
//
//  Created by 雷祥 on 2017/5/11.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "ViewController.h"
#import "OKShopSetupContentCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];


    [self.view addSubview:self.tableView];
}

- (void)keyboardWillShow:(NSNotification *)notify {
    CGFloat keyboardHeight = [self getKeyBoardHeight:notify];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, keyboardHeight, 0);
}


- (void)keyboardWillHide:(NSNotification *)notify {
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0,0, 0);
}

- (CGFloat)getKeyBoardHeight:(NSNotification *)notify {
    if (!notify) {
        return 0.0;
    }
    NSDictionary *info = [notify userInfo];
    NSValue *value = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize = [value CGRectValue].size;
    return keyboardSize.height ;
}



- (UITableView *)tableView {
    if (!_tableView) {
        CGSize size = [UIScreen mainScreen].bounds.size;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height) style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        [_tableView registerNib:[UINib nibWithNibName:@"OKShopSetupContentCell" bundle:nil] forCellReuseIdentifier:@"contentCellId"];
        _tableView.estimatedRowHeight = 60;
        _tableView.rowHeight = UITableViewAutomaticDimension;
    }

    return _tableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"contentCellId";
    OKShopSetupContentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];


    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.view endEditing:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
