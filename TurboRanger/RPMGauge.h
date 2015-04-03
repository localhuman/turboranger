//
//  RPMGauge.h
//  TurboRanger
//
//  Created by Thomas Saunders on 4/1/15.
//  Copyright (c) 2015 Modern Carpentry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RPMGauge : UIView {
    
}

@property IBOutlet UIImageView *gaugeBG;
@property IBOutlet UIView *needleHolder;
@property IBOutlet UISlider *rpmChanger;
@property IBOutlet UIImageView *needleImage;
@property IBOutlet UILabel *rpmLabel;

@property bool hasInitialized;
@property float RPM;

-(IBAction)rpmChanged:(id)sender;

@end
