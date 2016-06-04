//
//  ViewController4.m
//  NewsAPP
//
//  Created by Mac on 6/4/16.
//  Copyright (c) 2016 Mac. All rights reserved.
//

#import "ViewController4.h"

@interface ViewController4 ()

@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage     imageNamed:@"ic_logo.PNG"]];
    [image setFrame:CGRectMake(110, 0, 150, 44)];
    [self.navigationController.navigationBar addSubview:image];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor redColor]];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
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
