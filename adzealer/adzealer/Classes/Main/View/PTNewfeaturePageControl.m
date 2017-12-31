//
//  PTNewfeaturePageControl.m
//  OSCEPracticalTraining
//
//  Created by yangtuan on 2017/11/27.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import "PTNewfeaturePageControl.h"


@interface PTNewfeaturePageControl()

@property (nonatomic) CGSize size;

@end


@implementation PTNewfeaturePageControl




-(instancetype)initWithFrame:(CGRect)frame currentImage:(UIImage *)currentImage andDefaultImage:(UIImage *)defaultImage {
    
    self = [super initWithFrame:frame];
    self.currentImage = currentImage;
    self.defaultImage = defaultImage;
    return self;
}

-(instancetype) init {
    self = [super init];
    return self;
}

-(void) setUpDots

{
    
    if (self.currentImage && self.defaultImage) {
        self.size = self.currentImage.size;
    }else {
        self.size = CGSizeMake(7, 7);
    }
    
    if (self.pageSize.height && self.pageSize.width) {
        self.size =self.pageSize;
    }
    
    for (int i=0; i<[self.subviews count]; i++) {
        
        UIView* dot = [self.subviews objectAtIndex:i];
        dot.layer.cornerRadius = self.size.width/2;
        dot.clipsToBounds = YES;
        [dot setFrame:CGRectMake(dot.frame.origin.x, dot.frame.origin.y, self.size.width, self.size.width)];
        if ([dot.subviews count] == 0) {
            UIImageView * view = [[UIImageView alloc]initWithFrame:dot.bounds];
            [dot addSubview:view];
        };
        UIImageView * view = dot.subviews[0];
       // view.layer.cornerRadius = self.size.width/2;
       // view.clipsToBounds = YES;
        
        if (i==self.currentPage) {
            if (self.currentImage) {
                view.image=self.currentImage;
                dot.backgroundColor = [UIColor clearColor];
            }else {
                view.image = nil;
                dot.backgroundColor = self.currentPageIndicatorTintColor;
            }
        }else if (self.defaultImage) {
            view.image=self.defaultImage;
            dot.backgroundColor = [UIColor clearColor];
        }else {
            view.image = nil;
            dot.backgroundColor = self.pageIndicatorTintColor;
            
            UIView *centerView = [[UIView alloc]init];
            
            centerView.bounds = CGRectMake(0,0,dot.frame.size.width -1, dot.frame.size.height-1);
            centerView.center = dot.center;
            centerView.backgroundColor = [UIColor whiteColor];
            [dot addSubview:centerView];
            
        }
    }
}


-(void) setCurrentPage:(NSInteger)page

{
    
    [super setCurrentPage:page];
    
   [self setUpDots];
    
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat dotW  = self.size.width;
    
    //计算圆点间距
    CGFloat marginX = dotW + self.magrin;
    
    //计算整个pageControll的宽度
    CGFloat newW = (self.subviews.count - 1 ) * marginX;
    
    //设置新frame
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newW, self.frame.size.height);
    
    //设置居中
    CGPoint center = self.center;
    center.x = self.superview.center.x;
    self.center = center;
    
    //遍历subview,设置圆点frame
    for (int i=0; i<[self.subviews count]; i++) {
        UIImageView* dot = [self.subviews objectAtIndex:i];
        
        if (i == self.currentPage) {
            [dot setFrame:CGRectMake(i * marginX, dot.frame.origin.y, dotW, dotW)];
        }else {
            [dot setFrame:CGRectMake(i * marginX, dot.frame.origin.y, dotW, dotW)];
        }
    }
}



@end
