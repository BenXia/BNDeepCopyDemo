//
//  HomePageVC.m
//  TestTemplateProject
//
//  Created by Ben on 2017/5/23.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "HomePageVC.h"
#import "DeepCopyTestVC.h"

typedef void(^Block)(void);

static const CGFloat kTableViewCellHeight = 60.0f;

@interface HomePageCellModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) Block didSelectCellHandleBlock;

@end

@implementation HomePageCellModel

@end

@interface HomePageVC () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray <HomePageCellModel *> *dataSourceArray;

@end

@implementation HomePageVC

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    HomePageCellModel *model1 = [HomePageCellModel new];
    model1.title = @"深拷贝";
    model1.subTitle = @"实现 NSDeepCopying 深拷贝协议";
    
    @weakify(self);
    model1.didSelectCellHandleBlock = ^{
        @strongify(self);
        DeepCopyTestVC *vc = [[DeepCopyTestVC alloc] init];
        
        [self.navigationController pushViewController:vc animated:YES];
        
    };
    self.dataSourceArray = [NSArray arrayWithObjects:model1, nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"首页";
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellReuseIdentifier = @"HomePageCellReuseIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellReuseIdentifier];
    }
    
    cell.textLabel.textColor = [UIColor darkTextColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    cell.textLabel.text = [self.dataSourceArray objectAtIndex:indexPath.row].title;
    cell.detailTextLabel.text = [self.dataSourceArray objectAtIndex:indexPath.row].subTitle;
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTableViewCellHeight;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Block clickHandleBlock = [self.dataSourceArray objectAtIndex:indexPath.row].didSelectCellHandleBlock;
    if (clickHandleBlock) {
        clickHandleBlock();
    }
}


@end
