//
//  ViewController.m
//  AYBubbleView
//
//  Created by Andy on 16/4/2.
//  Copyright © 2016年 AYJk. All rights reserved.
//

#import "ViewController.h"
#import "AYBubbleView.h"
@interface ViewController ()
@property (nonatomic, strong) AYBubbleView *bubbleView;
@property (weak, nonatomic) IBOutlet UIStepper *messageSteper;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.bubbleView = [[AYBubbleView alloc] initWithCenterPoint:self.view.center bubleRadius:15 addToSuperView:self.view];
    self.bubbleView.decayCoefficent = .2;
    self.bubbleView.unReadLabel.text = @"69";
//    bubbleView.unReadLabel.font = [UIFont systemFontOfSize:11.0];
    self.bubbleView.bubbleColor = [UIColor redColor];
    __weak typeof(self) weakSelf = self;
    self.bubbleView.cleanMessageBlock = ^(BOOL isClean) {
        if (isClean) {
            weakSelf.messageSteper.value = 0;
        } else {
//            do other logical operation
        }
    };
}
- (IBAction)stepperAction:(UIStepper *)sender {
    if (sender.value >= 1) {
        [self.bubbleView showBubbleView];
    }
    self.bubbleView.unReadLabel.text = [NSString stringWithFormat:@"%d",(int)sender.value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
