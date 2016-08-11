//
//  ShowImageViewController.m
//  VRDemo
//
//  Created by Apple on 16/5/5.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ShowImageViewController.h"
#import "GCSPanoramaView.h"



@interface ShowImageViewController ()<GCSWidgetViewDelegate>
{
    GCSPanoramaView *_panoView;
}

@end

@implementation ShowImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _panoView = [[GCSPanoramaView alloc]init];
    _panoView.delegate  = self;
    _panoView.enableFullscreenButton = YES;
    _panoView.enableCardboardButton = YES;
    [_panoView loadImage:[UIImage imageNamed:@"andes.jpg"] ofType:kGCSPanoramaImageTypeStereoOverUnder];
    [self.view addSubview: _panoView];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    _panoView.frame = CGRectMake(0, 0, 200, 200);
}

#pragma mark  ----GSCWidgetViewDelegate----

-(void)widgetView:(GCSWidgetView *)widgetView didLoadContent:(id)content{
    NSLog(@"播放照片成功");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
