//
//  ViewController.m
//  XZNSAssert
//
//  Created by kkxz on 2018/10/19.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSArray * array;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _array = @[@1,@2,@3,@4,@5,@6];
    NSInteger type = 1;
    
    if(1==type){
        int i = 6;
        NSAssert(i>5, @"I must bigger than 5");//控制台没有任何输出
        NSLog(@"继续往下执行...");
    }
    else if(2==type){
        int i = 2;
        NSAssert(i>5, @"I must bigger than 5");//运行会crash
    }
    else if(3==type){
        //可以对输出信息进行传值
        int i = 2;
        NSAssert(i>5, @"The real value is %i",i);
    }
    else if(4 == type){
        [self processItem:8];
    }
    
    //从Xcode4.2开始，release版默认关闭了断言。也就是当编译发布版时，任何调用NSAssert的地方都被空行替换。所以，不要在NSAssert内执行任何有效操作。
    
}

-(void)processItem:(NSUInteger)index
{
    NSParameterAssert(index < _array.count);//条件成立，继续执行，不成立，程序crash。
    //do something else
    NSLog(@"ParameterAssert-继续往下执行...");
    
}

@end
