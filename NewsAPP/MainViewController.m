//
//  MainViewController.m
//  SidebarDemo
//
//  Created by Simon Ng on 10/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize tbl_vw,collectvw;
- (void)viewDidLoad {
    [super viewDidLoad];
    collectvw.dataSource=self;
    collectvw.delegate=self;
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(targetMethod)
                                   userInfo:nil
                                    repeats:YES];
    
    //self.title = @"View 1";
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
    dictmute=[[NSMutableDictionary alloc]init];
    arr_mute=[[NSMutableArray alloc]init];
    [dictmute setObject:@"news_three.jpg" forKey:@"img"];
    [dictmute setObject:@"News 3" forKey:@"title"];
    [arr_mute addObject:[dictmute copy]];
    [dictmute setObject:@"four_sport.jpg" forKey:@"img"];
    [dictmute setObject:@"Sports" forKey:@"title"];
    [arr_mute addObject:[dictmute copy]];
    [dictmute setObject:@"modi.jpg" forKey:@"img"];
    [dictmute setObject:@"Modi" forKey:@"title"];
    [arr_mute addObject:[dictmute copy]];
    [dictmute setObject:@"news_four.jpg" forKey:@"img"];
    [dictmute setObject:@"News 4" forKey:@"title"];
    [arr_mute addObject:[dictmute copy]];
    
    tbl_vw.dataSource=self;
    tbl_vw.delegate=self;
}
-(void)targetMethod
{
    
    [self.collectvw scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:rowIndex inSection:0]
                      atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                              animated:YES];
    
    rowIndex=(rowIndex<arr_mute.count-1)?(rowIndex+1):0;
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return arr_mute.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IMGCollectionViewCell *cell=nil;
    cell=[collectvw dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.img_vw.image=[UIImage imageNamed:[[arr_mute objectAtIndex:indexPath.row]objectForKey:@"img"]];
    cell.lbl_title.text=[[arr_mute objectAtIndex:indexPath.row]objectForKey:@"title"];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arr_mute.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NEWSTableViewCell *cell=nil;
    cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.lbl_title.text=[[arr_mute objectAtIndex:indexPath.row]objectForKey:@"title"];
    cell.img_vw.image=[UIImage imageNamed:[[arr_mute objectAtIndex:indexPath.row]objectForKey:@"img"]];
    return cell;
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
