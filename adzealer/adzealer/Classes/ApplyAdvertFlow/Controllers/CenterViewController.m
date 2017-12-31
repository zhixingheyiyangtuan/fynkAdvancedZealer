//
//  CenterViewController.m
//  Zealer2
//
//  Created by 菲亚诺克 on 2017/12/27.
//  Copyright © 2017年 菲亚诺克. All rights reserved.
//

#import "CenterViewController.h"
#import "CenterModelView.h"
#import "SubmitDetailInfoViewController.h"
#import "CenterModelView.h"
#import "LlzTypeView.h"

@interface CenterViewController ()
@property (nonatomic,strong) CenterModelView  *ggzView;
@property (nonatomic,strong) CenterModelView  *llzView;

@property (nonatomic,strong) UIScrollView   *mainScrollView;
@property (nonatomic,strong) UIView         *bgView;
@property (nonatomic,strong) LlzTypeView    *typeView;
@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"0xe9ecee"];
    [self initView];
}
- (void)initView {
    self.mainScrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.mainScrollView];
    self.mainScrollView.backgroundColor = [UIColor colorWithHexString:@"0xe9ecee"];
    
    self.ggzView = [[NSBundle mainBundle] loadNibNamed:@"CenterModelView" owner:self options:nil].firstObject;
    self.ggzView.type = 1;
    self.ggzView.frame = CGRectMake(8, 8, self.view.bounds.size.width-16, 260);
    [self.ggzView.applyButton addTarget:self action:@selector(addGgz) forControlEvents:UIControlEventTouchUpInside];
    self.ggzView.layer.cornerRadius = 8;
    self.ggzView.layer.masksToBounds = YES;
    
    self.llzView = [[NSBundle mainBundle]loadNibNamed:@"CenterModelView" owner:self options:nil].firstObject;
    self.llzView.type = 0;
    self.llzView.frame = CGRectMake(8, 276, self.view.bounds.size.width-16, 260);
    [self.llzView.applyButton addTarget:self action:@selector(addLlz) forControlEvents:UIControlEventTouchUpInside];
    self.llzView.layer.cornerRadius = 8;
    self.llzView.layer.masksToBounds = YES;
    
    [self.mainScrollView addSubview:self.ggzView];
    [self.mainScrollView addSubview:self.llzView];
}

- (void)addGgz {
    SubmitDetailInfoViewController *vc = [[SubmitDetailInfoViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)addLlz {
    if (!self.bgView) {
        self.bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        self.bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        [[UIApplication sharedApplication].keyWindow addSubview:self.bgView];
    
        self.typeView = [[NSBundle mainBundle]  loadNibNamed:@"LlzTypeView" owner:self options:nil].firstObject;
        self.typeView.frame = CGRectMake(0, 0, 300, 175);
        self.typeView.center = self.bgView.center;
        self.typeView.layer.cornerRadius = 2;
        self.typeView.layer.masksToBounds = YES;
        [self.bgView addSubview:self.typeView];
        
        self.typeView.comUserView.layer.borderColor = [UIColor colorWithHexString:@"0xdcdcdc"].CGColor;
        self.typeView.comUserView.layer.borderWidth = 1;
        
        self.typeView.personView.layer.borderColor = [UIColor colorWithHexString:@"0xdcdcdc"].CGColor;
        self.typeView.personView.layer.borderWidth = 1;
        
        [self.typeView.comButton addTarget:self action:@selector(chooseComOrPerson:) forControlEvents:UIControlEventTouchUpInside];
        [self.typeView.personButton addTarget:self action:@selector(chooseComOrPerson:) forControlEvents:UIControlEventTouchUpInside];
        
    }else if (self.bgView && self.bgView.hidden == YES){
        self.bgView.hidden = NO;
    }
}

- (void)chooseComOrPerson:(UIButton *)sender {
    self.bgView.hidden = YES;
    if (sender == self.typeView.comButton) {
        NSLog(@"选择公司");
    }else {
        NSLog(@"选择个人");
    }
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
