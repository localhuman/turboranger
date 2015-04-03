//
//  PSIGauge.m
//  TurboRanger
//
//  Created by Thomas Saunders on 4/3/15.
//  Copyright (c) 2015 Modern Carpentry. All rights reserved.
//

#import "PSIGauge.h"
#include <QuartzCore/QuartzCore.h>

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)



@implementation PSIGauge




@synthesize gaugeBG;
@synthesize needleHolder;
@synthesize PSI;
@synthesize PSIChanger;
@synthesize needleImage;
@synthesize PSILabel;
@synthesize hasInitialized;

-(id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if( self) {
        NSLog(@"Created PSI Gauge");
        self.PSI=0.0;
        
    }
    
    return self;
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    if( ! self.hasInitialized){
        
        self.hasInitialized=YES;
        [self PSIChanged:nil];
    }
}



-(IBAction)PSIChanged:(id)sender{
    
    float newval = self.PSIChanger.value;
    self.PSI = newval;
    
    //input from arduino will be between 0 and 1023
    //we need to map that to the available range of the PSI slider
    //the number of radians between 0 PSI and 35 PSI is about 4.75
    float mappedValue = (self.PSI / 1023.0f) * 4.75f;
    
    //get the display afr ( number between 10 and 18.6 )
    double displayPSI = (mappedValue * 7.36);
    
    [self.PSILabel setText:[NSString stringWithFormat:@"%.01f PSI", displayPSI]];
    
    //then we subtract about .5 radian because 0 PSI is actual a negative radian value
    mappedValue = mappedValue - 0.56f;
    
    [UIView beginAnimations:nil context:NULL];
    
    CGAffineTransform t = CGAffineTransformMakeRotation(mappedValue);
    [self.needleHolder setTransform:t];
    [UIView commitAnimations];
}



@end
