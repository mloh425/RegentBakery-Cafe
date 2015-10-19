//
//  CakeMenuViewController.m
//  Regent Bakery & Cafe
//
//  Created by Sau Chung Loh on 10/13/15.
//  Copyright © 2015 Regent Bakery. All rights reserved.
//

#import "CakeMenuViewController.h"
#import "OrderViewController.h"

@interface CakeMenuViewController ()

@property (strong, nonatomic) NSMutableArray *cakes;
@end


//Pass reference of selected cake to order/customization view controller -> maybe just go to Detail then order?
@implementation CakeMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self parseCakeJSON];
}
- (IBAction)selectCake:(UIButton *)sender {
  Cake *testCake = [[Cake alloc] init];
  testCake = self.cakes[0];
//  OrderViewController *orderView = [[OrderViewController alloc] init];
 
  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: [NSBundle mainBundle]];
  OrderViewController *orderView = [storyboard instantiateViewControllerWithIdentifier:@"OrderView"];
  orderView.selectedCake = testCake;
  [self.navigationController pushViewController:orderView animated:true];

  
  
}

- (void)parseCakeJSON {
    self.cakes = [[NSMutableArray alloc] init];
    NSError *deserializingError;
    NSString *pathToLocalJSON = [[NSBundle mainBundle] pathForResource:@"cakes" ofType:@"json"];
    NSURL *localFileURL = [NSURL fileURLWithPath:pathToLocalJSON];
    NSData *contentOfLocalFile = [NSData dataWithContentsOfURL:localFileURL];
    NSArray *rootObject = [NSJSONSerialization JSONObjectWithData:contentOfLocalFile options:0 error:&deserializingError];
  
    //  NSLog(@"%lu", (unsigned long)rootObject.count);
  
    //Ideally I want to parse this in the menu VC and go from there...
    //Be able to select sizes
    //Writing
    //Set the price
    //Add to cart.
    for (NSDictionary *cake in rootObject) {
      Cake *flavor = [[Cake alloc] init];
      flavor.flavor = cake[@"flavor"];
      flavor.cakeDescription = cake[@"description"];
      flavor.sizePricing = cake[@"sizePricing"];
      flavor.sortedSizePricingKeys = [flavor.sizePricing keysSortedByValueUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([obj1 integerValue] > [obj2 integerValue]) {
          
          return (NSComparisonResult)NSOrderedDescending;
        }
        if ([obj1 integerValue] < [obj2 integerValue]) {
          
          return (NSComparisonResult)NSOrderedAscending;
        }
        
        return (NSComparisonResult)NSOrderedSame;
      }];
      [self.cakes addObject:flavor];
      
//          NSLog(@"%@", flavor.sizePricing);
//          NSLog(@"%@", flavor.sortedSizePricingKeys);
//          NSLog(@"%@", flavor.flavor);
//          NSLog(@"%@", flavor.sizePricing);

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
