//
//  OrderViewController.m
//  Regent Bakery & Cafe
//
//  Created by Sau Chung Loh on 10/14/15.
//  Copyright © 2015 Regent Bakery. All rights reserved.
//

#import "OrderViewController.h"
#import "Cake.h"

@interface OrderViewController () <UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDataSource, UITableViewDelegate>

//TEMPORARY CAKE VARIABLE FOR TESTING, WE NEED TO PASS REFERENCE FROM CakeMenuVC when user clicks order in cake detail view.

//Picker
@property (strong, nonatomic) NSArray *locations;
@property (weak, nonatomic) IBOutlet UIPickerView *sizePicker;
@property (weak, nonatomic) IBOutlet UIPickerView *locationPicker;

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.sizePicker.delegate = self;
  self.sizePicker.dataSource = self;
  self.locationPicker.delegate = self;
  self.locationPicker.dataSource = self;
  self.locations = @[@"Redmond", @"Capitol Hill"];
  
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PickerView Delegate and Datasource
// The data to return for the row and component (column) that's being passed in
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
  if (pickerView == self.sizePicker) { //If is location display location info
    
    return self.selectedCake.sortedSizePricingKeys[row];
  }
  //else if (pickerView == self.locationPicker) { //If it is size, display size
    else {
    return self.locations[row];
  }
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
  return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
  if (pickerView == self.sizePicker) {
  return self.selectedCake.sortedSizePricingKeys.count;
  } else {
    return self.locations.count;
  }
}

#pragma mark - Tableview Delegate and Datasource
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [[UITableViewCell alloc] init];
  return cell;
}


/*
#pragma mark - Navigation
'
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
