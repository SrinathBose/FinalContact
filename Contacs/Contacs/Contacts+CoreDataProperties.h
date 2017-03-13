//
//  Contacts+CoreDataProperties.h
//  Contacs
//
//  Created by Srinath Bose on 3/6/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "Contacts+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Contacts (CoreDataProperties)

+ (NSFetchRequest<Contacts *> *)fetchRequest;

@property(nullable, nonatomic, copy) NSString *addressStr;
@property(nullable, nonatomic, copy) NSString *nameStr;
@property(nonatomic) int64_t phoneInt;
@property(nullable, nonatomic, copy) NSString *cityStr;
@property(nonatomic) int16_t ageInt;

@end

NS_ASSUME_NONNULL_END
