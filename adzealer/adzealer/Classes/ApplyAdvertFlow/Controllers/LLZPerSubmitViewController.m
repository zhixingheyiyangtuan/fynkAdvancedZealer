//
//  LLZPerSubmitViewController.m
//  Zealer2
//
//  Created by 菲亚诺克 on 2017/12/28.
//  Copyright © 2017年 菲亚诺克. All rights reserved.
//

#import "LLZPerSubmitViewController.h"
#import "PersonInfoSubmitView.h"

@interface LLZPerSubmitViewController ()
@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation LLZPerSubmitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollView];
    self.scrollView.contentSize = CGSizeMake(Main_Screen_Width, 700);
    
    PersonInfoSubmitView *v = [[NSBundle mainBundle] loadNibNamed:@"PersonInfoSubmitView" owner:self options:nil].firstObject;
    v.frame = CGRectMake(0, 0, Main_Screen_Width, 700);
    [v initView];
    [self.scrollView addSubview:v];
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
