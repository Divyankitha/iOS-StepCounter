//
//  ViewController.h
//  fitnessApp
//
//  Created by Divyankitha Raghava Urs on 10/5/17.
//  Copyright © 2017 Divyankitha Raghava Urs. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreMotion;
@interface ViewController : UIViewController

@property (strong, nonatomic) CMPedometer *pedometer;
@property (weak, nonatomic) IBOutlet UILabel *stepsLabel;
@property (weak, nonatomic) IBOutlet UILabel *ascendLabel;
@property (weak, nonatomic) IBOutlet UILabel *decendLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@property (weak, nonatomic) IBOutlet UILabel *progress;

- (IBAction)start:(id)sender;
- (IBAction)stop:(id)sender;

@end

