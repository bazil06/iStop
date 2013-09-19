//
//  iViewController.m
//  Stop
//
//  Created by Garanya on 12.08.13.
//  Copyright (c) 2013 i. All rights reserved.
//

#import "iViewController.h"
#import "MediaPlayer/MediaPlayer.h"
#import "iAppDelegate.h"


@interface iViewController ()

@end

@implementation iViewController
@synthesize Picker=Picker_;

- (void)viewDidLoad
{
    [super viewDidLoad];
    hours = [[NSArray alloc] initWithObjects:@"0", @"1" ,@"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24", nil];
    minuts = [[NSArray alloc] initWithObjects:@"01", @"02", @"03", @"04", @"05", @"06", @"07", @"08", @"09", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29", @"30", @"31", @"32", @"33", @"34", @"35", @"36", @"37", @"38", @"39", @"40", @"41", @"42", @"43", @"44", @"45", @"46", @"47", @"48", @"49", @"50", @"51", @"52", @"53", @"54", @"55", @"56", @"57", @"58", @"59" , nil];
	// Do any additional setup after loading the view, typically from a nib.
}
#pragma mark -
#pragma mark Picker Datasourse Protocol

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return [hours count];
    }
    else {
        return [minuts count];
    }
}

#pragma mark -
#pragma mark Picker Delegat Protocol

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [hours objectAtIndex:row];
    }
    else {
        return [minuts objectAtIndex:row];
    }
    return nil;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)start:(id)sender {
    
    NSString* time_h = [hours objectAtIndex:[Picker_ selectedRowInComponent:0]];
    NSString* time_m = [minuts objectAtIndex:[Picker_ selectedRowInComponent:1]];
    int time_h1 = [time_h intValue];
    int time_m2 = [time_m intValue];
    int a = time_h1 * 60 * 60;
    int b = time_m2 *60;
    int c = a + b;
    self.timer = [NSTimer scheduledTimerWithTimeInterval: c
                                                  target:self
                                                selector:@selector(do:)
                                                userInfo:nil
                                                 repeats:NO];
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
   UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Внимание!"
                                                      message:@"Не блокируйте устройство!"
                                                     delegate:nil
                                            cancelButtonTitle:@"Я понял"
                                            otherButtonTitles:nil];
    [message show];
   }
-(void)do: (NSTimer *) timer
{
    MPMusicPlayerController *stop = [MPMusicPlayerController iPodMusicPlayer];
    [stop pause];
}
@end
