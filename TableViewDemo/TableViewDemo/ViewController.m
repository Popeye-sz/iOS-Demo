//
//  ViewController.m
//  TableViewDemo
//
//  Created by 申政 on 2022/5/10.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}

#pragma mark dataSource
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                                       reuseIdentifier:@"TableCell"];
    }
    cell.showsReorderControl = YES;
    cell.textLabel.text = [NSString stringWithFormat:@"主标题 - %@", @(indexPath.section)];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"副标题 - %@", @(indexPath.row)];
    cell.imageView.image = [UIImage imageNamed:@"111"];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 16;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"Header %@", @(section)];
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"Footer %@", @(section)];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

#pragma mark delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.title = [NSString stringWithFormat:@"%@ - %@", @(indexPath.section), @(indexPath.row)];
    [self.navigationController pushViewController:vc animated:NO];
}

@end
