 //
//  AddContact.h
//  Contacs
//
//  Created by Srinath Bose on 1/19/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "ContactManager.h"

@class AddContactViewController;

@interface AddContactViewController : UIViewController <UITextFieldDelegate>

@property(strong, nonatomic) ContactManager *contactManager;
-(bool)validateContact:(NSString *)nameString phone:(NSNumber *)phoneNumber address:(NSString *)addressString age:(NSNumber *)ageNumber city:(NSString *)cityString;

@end
