//
//  DatabaseDataSource.h
//  Contacs
//
//  Created by Srinath Bose on 3/7/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IContact.h"
#import "CoreData/CoreData.h"

/**
 Interface For Getting Data From Database
 */
@interface DatabaseDataSource : NSObject <IContact>

@end
