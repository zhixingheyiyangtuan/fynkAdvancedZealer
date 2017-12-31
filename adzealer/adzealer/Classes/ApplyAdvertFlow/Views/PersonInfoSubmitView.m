//
//  PersonInfoSubmitView.m
//  Zealer2
//
//  Created by 菲亚诺克 on 2017/12/28.
//  Copyright © 2017年 菲亚诺克. All rights reserved.
//

#import "PersonInfoSubmitView.h"
#import "HylbTableViewCell.h"

#define CellH 44

@interface PersonInfoSubmitView ()<UITableViewDelegate,UITableViewDataSource>{
    int _selectRow;
}
@property (weak, nonatomic) IBOutlet UIView *llrView;
@property (weak, nonatomic) IBOutlet UITextField *llrTextField;
@property (weak, nonatomic) IBOutlet UIView *sjhView;
@property (weak, nonatomic) IBOutlet UITextField *sjhTextField;
@property (weak, nonatomic) IBOutlet UIView *yzmView;
@property (weak, nonatomic) IBOutlet UITextField *yzmTextField;
@property (weak, nonatomic) IBOutlet UIView *wxhView;
@property (weak, nonatomic) IBOutlet UITextField *wxhTextField;
@property (weak, nonatomic) IBOutlet UIView *llzmcView;
@property (weak, nonatomic) IBOutlet UITextField *llzmcTextField;

@property (weak, nonatomic) IBOutlet UIView *jmlxView;
@property (weak, nonatomic) IBOutlet UILabel *jmlxLabel;
@property (weak, nonatomic) IBOutlet UIView *jmjjView;
@property (weak, nonatomic) IBOutlet UITextView *jmjjTextView;
@property (weak, nonatomic) IBOutlet UILabel *jmjjPlaceLabel;
@property (weak, nonatomic) IBOutlet UIButton *agreeButton;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;


@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation PersonInfoSubmitView
- (void)initView {
    [self addBorder:_llrView];
    [self addBorder:_sjhView];
    [self addBorder:_yzmView];
    [self addBorder:_wxhView];
    [self addBorder:_llzmcView];
    [self addBorder:_jmlxView];
    [self addBorder:_jmjjView];
    
    self.dataArray = @[@"视频",@"微信",@"微博",@"微信小程序",@"官广"];
    
    UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseType)];
    [self.jmlxView addGestureRecognizer:ges];
}
- (void)addBorder:(UIView *)sender {
    sender.layer.cornerRadius = 4;
    sender.layer.masksToBounds = YES;
    sender.layer.borderWidth = 1;
    sender.layer.borderColor =  [UIColor colorWithHexString:@"0x999999"].CGColor;
}

- (IBAction)agreeButtonClicked:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (IBAction)submitButtonClicked:(UIButton *)sender {
    
}

- (void)chooseType {
    if (self.bgView) {
        self.bgView.hidden = NO;
    }else{
        self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height)];
        self.bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        [[UIApplication sharedApplication].keyWindow addSubview:self.bgView];
        //        UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenBgView)];
        //        [self.bgView addGestureRecognizer:ges];
        
        UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 240, 440)];
        contentView.center = self.bgView.center;
        [self.bgView addSubview:contentView];
        contentView.layer.cornerRadius = 4;
        contentView.layer.masksToBounds = YES;
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, contentView.bounds.size.width, 60)];
        [contentView addSubview:titleLabel];
        titleLabel.backgroundColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = @"节目类型";
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.font = [UIFont systemFontOfSize:16];
        
        UIView *line  = [[UIView alloc] initWithFrame:CGRectMake(0, 60, 240, 1)];
        line.backgroundColor = [UIColor lightGrayColor];
        [contentView addSubview:line];
        
        self.tableView = [[UITableView alloc]init];
        CGFloat height = self.dataArray.count*CellH>379?379:self.dataArray.count*CellH;
        self.tableView.frame = CGRectMake(0, 61, 240 , height);
        [contentView addSubview:self.tableView];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView registerNib:[UINib nibWithNibName:@"HylbTableViewCell" bundle:nil] forCellReuseIdentifier:@"HylbCell"];
    }
}

#pragma mark - 行业类别tableview代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HylbTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HylbCell" forIndexPath:indexPath];
    cell.nameLabel.text = self.dataArray[indexPath.row];
    cell.selectButton.selected = NO;
    if (indexPath.row == _selectRow) {
        cell.selectButton.selected = YES;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    self.bgView.hidden = YES;
    if (_selectRow == indexPath.row) {
        self.bgView.hidden = YES;
    }else{
        _selectRow = (int)indexPath.row;
        self.jmlxLabel.text = self.dataArray[indexPath.row];
        [self.tableView reloadData];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CellH;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
