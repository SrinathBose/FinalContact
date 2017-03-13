//
//  Contacts+CoreDataProperties.m
//  Contacs
//
//  Created by Srinath Bose on 3/6/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "Contacts+CoreDataProperties.h"

@implementation Contacts (CoreDataProperties)


+ (NSFetchRequest<Contacts *> *)fetchRequest
{
	return [[NSFetchRequest alloc] initWithEntityName:@"Contacts"];
}

@dynamic addressStr;
@dynamic nameStr;
@dynamic phoneInt;
@dynamic cityStr;
@dynamic ageInt;

@end
