//
//  MYView.m
//  wifi
//
//  Created by apple on 16/12/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MYView.h"

@implementation MYView
{
    CGFloat _totalTime;   //已经播放的时间
    CGFloat _alpha;    //透明度
    CGFloat _time;    //一个内圆到达内圆外圆时间
    CGFloat _zhen;   //帧数
    NSArray * _daxiaos;    //某部分占圆的大小
    NSArray * _useDaxiaos;  //某部分占元的大小
    NSTimer * _timer;
}

-(instancetype)init{
    if (self = [super init]) {
        [self setDefine];
        [self setTimer];
    }
    return self;
}

-(void) setDefine{
    _totalTime = 0;
    _alpha = 0.25;
    _time = 1;
    _zhen = 10;
    _daxiaos = @[@0.2,@0.15,@0.2,@0.25,@0.2];
    _useDaxiaos = @[@0.2,@0.35,@0.55,@0.8,@1.0];
}

-(void) setTimer{
    _timer = [NSTimer scheduledTimerWithTimeInterval:_time/_zhen target:self selector:@selector(draw) userInfo:nil repeats:true];
}
-(void) draw{
    [self setNeedsDisplay];
}
-(void)dealloc{
    [_timer invalidate];
    _timer = nil;
}
- (void)drawRect:(CGRect)rect {
    [[UIColor blueColor] set];
    
    CGFloat radiusX = rect.size.width/2;
    CGFloat radiusY = rect.size.height/2;
    
    
    _totalTime += _time/_zhen;
    
    CGFloat _timeBili = [self oneFloat:_totalTime modTwoFloat:_time]/_time;
    
    //第一个圆
    NSInteger i = 0;    //第几个环或者圆
    NSNumber * biliNum = _useDaxiaos[i];
    CGFloat bili = [biliNum floatValue];
    CGFloat x = radiusX * (1 - bili);
    CGFloat y = radiusY * (1- bili);
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(x, y, rect.size.width * bili, rect.size.width * bili)];
    [path fillWithBlendMode:(kCGBlendModeColor) alpha:1];
    
    
    //第二，三，四个环
    for (NSInteger index = 0; index < 3; index += 1) {
        biliNum = _useDaxiaos[index];
        bili = [biliNum floatValue];
        
        NSNumber * daxiaoBiliNum = _daxiaos[index + 1];
        CGFloat daxiaoBili = [daxiaoBiliNum floatValue];
        
        CGFloat path1Bili = bili + daxiaoBili * _timeBili;
        
        x = radiusX * (1 - path1Bili);
        y = radiusY * (1- path1Bili);
        UIBezierPath * path1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(x, y, rect.size.width * path1Bili, rect.size.width * path1Bili)];
        [path1 fillWithBlendMode:(kCGBlendModeColor) alpha:_alpha];
    }
    
    NSInteger index = 3;
    
    //第5个环，先不管了
    biliNum = _useDaxiaos[index];
    bili = [biliNum floatValue];
    
    NSNumber * daxiaoBiliNum = _daxiaos[index + 1];
    CGFloat daxiaoBili = [daxiaoBiliNum floatValue];
    
    CGFloat path1Bili = bili + daxiaoBili * _timeBili;
    
    x = radiusX * (1 - path1Bili);
    y = radiusY * (1- path1Bili);
    UIBezierPath * path1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(x, y, rect.size.width * path1Bili, rect.size.width * path1Bili)];
    [path1 fillWithBlendMode:(kCGBlendModeColor) alpha:_alpha *(1-_timeBili)];
}


-(CGFloat) oneFloat:(CGFloat) oneNum modTwoFloat:(CGFloat) twoNum{
    CGFloat san = oneNum/twoNum;
    
    CGFloat sanXiaoshu = san - (NSInteger)san;   //小数部分
    
    return twoNum * sanXiaoshu;
    
}

@end
