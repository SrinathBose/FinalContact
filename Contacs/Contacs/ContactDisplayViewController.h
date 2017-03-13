//
//  ContactDisplayViewController.h
//  Tab_Demo
//
//  Created by Srinath Bose on 1/11/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "ContactManager.h"

@class ContactDisplayViewController;

@interface ContactDisplayViewController : UIViewController

@property(strong, nonatomic) ContactManager *contactManager;
@property(nonatomic, strong) Person *person;
- (IBAction)deleteContactClicked:(id)sender;

@end
