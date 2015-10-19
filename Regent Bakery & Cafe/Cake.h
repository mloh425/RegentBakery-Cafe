//
//  Cake.h
//  Regent Bakery & Cafe
//
//  Created by Sau Chung Loh on 10/10/15.
//  Copyright © 2015 Regent Bakery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <Parse/PFObject+Subclass.h>

@interface Cake : NSObject
@property (strong, nonatomic) NSString *flavor;
@property (strong, nonatomic) NSString *cakeDescription;
@property (strong, nonatomic) NSArray *photos; //Whole Cake, Slice, SideView
@property (strong, nonatomic) NSMutableDictionary *sizePricing;
@property (strong, nonatomic) NSArray *sortedSizePricingKeys;

-(NSString *)returnCakeServingSize:(NSString *)cakeSize;

//Dictionary of available sizes to prices - May need to find a way to sort/display them when ordering


@end
