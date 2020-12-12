//
// Created by gehot mail on 2020/12/12.
//

#import <UIKit/UIKit.h>
#import "SubView.h"

NS_ASSUME_NONNULL_BEGIN

///
@interface FatherView:UIView
@property (nonatomic, strong) SubView *sonView1;
@property (nonatomic, strong) SubView *sonView2;
@property (nonatomic, strong) SubView *sonView3;
@end

NS_ASSUME_NONNULL_END