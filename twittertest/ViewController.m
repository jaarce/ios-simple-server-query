//
//  ViewController.m
//  twittertest
//
//  Created by johnandrewarce on 5/18/15.
//  Copyright (c) 2015 Direct Works Media. All rights reserved.
//

#import "ViewController.h"
#import "TwitterFeedModel.h"
#import "TwitterCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableData = [[NSMutableArray alloc] init];
    [TwitterFeedModel getFeed:^(NSMutableDictionary *data) {
        for (NSMutableDictionary *item in data) {
            [self.tableData addObject:item];
        }
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITableViewDataSource Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"TwitterCell";
    TwitterCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[TwitterCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:MyIdentifier];
    }
    NSDictionary *data = [self.tableData objectAtIndex:indexPath.row];
    cell.label.text = [data objectForKey:@"text"];
    cell.twitterUsername.text = [[data objectForKey:@"user"] objectForKey:@"screen_name"];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[[data objectForKey:@"user"] objectForKey:@"profile_image_url"]]];
        cell.twitterImageView.image = [UIImage imageWithData:imageData];
    });
    return cell;
}


- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableData count];
}

@end
