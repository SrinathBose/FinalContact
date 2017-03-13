//
//  ErrorCodes.h
//  Contacs
//
//  Created by Srinath Bose on 3/13/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ErrorCodes : NSObject

+ (NSString *)getErrorMessageFromCode:(int)errorCodeNumber;

@end
