//
//  AddEventViewController.h
//  icreated
//
//  Created by Artem Lobanov on 21/11/14.
//  Copyright (c) 2014 pispbsu. All rights reserved.
//

#define BAR_HEIGHT 64.0f

#define VIEW_PADDING 5.0f
#define NORMAL_VIEW_HEIGHT 40.0f

#define ACCESSORY_BUTTONS_COUNT 5
#define ACCESSORY_PADDING 1

#define DATEPICKER_MINUTE_INTERVAL 5

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "ActionSheetDatePicker.h"
#import "FDTakeController.h"
#import "PinPickerViewController.h"

typedef NS_ENUM(NSUInteger, DetailItemIndex) {
    DetailItemIndexCategory,
    DetailItemIndexPlace,
    DetailItemIndexTime,
    DetailItemIndexPhotos
};

@interface AddEventViewController : UIViewController <SWRevealViewControllerDelegate,
                                                      UIGestureRecognizerDelegate,
                                                      UITextViewDelegate,
                                                      FDTakeDelegate>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *menuButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *addButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *innerViewHeight;

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewHeight;

@property (retain) IBOutletCollection(UIView) NSArray *views;
@property (weak, nonatomic) IBOutlet UICollectionView *photosView;
@property (retain) IBOutletCollection(NSLayoutConstraint) NSArray *heights;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *photosViewHeight;
@property NSInteger firstFreeViewIndex;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@property BOOL accessoryViewEnabledFlag;
@property BOOL accessoryViewEnabledSubFlag;

@property (nonatomic, weak) IBOutlet UIView *accessoryView;
@property NSMutableArray *accessoryButtons;
@property NSArray *accessoryButtonSymbols;

@property PinPickerViewController *pinPickerViewController;

@property EventAnnotation *annotation;

@property ActionSheetDatePicker *datePicker;
@property FDTakeController *takeController;
@property NSDate *eventDate;

@property NSMutableArray *photos;

- (void)dismiss;

@end
