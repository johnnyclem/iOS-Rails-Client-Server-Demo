//
//  Post.h
//  client
//
//  Created by John Clem on 1/31/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "NSRRemoteObject.h"

@interface Post : NSRRemoteObject

@property (nonatomic, strong)    NSString *author, *content, *title, *url;
@property (nonatomic, readwrite) BOOL draft;

@end