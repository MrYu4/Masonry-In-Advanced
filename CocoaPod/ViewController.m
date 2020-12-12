//
//  ViewController.m
//  CocoaPod
//
//  Created by gehot mail on 2020/12/11.
//
//

#import <Masonry/View+MASAdditions.h>
#import "ViewController.h"
#import "FatherView.h"

@interface ViewController()

@property (nonatomic, strong) UILabel *addHeightLb;
@property (nonatomic, strong) UILabel *animationLb;
@property (nonatomic, strong) UILabel *scaleLb;
@property (nonatomic, assign) CGFloat animationLbHeight;
@property (nonatomic, assign) CGFloat addHeightLbHeight;
@property (nonatomic, assign) CGFloat scaleLbHeight;
@property (nonatomic, strong) FatherView *fatherView;
@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBtns];
    [self setViews];
}

- (void)setBtns {

    UIButton *addHeightBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:@"自增高" forState:UIControlStateNormal];
        [btn addTarget:self
                action:@selector(addHeight:)
      forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    [self.view addSubview:addHeightBtn];
    [addHeightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(44);
        make.size.mas_equalTo(55);
    }];

    UIButton *animationBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:@"动画" forState:UIControlStateNormal];
        [btn addTarget:self
                action:@selector(animation:)
      forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    [self.view addSubview:animationBtn];
    [animationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(addHeightBtn);
        make.width.mas_equalTo(55);
        make.height.mas_equalTo(55);
        make.left.mas_equalTo(addHeightBtn.mas_right).offset(50);
    }];
    UIButton *scaleBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:@"缩放拉长" forState:UIControlStateNormal];
        [btn addTarget:self
                action:@selector(scale:)
      forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    [self.view addSubview:scaleBtn];
    [scaleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(addHeightBtn);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(55);
        make.left.mas_equalTo(animationBtn.mas_right).offset(20);
    }];
}

- (void)scale:(UIButton *)btn {

    [self.scaleLb mas_updateConstraints:^(MASConstraintMaker *make) {
        self.scaleLbHeight += 10;
        make.height.mas_equalTo(self.scaleLbHeight);
    }];
}

- (void)animation:(UIButton *)btn {

    [UIView animateWithDuration:0.5 animations:^{
        [self.animationLb mas_updateConstraints:^(MASConstraintMaker *make) {
            self.animationLbHeight += 8;
            make.height.mas_equalTo(self.animationLbHeight);
        }];
        [self.view layoutIfNeeded];
    }];
}

- (void)addHeight:(UIButton *)btn {

    /*
    po self.addHeightLb.constraints
    <__NSArrayI_Transfer 0x2834ed4e0>(
    <MASLayoutConstraint:0x2810ed260 UILabel:0x103608640.width == 44>,
    <MASLayoutConstraint:0x2810ed2c0 UILabel:0x103608640.height == 44>,
    <NSContentSizeLayoutConstraint:0x2810eed60 UILabel:0x103608640.width == 35>,
    <NSContentSizeLayoutConstraint:0x2810eedc0 UILabel:0x103608640.height == 20.5>
    )
     */
    [self.addHeightLb mas_updateConstraints:^(MASConstraintMaker *make) {
        self.addHeightLbHeight += 10;
        make.height.mas_equalTo(self.addHeightLbHeight);
    }];
    /*
po self.addHeightLb.constraints
<__NSArrayI_Transfer 0x281cb6cc0>(
<MASLayoutConstraint:0x283886820 UILabel:0x1041202a0.width == 40>,
<MASLayoutConstraint:0x283886880 UILabel:0x1041202a0.height == 555>,
<NSContentSizeLayoutConstraint:0x283887600 UILabel:0x1041202a0.width == 35>,
<NSContentSizeLayoutConstraint:0x283887480 UILabel:0x1041202a0.height == 20.5>
)
 * */
}

- (void)setViews {

    //自增高
    [self.view addSubview:self.addHeightLb];
    [self.addHeightLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(10);
        make.size.mas_equalTo(44);
    }];
    NSLog(@"addHeightLb %@", [NSValue valueWithCGRect:self.addHeightLb.frame]);
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    NSLog(@"addHeightLb after set need layout %@ ", [NSValue valueWithCGRect:self.addHeightLb
            .frame]);
    self.addHeightLbHeight = self.addHeightLb.frame.size.height;
    //动画
    self.animationLbHeight = 55;
    [self.view addSubview:self.animationLb];
    [self.animationLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(100);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(self.animationLbHeight);
    }];
    //scale
    [self.view addSubview:self.scaleLb];
    [self.scaleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(150);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(self.scaleLb.mas_width).multipliedBy(3);
    }];
    NSLog(@"scaleLb %@", [NSValue valueWithCGRect:self.scaleLb.frame]);
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    NSLog(@"scaleLb after set need layout %@ ", [NSValue valueWithCGRect:self.scaleLb
            .frame]);
    self.scaleLbHeight = self.scaleLb.frame.size.height;

    [self.view addSubview:self.fatherView];
    [self.fatherView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.addHeightLb);
        make.size.mas_equalTo((CGSize){100,200});
        make.left.mas_equalTo(self.scaleLb.mas_right).offset(10);
    }];
    [self.view layoutIfNeeded];
}

- (UILabel *)addHeightLb {

    if (!_addHeightLb) {
        _addHeightLb = ({
            UILabel *lb = [UILabel new];
            lb.text = @"增高";
            lb.backgroundColor = [UIColor lightGrayColor];
            lb;
        });
    }
    return _addHeightLb;
}

- (UILabel *)animationLb {

    if (!_animationLb) {
        _animationLb = ({
            UILabel *lb = [UILabel new];
            lb.text = @"动画";
            lb.backgroundColor = [UIColor greenColor];
            lb;
        });
    }
    return _animationLb;
}

- (UILabel *)scaleLb {

    if (!_scaleLb) {
        _scaleLb = ({
            UILabel *lb = [UILabel new];
            lb.text = @"缩放";
            lb.backgroundColor = [UIColor systemBlueColor];
            lb;
        });
    }
    return _scaleLb;
}

- (FatherView *)fatherView {

    if (!_fatherView) {
        _fatherView = [FatherView new];
        _fatherView.backgroundColor = [UIColor systemPurpleColor];
    }
    return _fatherView;
}


@end