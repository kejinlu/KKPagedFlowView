//
//  ViewController.m
//  KKPagedFlowViewDemo
//
//  Created by Luke on 1/15/16.
//  Copyright © 2016 Taobao.com. All rights reserved.
//

#import "ViewController.h"
#import "PagedFlowView.h"

@interface ViewController ()<PagedFlowViewDelegate,PagedFlowViewDataSource>
@property(nonatomic, strong) IBOutlet PagedFlowView *hFlowView;
@property(nonatomic, strong) IBOutlet PagedFlowView *vFlowView;
@property(nonatomic, strong) IBOutlet UIPageControl *hPageControl;
@property(nonatomic, strong) NSArray *imageArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.imageArray = [[NSArray alloc] initWithObjects:@"0.tiff",@"1.tiff",@"2.tiff",@"3.tiff",@"4.tiff",@"5.tiff",@"6.tiff",@"7.tiff",nil];
    
    self.hFlowView.delegate = self;
    self.hFlowView.dataSource = self;
    self.hFlowView.pageControl = self.hPageControl;
    self.hFlowView.minimumPageAlpha = 0.3;
    self.hFlowView.minimumPageScale = 0.9;
    
    self.vFlowView.delegate = self;
    self.vFlowView.dataSource = self;
    self.vFlowView.minimumPageAlpha = 0.4;
    self.vFlowView.minimumPageScale = 0.8;
    self.vFlowView.orientation = PagedFlowViewOrientationVertical;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark PagedFlowView Delegate
- (CGSize)sizeForPageInFlowView:(PagedFlowView *)flowView;{
    return CGSizeMake(200, 150);
}

- (void)flowView:(PagedFlowView *)flowView didScrollToPageAtIndex:(NSInteger)index {
    NSLog(@"Scrolled to page # %ld", (long)index);
}

- (void)flowView:(PagedFlowView *)flowView didTapPageAtIndex:(NSInteger)index{
    NSLog(@"Tapped on page # %ld", (long)index);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark PagedFlowView Datasource
//返回显示View的个数
- (NSInteger)numberOfPagesInFlowView:(PagedFlowView *)flowView{
    return [self.imageArray count];
}

//返回给某列使用的View
- (UIView *)flowView:(PagedFlowView *)flowView cellForPageAtIndex:(NSInteger)index{
    UIImageView *imageView = (UIImageView *)[flowView dequeueReusableCell];
    if (!imageView) {
        imageView = [[UIImageView alloc] init];
        imageView.layer.cornerRadius = 6;
        imageView.layer.masksToBounds = YES;
    }
    imageView.image = [UIImage imageNamed:[self.imageArray objectAtIndex:index]];
    return imageView;
}

- (IBAction)pageControlValueDidChange:(id)sender {
    UIPageControl *pageControl = sender;
    [self.hFlowView scrollToPage:pageControl.currentPage];
    [self.vFlowView scrollToPage:pageControl.currentPage];
}


@end
