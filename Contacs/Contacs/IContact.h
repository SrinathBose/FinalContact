//
//  IContact.h
//  Contacs
//
//  Created by Srinath Bose on 3/7/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "Foundation/Foundation.h"
#import "Person.h"

/**
 Interface for variety of Contacts Providers
 */
@protocol IContact <NSObject>

- (NSArray *)getContacts;
- (bool)addContact:(Person *)newPerson;
- (bool)deleteContact:(Person *)personToBeDelete;

@end
