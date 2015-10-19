//
//  CakeMenuViewController.m
//  Regent Bakery & Cafe
//
//  Created by Sau Chung Loh on 10/13/15.
//  Copyright © 2015 Regent Bakery. All rights reserved.
//

#import "CakeMenuViewController.h"
#import "CakeCollectionViewCell.h"
#import "Cake.h"
@interface CakeMenuViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) CakeCollectionViewCell *cell;
@property (strong, nonatomic) NSMutableArray *cakes;
@property (strong, nonatomic) IBOutlet UIView *detailView;
@property (strong, nonatomic) IBOutlet UIButton *closeButton;
@property (strong, nonatomic) IBOutlet UIImageView *largeImage;
@property (strong, nonatomic) IBOutlet UITextView *detailTextView;

@end

@implementation CakeMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  self.detailView.hidden = true;
  self.collectionView.dataSource = self;
  self.collectionView.delegate = self;
  self.cakes = [[NSMutableArray alloc]init];
  [self parseCakeJSON];
  
  
}

- (UIStatusBarStyle)preferredStatusBarStyle {
  return UIStatusBarStyleLightContent;
}

- (void)parseCakeJSON {
    NSError *deserializingError;
    NSString *pathToLocalJSON = [[NSBundle mainBundle] pathForResource:@"cakes" ofType:@"json"];
    NSData *contentOfLocalFile = [NSData dataWithContentsOfFile:pathToLocalJSON];
    NSDictionary *rootObject = [NSJSONSerialization JSONObjectWithData:contentOfLocalFile options:0 error:&deserializingError];
  
  NSArray *cakeObjects = rootObject[@"Cake"];
  for (NSDictionary *eachCake in cakeObjects) {
    Cake *cake = [[Cake alloc]init];
    cake.flavor = eachCake[@"flavor"];
    cake.cakeDescription = eachCake[@"cakeDescription"];
    cake.sizePricing = eachCake[@"sizePricing"];
    cake.imageName = eachCake[@"image"];
    [self.cakes addObject:cake]; // add a single cake object to cakes array
  }
}
- (IBAction)closeButtonClicked:(id)sender {
  self.detailView.hidden = true;
  self.closeButton.highlighted = true;
  [sender setSelected:true];
  self.collectionView.userInteractionEnabled = true;
}

#pragma CollectionView

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return self.cakes.count; // 16
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  CakeCollectionViewCell *cell = (CakeCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CakeCell" forIndexPath:indexPath];
  Cake *currCake = self.cakes[indexPath.row];
  cell.cakeImageView.image = [UIImage imageNamed: currCake.imageName];
  cell.cakeName.text = currCake.flavor;
  self.cell = cell;
  return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
      //its iPhone. Find out which one
      CGSize result = [[UIScreen mainScreen] bounds].size;
      NSInteger screenHeight = result.height;
      switch (screenHeight) {
        case 480:
          //old
          return CGSizeMake(130.f, 120.f);
        case 568:
          // iphone 5
          return CGSizeMake(140.f, 150.f);
        case 667:
          // iphone 6
          return CGSizeMake(160.f, 160.f);
        case 736:
          return CGSizeMake(180.f, 170.f);
        default:
          break;
      }
    }
    else
    {
      return CGSizeMake(230.f, 210.f);
    }
  return CGSizeMake(0, 0);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  // show a bigger image?
  Cake *selectedCake = self.cakes[indexPath.row];
  NSLog(@"%@",selectedCake.flavor);
  self.largeImage.image = [UIImage imageNamed:selectedCake.imageName];
  self.detailTextView.text = selectedCake.cakeDescription;
  self.detailView.hidden = false;
  self.collectionView.userInteractionEnabled = false;
}


@end
