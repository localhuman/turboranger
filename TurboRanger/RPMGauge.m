//
//  RPMGauge.m
//  TurboRanger
//
//  Created by Thomas Saunders on 4/1/15.
//  Copyright (c) 2015 Modern Carpentry. All rights reserved.
//



#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

#import "RPMGauge.h"
#include <QuartzCore/QuartzCore.h>

@implementation RPMGauge

@synthesize gaugeBG;
@synthesize needleHolder;
@synthesize RPM;
@synthesize rpmChanger;
@synthesize needleImage;
@synthesize rpmLabel;
@synthesize hasInitialized;

-(id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if( self) {
        NSLog(@"Created RPM Gauge");
        self.RPM=0.0;
    
    }
    
    return self;
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    if( ! self.hasInitialized){
        
        self.hasInitialized=YES;
        [self rpmChanged:nil];
    }
}



-(IBAction)rpmChanged:(id)sender{
    
    float newval = self.rpmChanger.value;
    self.RPM = newval;

    //input from arduino will be between 0 and 1023
    //we need to map that to the available range of the rpm slider
    //the number of radians between 0 and 8200 is about 5
    float mappedValue = (self.RPM / 1023.0f) * 4.75f;
    
    //get the display rpm ( number between 0 and 8600 )
    int displayRpm = mappedValue * 1810;
    
    [self.rpmLabel setText:[NSString stringWithFormat:@"%i RPM", displayRpm]];

    //then we subtract about 1 radian because 0 rpm is actual a negative radian value
    mappedValue = mappedValue - 0.60f;
    
    [UIView beginAnimations:nil context:NULL];
    
    CGAffineTransform t = CGAffineTransformMakeRotation(mappedValue);
    [self.needleHolder setTransform:t];
    [UIView commitAnimations];
}


@end
