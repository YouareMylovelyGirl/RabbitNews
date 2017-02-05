//
//  DetailWebController.m
//  TRProject
//
//  Created by 阳光 on 2017/1/13.
//  Copyright © 2017年 Tedu. All rights reserved.
//

#import "DetailWebController.h"

@interface DetailWebController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation DetailWebController

- (instancetype)initWithDetailPath:(NSString *)detailPath
{
    if (self = [super init]) {
        self.detailPath = detailPath;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.webView = [[UIWebView alloc]init];
    [self.view addSubview:self.webView];
    self.webView.delegate = self;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:self.detailPath]];
    [self.webView loadRequest:req];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"%@",request.URL.absoluteString);
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    if (webView.isLoading) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        [self.view showHUD];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if (!webView.isLoading) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        [self.view showMessage:@"加载完成"];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}


@end
