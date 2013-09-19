//
//  iViewController.h
//  Stop
//
//  Created by Garanya on 12.08.13.
//  Copyright (c) 2013 i. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate> {
    UIPickerView *Picker_;
    NSArray* hours;
    NSArray* minuts;
}
@property (nonatomic, retain) NSTimer *timer;
@property (nonatomic, retain) IBOutlet UIPickerView *Picker;
- (IBAction)start:(id)sender;

@end
