//
//  ErrorCodes.m
//  Contacs
//
//  Created by Srinath Bose on 3/13/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "ErrorCodes.h"

@implementation ErrorCodes

#define EC_1024 "Fill up all the fields"
#define EC_1025 "Enter valid phone number"
#define EC_1026 "Enter valid age"

+ (NSString *)getErrorMessageFromCode:(int)errorCodeNumber
{
    switch (errorCodeNumber) {
        case 1024:
            return @EC_1024;
        case 1025:
            return @EC_1025;
        case 1026:
            return @EC_1026;
    }
    return @"";
}
@end
