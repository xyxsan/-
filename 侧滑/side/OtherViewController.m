//
//  OtherViewController.m
//  side
//
//  Created by carbonzhao on 16/9/29. 技术合作qq:2178785450
//  Copyright © 2016年 appleDeveloper. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()

@end

@implementation OtherViewController
- (instancetype)init
{
    if (self = [super init])
    {
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        UINavigationItem *navItem = [self navigationItem];
        
        CGRect frame = CGRectMake(60, 0, [UIScreen mainScreen].bounds.size.width-120, 44.0);
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:frame];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        [titleLabel setText:@"二级视图"];
        [titleLabel setTextColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1]];
        [titleLabel setFont:[UIFont boldSystemFontOfSize:18.0]];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        [titleLabel setLineBreakMode:NSLineBreakByTruncatingTail];
        [navItem setTitleView:titleLabel];
        [titleLabel release];
        [pool drain];
        
        [self setLeftNavItemWithAction:@selector(leftBarButtonItemAction)];
    }
    return self;
}


- (void)setLeftNavItemWithAction:(SEL)action
{
    UINavigationItem *navItem = [self navigationItem];
    
    CGRect rect = CGRectMake(0, 5, 34, 34);
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize size = CGSizeMake(rect.size.height*scale, rect.size.height*scale);
    
    UIImage *image = nil;
    UIImage *imageH = nil;
    
    UIGraphicsBeginImageContext(size);
    
    UIBezierPath *bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(size.height-10*scale, 6)];
    [bezierPath addLineToPoint: CGPointMake(size.height/2-7*scale, size.height/2)];
    [bezierPath addLineToPoint: CGPointMake(size.height-10*scale, size.height-6)];
    [[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1] setStroke];
    bezierPath.lineWidth = 3*scale;
    [bezierPath stroke];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(size);
    bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(size.height-10*scale, 6)];
    [bezierPath addLineToPoint: CGPointMake(size.height/2-7*scale, size.height/2)];
    [bezierPath addLineToPoint: CGPointMake(size.height-10*scale, size.height-6)];
    [[UIColor colorWithRed:42/255.0 green:42/255.0 blue:42/255.0 alpha:1] setStroke];
    bezierPath.lineWidth = 3*scale;
    [bezierPath stroke];
    imageH = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:rect];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:imageH forState:UIControlStateHighlighted];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    [negativeSpacer setWidth:[[[UIDevice currentDevice] systemVersion] floatValue]>=7.0?-10:-5];
    [navItem setLeftBarButtonItems:[NSArray arrayWithObjects:negativeSpacer, leftItem, nil]];
    [negativeSpacer release];
    [leftItem release];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        [self setAutomaticallyAdjustsScrollViewInsets:NO];
    }
#endif
    [self.view setBackgroundColor:[UIColor whiteColor]];
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64);
    UITableView *tView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    [tView setBackgroundColor:[UIColor clearColor]];
    [tView setDelegate:self];
    [tView setDataSource:self];
    [tView setBackgroundView:nil];
    [tView setSeparatorColor:[UIColor clearColor]];
    [tView setShowsVerticalScrollIndicator:NO];
    [tView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:tView];
    [tView release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)leftBarButtonItemAction
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Navigation
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = 14;
    
    return count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    [cell setBackgroundColor:[UIColor whiteColor]];
    
    CGFloat height = [self tableView:tableView heightForRowAtIndexPath:indexPath];
    
    NSString *text = @"二级视图";
    CGRect frame = CGRectMake(10, 0, 85, height);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:[UIColor blackColor]];
    [label setFont:[UIFont systemFontOfSize:15.0]];
    [label setText:text];
    [label setTextAlignment:NSTextAlignmentLeft];
    [cell addSubview:label];
    [label release];
    
    return [cell autorelease];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
