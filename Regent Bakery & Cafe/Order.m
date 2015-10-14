//
//  Order.m
//  Regent Bakery & Cafe
//
//  Created by Sau Chung Loh on 10/10/15.
//  Copyright © 2015 Regent Bakery. All rights reserved.
//

#import "Order.h"
#import <Parse/Parse.h>

@implementation Order
@dynamic customerEmail;
@dynamic customerNumber;
@dynamic pickupLocation;
@dynamic orderDate;
@dynamic pickupDate;
@dynamic cake;
@dynamic message;

+ (void)load {
  [self registerSubclass];
}

+ (NSString *__nonnull)parseClassName {
  return @"Order";
}

//Pass in # of people, retrieve size [Key] and price [Value] or just return size, save it

//Need access to a setter method for the cake's size/flavor? should each square be tied to a cake object?
@end