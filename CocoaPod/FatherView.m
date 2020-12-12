//
// Created by gehot mail on 2020/12/12.
//

#import <Masonry/View+MASAdditions.h>
#import <Masonry/NSArray+MASAdditions.h>
#import "FatherView.h"

@interface FatherView()
@property (nonatomic, assign) NSInteger layoutTimes;
@end

@implementation FatherView

- (instancetype)init {

    if (self = [super init]) {
        [self addViews];
    }
    return self;
}

- (void)addViews {

    [self addSubview:self.sonView1];
    [self addSubview:self.sonView2];
    [self addSubview:self.sonView3];
}

- (void)layoutSubviews {

    [super layoutSubviews];
    self.layoutTimes ++;
    NSLog(@"father view layoutSubviews times:%ld",self.layoutTimes);
    NSArray <UIView *>*views = @[self.sonView1,self.sonView2,self.sonView3];
    [views mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(44);
        make.top.mas_equalTo(20);
    }];
    [views mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
                       withFixedSpacing:30
                            leadSpacing:5
                            tailSpacing:5];
}

- (SubView *)sonView1 {

    if (!_sonView1) {
        _sonView1 = ({
                SubView *view = [SubView new];
                view.backgroundColor = [UIColor systemRedColor];
                view.text = @"1";
                view;
        });
    }
    return _sonView1;
}

- (SubView *)sonView2 {

    if (!_sonView2) {
        _sonView2 = ({
            SubView *view = [SubView new];
            view.backgroundColor = [UIColor systemYellowColor];
            view.text = @"2";
            view;
        });
    }
    return _sonView2;
}

- (SubView *)sonView3 {

    if (!_sonView3) {
        _sonView3 = ({
            SubView *view = [SubView new];
            view.backgroundColor = [UIColor systemBlueColor];
            view.text = @"3";
            view;
        });
    }
    return _sonView3;
}
@end