//
//  RootViewController.m
//  side
//
//  Created by carbonzhao on 16/9/29. 技术合作qq:2178785450
//  Copyright © 2016年 appleDeveloper. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (instancetype)init
{
    if (self = [super init])
    {
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        UINavigationItem *navItem = [self navigationItem];

        CGRect frame = CGRectMake(60, 0, [UIScreen mainScreen].bounds.size.width-120, 44.0);
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:frame];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        [titleLabel setText:@"侧滑"];
        [titleLabel setTextColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1]];
        [titleLabel setFont:[UIFont boldSystemFontOfSize:18.0]];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        [titleLabel setLineBreakMode:NSLineBreakByTruncatingTail];
        [navItem setTitleView:titleLabel];
        [titleLabel release];
        [pool drain];
    }
    return self;
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


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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
    
    NSString *text = @"根视图";
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
    
    LeftViewController *ct = [[LeftViewController alloc] init];
    [ct.navigationItem setHidesBackButton:YES];
    [self.navigationController pushViewController:ct animated:YES];
    [ct release];
}
@end
