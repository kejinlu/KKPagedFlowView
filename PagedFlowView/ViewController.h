//
//  ViewController.h
//  PagedFlowView
//
//  Created by Lu Kejin on 3/5/12.
//  Copyright (c) 2012 geeklu.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PagedFlowView.h"

@interface ViewController : UIViewController<PagedFlowViewDelegate,PagedFlowViewDataSource>{
    NSArray *imageArray;
}

@property (nonatomic, strong) IBOutlet PagedFlowView *hFlowView;
@property (nonatomic, strong) IBOutlet PagedFlowView *vFlowView;
@property (nonatomic, strong) IBOutlet UIPageControl *hPageControl;

- (IBAction)pageControlValueDidChange:(id)sender;

@end
