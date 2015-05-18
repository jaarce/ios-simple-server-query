//
//  TwitterCell.h
//  twittertest
//
//  Created by johnandrewarce on 5/18/15.
//  Copyright (c) 2015 Direct Works Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwitterCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *twitterImageView;
@property (weak, nonatomic) IBOutlet UILabel *twitterUsername;

@end
