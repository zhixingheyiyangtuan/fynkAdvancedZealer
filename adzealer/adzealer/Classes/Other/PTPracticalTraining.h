//
//  PTPracticalTraining.h
//  OSCEPracticalTraining
//
//  Created by yangtuan on 2017/9/26.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#ifndef PTPracticalTraining_h
#define PTPracticalTraining_h


#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif

#define WEAK_SELF(weakSelf)  __weak __typeof(&*self)weakSelf = self

//RGB 设置颜色

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//#F7F7F7
#define SYSYTEMCOLOR RGBA(247,247,247,1)

//#6E9FFD 主蓝色
#define SYSYTEMAINBLUE RGBA(110, 159, 253, 1)
//#4753B7 深蓝色
#define SYSYTEDARKBLUE RGBA(71, 83, 183, 1)
//#9A9A9A 背景灰色
#define SYSYTEMAINGRAY RGBA(154, 154, 154, 1)
//#DDDDDD 线条灰色
#define SYSYTELINEGRAY RGBA(221, 221, 221, 1)



//#D0011B 系统红色
#define SYSYTEMAINRED RGBA(208, 1, 27, 1)

//#454545 标题正文、主要文字
#define SYSYTEMAITEXT RGBA(69, 69, 69, 1)

//#333333 日程文字
#define SCHEDULETEXT RGBA(51, 51, 51, 1)

/** #ABE46C 开放实验室颜色 */
#define OPENLABORATORYCOLOR RGBA(171, 228, 108, 1)

/** #74A7E2 考试颜色 */
#define EXAMINATIONCOLOR RGBA(116, 167, 226, 1)

/** #F2BF6C 课程颜色 */
#define CLASSCOLOR RGBA(242, 191, 108, 1)

/** #BC7AC9 公务预约 */
#define OFFICIALCOLOR RGBA(188, 122, 201, 1)




//坐标相关
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width
//以5s为标准开发 320 * 568
//#define autoSizeScaleX  (Main_Screen_Width>320?Main_Screen_Width/320:1)
//#define autoSizeScaleY  (Main_Screen_Height>568?Main_Screen_Height/568:1)

//以6s为标准开发 375 * 667
#define autoSizeScaleX  (Main_Screen_Width !=375 ? Main_Screen_Width/375:1)
#define autoSizeScaleY  (Main_Screen_Height !=667 ? Main_Screen_Height/667:1)


// 字体大小(常规/粗体)
#define BOLDSYSTEMFONT(FONTSIZE)[UIFont boldSystemFontOfSize:FONTSIZE*autoSizeScaleX]
//#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE*autoSizeScaleX]
//
//#define SYSTEMDEFAULTFONT    SYSTEMFONT(15.0*autoSizeScaleX)

#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE*autoSizeScaleX]
// 34 对应 19.27
#define SYSTEMBIGFONT    [UIFont systemFontOfSize:19.27*autoSizeScaleX]
/** 30 对应 17*/
#define SYSTEMDEFAULTFONT    [UIFont systemFontOfSize:17.0*autoSizeScaleX]
// 22 对应 12.46
#define SYSTEMSMALLFONT    [UIFont systemFontOfSize:12.46*autoSizeScaleX]

// 26 对应 14.7
#define SYSTEMMIDDLEFONT    [UIFont systemFontOfSize:14.7*autoSizeScaleX]

// 28 对应 15.9
#define SYSTEMTWENTYEIGHTFONT    [UIFont systemFontOfSize:15.9*autoSizeScaleX]

//***********************URL 相关*******************************
//***********************Zealer*******************************
#define SYSYTEMTEXTCOLOR [UIColor colorWithHexString:@"#31353b"]

#define SYSYTEMTEXTALPHACOLOR  [UIColor colorWithHexString:@"#31353b" alpha:0.8]

#define CONTENTFONT SYSTEMFONT(16.0)
#define SMALLFONT SYSTEMFONT(12.0)
//=========================接口==================



#endif /* PTPracticalTraining_h */
