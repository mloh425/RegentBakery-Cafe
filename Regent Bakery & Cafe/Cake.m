//
//  Cake.m
//  Regent Bakery & Cafe
//
//  Created by Sau Chung Loh on 10/10/15.
//  Copyright © 2015 Regent Bakery. All rights reserved.
//

#import "Cake.h"
//#import <Parse/Parse.h>

@implementation Cake

//Takes in a string of the selected cakeSize and
//returns the number of people each cake size can serve
-(NSString *)returnCakeServingSize:(NSString *)cakeSize {
  if ([cakeSize isEqualToString:@"6 inch"]) {
    return @"4 to 6 people";
  } else if ([cakeSize isEqualToString:@"8 inch"]) {
    return @"8 to 10 people";
  } else if ([cakeSize isEqualToString:@"10 inch"]) {
    return @"12 to 15 people";
  } else if ([cakeSize isEqualToString:@"Quarter Sheet"]) {
    return @"15 to 20 people";
  } else if ([cakeSize isEqualToString:@"Half Sheet"]) {
    return @"35 to 40 people";
  } else if ([cakeSize isEqualToString:@"Three Quarter Sheet"]) {
    return @"55 to 60 people";
  } else { //Full Sheet
    return @"75 to 80 people";
  }
}

@end


