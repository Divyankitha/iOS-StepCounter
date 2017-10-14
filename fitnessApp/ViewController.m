//
//  ViewController.m
//  fitnessApp
//
//  Created by Divyankitha Raghava Urs on 10/5/17.
//  Copyright © 2017 Divyankitha Raghava Urs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self resetLabels];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CMPedometer *)pedometer {
    
    if (!_pedometer) {
        _pedometer = [[CMPedometer alloc]init];
    }
    return _pedometer;
}

- (IBAction)start:(id)sender
{
    self.progress.text = @"Gathering data...";
    [self resetLabels];
    
    // start live tracking
    [self.pedometer startPedometerUpdatesFromDate:[NSDate date] withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
        
        // this block is called for each live update
        [self updateLabels:pedometerData];
        
    }];
}

- (IBAction)stop:(id)sender
{
    //[self updateLabels:pedometerData];
    [self.pedometer stopPedometerUpdates];
    [self resetLabels];
}

- (void)resetLabels {
    
    // reset labels
    self.stepsLabel.text = @"nil";
    self.distanceLabel.text = @"nil";
    self.ascendLabel.text = @"nil";
    self.decendLabel.text = @"nil";
}

- (void)updateLabels:(CMPedometerData *)pedometerData {
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    formatter.maximumFractionDigits = 2;
    
    self.progress.text= nil;
    
    // step counting
    if ([CMPedometer isStepCountingAvailable]) {
        self.stepsLabel.text = [NSString stringWithFormat:@"%@", [formatter stringFromNumber:pedometerData.numberOfSteps]];
    } else {
        self.stepsLabel.text = @"Step Counter not available.";
    }
    
    // distance
    if ([CMPedometer isDistanceAvailable]) {
        self.distanceLabel.text = [NSString stringWithFormat:@"%@ meters", [formatter stringFromNumber:pedometerData.distance]];
    } else {
        self.distanceLabel.text = @"Distance estimate not available.";
    }
    
    // flights climbed
    if ([CMPedometer isFloorCountingAvailable] && pedometerData.floorsAscended) {
        self.ascendLabel.text = [NSString stringWithFormat:@"%@", pedometerData.floorsAscended];
    } else {
        self.ascendLabel.text = @"Floors ascended\nnot available.";
    }
    
    if ([CMPedometer isFloorCountingAvailable] && pedometerData.floorsDescended) {
        self.decendLabel.text =[NSString stringWithFormat:@"%@", pedometerData.floorsDescended];
    } else {
        self.decendLabel.text = @"Floors descended\nnot available.";
    }
    
}



@end
