//
//  ViewController.m
//  VRDemo
//
//  Created by Apple on 16/5/4.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "GCSVideoView.h"
#import "ShowImageViewController.h"
@interface ViewController ()<GCSVideoViewDelegate>
{
    BOOL _isPaused;
}
@property (weak, nonatomic) IBOutlet GCSVideoView *VRPlayerView;

@end 

@implementation ViewController

-(instancetype)init{
    self = [super initWithNibName:nil bundle:nil];
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    _VRPlayerView.delegate = self;
    _VRPlayerView.enableCardboardButton = YES;
    _VRPlayerView.enableFullscreenButton = YES;
    _isPaused = NO;
    [_VRPlayerView loadFromUrl:[NSURL   URLWithString:@"http://120.25.246.21/vrMobile/travelVideo/zhejiang_xuanchuanpian.mp4"]];
    // @"http://120.25.246.21/vrMobile/travelVideo/beijing_congzhenwaibozishu.mp4"
}
- (IBAction)showPhoto:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard   storyboardWithName:@"Main" bundle:nil];
    ShowImageViewController *showImageViewController = [storyboard instantiateViewControllerWithIdentifier:@"ShowImageViewController"];
    
    [self.navigationController pushViewController:showImageViewController animated:YES];
    
}

#pragma mark ----GCSVideoViewDelegate----

//GCSVideoView的点击事件
-(void)widgetViewDidTap:(GCSWidgetView *)widgetView{
    if (_isPaused) {
        [_VRPlayerView resume];
    }else{
        [_VRPlayerView pause];
    }
    _isPaused = !_isPaused;
}

//视频播放到某个位置时触发事件
-(void)videoView:(GCSVideoView *)videoView didUpdatePosition:(NSTimeInterval)position{
    if (position == videoView.duration) {
        [_VRPlayerView seekTo:0];
        [_VRPlayerView resume];
    }
}

//视频播放失败
-(void)widgetView:(GCSWidgetView *)widgetView didFailToLoadContent:(id)content withErrorMessage:(NSString *)errorMessage{
    NSLog(@"播放错误");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
