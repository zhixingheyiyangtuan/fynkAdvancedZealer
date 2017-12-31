//
//  SubmitDetailInfoViewController.m
//  Zealer2
//
//  Created by 菲亚诺克 on 2017/12/24.
//  Copyright © 2017年 菲亚诺克. All rights reserved.
//

#import "SubmitDetailInfoViewController.h"
#import "ApplyInfoView.h"
#import "HylbTableViewCell.h"
#import "UIImagePickerController+ST.h"
#import "SubmitApplyViewController.h"

#define CellH 44

@interface SubmitDetailInfoViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate, UIImagePickerControllerDelegate,UIActionSheetDelegate>{
    int _selectRow;
}
@property (nonatomic,strong) UIScrollView  *mainScrollView;
@property (nonatomic,strong) ApplyInfoView *infoView;

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray  *dataArray;
@property (nonatomic,strong) UIView   *bgView;
@end

@implementation SubmitDetailInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(submitApplyInfo:) name:@"submitApplyInfo" object:nil];
    
    self.dataArray = @[@"IT业",@"制造业",@"农林牧渔业",@"建筑业"];
    _selectRow = -1;
    self.mainScrollView = [[UIScrollView alloc]init];
    self.mainScrollView.frame = self.view.bounds;
    [self.view addSubview:self.mainScrollView];
    self.mainScrollView.contentSize = CGSizeMake(Main_Screen_Width, 1050);
    
    [self addApplyInfoView];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
// 添加初始化页面
- (void)addApplyInfoView {
    self.infoView = [[NSBundle mainBundle] loadNibNamed:@"ApplyInfoView" owner:self options:nil].firstObject;
    self.infoView.frame = CGRectMake(0, 0, Main_Screen_Width, 1050);
    [self.mainScrollView addSubview:self.infoView];
    [self.infoView initView];
    
    UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(choosehxlb)];
    [self.infoView.hylbView addGestureRecognizer:ges];
    
    [self.infoView.yzmButton addTarget:self action:@selector(yzmButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.infoView.yyzzButton addTarget:self action:@selector(chooseYyzzImage) forControlEvents:UIControlEventTouchUpInside];
    [self.infoView.yyzzDelButton addTarget:self action:@selector(deleteYyzzImage) forControlEvents:UIControlEventTouchUpInside];
}

// 选择行业类别
- (void)choosehxlb {
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
        titleLabel.text = @"行业类别";
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
- (void)hiddenBgView {
    self.bgView.hidden = YES;
}
// 验证码按钮点击
- (void)yzmButtonClicked {
    
}
// 选择营业执照图片
- (void)chooseYyzzImage {
    UIAlertController *alertController = [[UIAlertController alloc]init];
    
    UIAlertAction *action0 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *controller = [UIImagePickerController imagePickerControllerWithSourceType:UIImagePickerControllerSourceTypeCamera];
        
        if ([controller isAvailableCamera] && [controller isSupportTakingPhotos]) {
            [controller setDelegate:self];
            [self presentViewController:controller animated:YES completion:nil];
        }else {
            NSLog(@"%s %@", __FUNCTION__, @"相机权限受限");
        }
    }];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"从相册获取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *controller = [UIImagePickerController imagePickerControllerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [controller setDelegate:self];
        if ([controller isAvailablePhotoLibrary]) {
            [self presentViewController:controller animated:YES completion:nil];
        }    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [alertController addAction:action0];
    [alertController addAction:action1];
    [alertController addAction:action2];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

// 删除营业执照图片
- (void)deleteYyzzImage {
    self.infoView.yyzzDelButton.hidden = YES;
    self.infoView.uploadImageLabel.hidden = NO;
    self.infoView.yyzzButton.hidden = NO;
    self.infoView.yyzzImageview.hidden = YES;
}
#pragma mark - 通知方法
- (void)submitApplyInfo:(NSNotification *)noti{
    NSLog(@"%@",noti);
    
    SubmitApplyViewController *applyVC = [[SubmitApplyViewController alloc]init];
    [self.navigationController pushViewController:applyVC animated:YES];
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
        self.infoView.hylb = self.dataArray[indexPath.row];
        [self.tableView reloadData];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CellH;
}

#pragma mark - 2.UIImagePickerController的委托

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        NSLog(@"%@",[NSThread currentThread]);
        UIImage *imageOriginal = [info objectForKey:UIImagePickerControllerOriginalImage];
        self.infoView.yyzzImageview.image = imageOriginal;
        self.infoView.yyzzImageview.hidden = NO;
        self.infoView.yyzzButton.hidden = YES;
        self.infoView.uploadImageLabel.hidden = YES;
        self.infoView.yyzzDelButton.hidden = NO;
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^(){
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
