//
//  ViewController.m
//  WebViewHomework
//
//  Created by LEEJIHO on 2016. 5. 27..
//  Copyright © 2016년 LEEJIHO. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>

@property (nonatomic, weak) IBOutlet UIWebView *webView;
@property (nonatomic, weak) IBOutlet UITextField *pageUrl;

@property (nonatomic, weak) IBOutlet UIBarButtonItem *backButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *frontButton;

@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *indicatorView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.indicatorView.hidden = YES;
    
    self.backButton.enabled = NO;
    self.frontButton.enabled = NO;
    
    self.webView.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)connectUrl:(id)sender {
    NSURL *url = nil;
    
    NSRange range = [self.pageUrl.text rangeOfString:@"naver"];
    
    if(range.location == NSNotFound) {
        
        if([self.pageUrl.text hasPrefix:@"http://"]) {
            url = [NSURL URLWithString:self.pageUrl.text];
        } else {
            url = [NSURL URLWithString:[@"http://" stringByAppendingString:self.pageUrl.text]];
        }
        
        [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    }

    
    [self.pageUrl resignFirstResponder];
    
    
}

- (IBAction)reflashEvent:(id)sender {
    
    [self.webView reload];
    
}

- (IBAction)backEvent:(id)sender {
    
    
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }

}

- (IBAction)frontEvent:(id)sender {
    if(self.webView.canGoForward) {
        [self.webView goForward];
    }
    
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"did started");
    self.indicatorView.hidden = NO;
    [self.indicatorView startAnimating];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    NSLog(@"did finished");
    self.indicatorView.hidden = YES;
    [self.indicatorView stopAnimating];
    
    if(self.webView.canGoBack) {
        self.backButton.enabled = YES;
    }
    else {
        self.backButton.enabled = NO;
    }
    
    if(self.webView.canGoForward ) {
        self.frontButton.enabled = YES;
    }
    else {
        self.frontButton.enabled = NO;
    }
    
}

@end
