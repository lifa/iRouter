//
//  FirstViewController.m
//  iRouter
//
//  Created by fan on 2/13/15.
//  Copyright (c) 2015 fanfan. All rights reserved.
//

#import "FirstViewController.h"
#import "AFNetworking.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *test = [[UILabel alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:test];
    
    NSURL *url = [NSURL URLWithString:@"http://suggestion.baidu.com/su?wd=&json=1&p=3&sid=1464&req=2&cb=jQuery110203101720795966685_1423824043057&_=1423824043058"];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:[NSURLRequest requestWithURL:url]];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        test.text = [NSString stringWithUTF8String:[(NSData*)responseObject bytes]];
    }  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    [op start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
