//
//  PSIGauge.h
//  TurboRanger
//
//  Created by Thomas Saunders on 4/3/15.
//  Copyright (c) 2015 Modern Carpentry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSIGauge : UIView {
    
}

@property IBOutlet UIImageView *gaugeBG;
@property IBOutlet UIView *needleHolder;
@property IBOutlet UISlider *PSIChanger;
@property IBOutlet UIImageView *needleImage;
@property IBOutlet UILabel *PSILabel;

@property bool hasInitialized;
@property float PSI;

-(IBAction)PSIChanged:(id)sender;

@end
