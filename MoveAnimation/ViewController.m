//
//  ViewController.m
//  MoveAnimation
//
//  Created by 崔先生的MacBook Pro on 2023/2/3.
//

#import "ViewController.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, assign) BOOL isBecomeTwoBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    _btn.center = self.view.center;
    _btn.backgroundColor = [UIColor redColor];
    _btn.layer.cornerRadius = 25;
    _btn.layer.masksToBounds = YES;
    _btn.tag = -1;
    [self.view addSubview:_btn];
    //按钮点击，reload页面
    [_btn addTarget:self action:@selector(reloadBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addCircleView];
    
}

- (void)addCircleView {
    int count = 3;
    for (int i = 0; i < count; i++) {
        int space = (kWidth - count * 50) / (count + 1);
        int leftSpace = space * (i + 1) + 50 * i;
        UIButton *circleBtn = [[UIButton alloc] init];
        circleBtn.tag = i;
        circleBtn.frame = CGRectMake(leftSpace, kHeight - 150, 50, 50);
        circleBtn.backgroundColor = [UIColor orangeColor];
        circleBtn.layer.cornerRadius = 25;
        circleBtn.layer.masksToBounds = YES;
        [circleBtn setTitle:[NSString stringWithFormat:@"%d", i + 1] forState:UIControlStateNormal];
        [self.view addSubview:circleBtn];
        [circleBtn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
        _isBecomeTwoBtn = NO;
    }
}

- (void)clickBtn {
    NSLog(@"click");
}

- (void)reloadBtn {
//    [_btn.layer addAnimation:[self shakeAnimation] forKey:nil];
    
    int count = 0;
    //设置按钮的数量
    if (!_isBecomeTwoBtn) {
        count = 2;
    } else {
        count = 3;
    }
    //获取按钮
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UIButton class]] && view.tag != -1) {
            int space = (kWidth - count * 50) / (count + 1);
            int leftSpace = space * ((int)view.tag + 1) + 50 * (int)view.tag;
            //增加按钮的动画,修改按钮的frame
            [UIView animateWithDuration:0.5 animations:^{
                view.frame = CGRectMake(leftSpace, kHeight - 150, 50, 50);
                //隐藏第三个按钮
                if (count == 2 && view.tag == 2) {
                    view.alpha = 0;
                } else {
                    view.alpha = 1;
                }
            }];
        }
    }
    _isBecomeTwoBtn = !_isBecomeTwoBtn;
}

//添加抖动效果
- (CAKeyframeAnimation *)shakeAnimation {
    CAKeyframeAnimation *shakeAnim = [CAKeyframeAnimation animation];
    shakeAnim.keyPath = @"transform.translation.x";
    shakeAnim.duration = 0.2;
    CGFloat delta = 10;
    shakeAnim.values = @[@0, @(-delta), @0, @(delta), @0];
    shakeAnim.repeatCount = 2;
    return shakeAnim;
}

@end
