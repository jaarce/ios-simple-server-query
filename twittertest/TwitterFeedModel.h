//
//  TwitterFeedModel.h
//  twittertest
//
//  Created by johnandrewarce on 5/18/15.
//  Copyright (c) 2015 Direct Works Media. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TwitterFeedModel : NSObject

+(void) getFeed: (void(^)(NSMutableDictionary* data))callback;

@end
