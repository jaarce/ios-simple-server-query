//
//  ViewController.h
//  twittertest
//
//  Created by johnandrewarce on 5/18/15.
//  Copyright (c) 2015 Direct Works Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(retain) NSMutableArray *tableData;
@end

