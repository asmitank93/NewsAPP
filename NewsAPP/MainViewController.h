//
//  MainViewController.h
//  SidebarDemo
//
//  Created by Simon Ng on 10/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NEWSTableViewCell.h"
#import "IMGCollectionViewCell.h"
@interface MainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSMutableDictionary *dictmute;
    NSMutableArray *arr_mute;
    int rowIndex;
}
@property (weak, nonatomic) IBOutlet UITableView *tbl_vw;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UICollectionView *collectvw;
@end
