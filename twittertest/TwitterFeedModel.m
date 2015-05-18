//
//  TwitterFeedModel.m
//  twittertest
//
//  Created by johnandrewarce on 5/18/15.
//  Copyright (c) 2015 Direct Works Media. All rights reserved.
//

#import "TwitterFeedModel.h"

@implementation TwitterFeedModel

+(void) getFeed: (void(^)(NSMutableDictionary* data))callback {
    NSURL *urlRequest = [[NSURL alloc] initWithString:@"http://test.steakrewards.com/feed/"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlRequest];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSData *thisData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        callback([self parseResponseToDict:thisData]);
    }];
}

+ (NSMutableDictionary *)parseResponseToDict: (NSData *)responseData {
    NSError *err;
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSData *data = [responseStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                          options:0
                                                                            error:&err];
    return jsonDictionary;
}

@end
