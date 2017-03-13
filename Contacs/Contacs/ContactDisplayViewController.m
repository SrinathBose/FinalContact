//
//  ContactDisplayViewController.m
//  Tab_Demo
//
//  Created by Srinath Bose on 1/11/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "ContactDisplayViewController.h"

#define personViewIdentifier "ContactList"

@interface ContactDisplayViewController ()

@property(weak, nonatomic) IBOutlet UILabel *nameLbl;
@property(weak, nonatomic) IBOutlet UILabel *numberLbl;
@property(weak, nonatomic) IBOutlet UILabel *addressLbl;
@property(weak, nonatomic) IBOutlet UILabel *ageLbl;
@property(weak, nonatomic) IBOutlet UILabel *cityLbl;

@end

@implementation ContactDisplayViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    if (_person != nil) {

        self.nameLbl.text = _person.nameString;
        self.addressLbl.text = _person.addressString;
        self.cityLbl.text = _person.cityString;
        self.numberLbl.text = [_person.phoneNumber stringValue];
        self.ageLbl.text = [_person.ageNumber stringValue];
    }
}

/**
 Perform action on delete button clicked

 @param sender - id
 */
- (IBAction)deleteContactClicked:(id)sender
{
    [_contactManager deleteContact:_person];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
