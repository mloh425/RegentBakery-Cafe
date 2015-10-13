//
//  CakeMenuViewController.m
//  Regent Bakery & Cafe
//
//  Created by Sau Chung Loh on 10/13/15.
//  Copyright © 2015 Regent Bakery. All rights reserved.
//

#import "CakeMenuViewController.h"

@interface CakeMenuViewController ()
@property (strong, nonatomic) NSMutableArray *cakes;
@end

@implementation CakeMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self parseCakeJSON];
}

- (void)parseCakeJSON {
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
      flavor.description = cake[@"description"];
      flavor.sizePricing = cake[@"sizePricing"];
    
      //    NSLog(@"%@", flavor.flavor);
      //    NSLog(@"%@", flavor.sizePricing);
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
