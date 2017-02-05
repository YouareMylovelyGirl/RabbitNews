//
//  ViewController.m
//  TRProject
//
//  Created by yingxin on 16/7/10.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "ViewController.h"
#import "NetManager.h"
#import "RabbitItem.h"
#import "OnePicCell.h"
#import "ThreePicCell.h"
#import "DetailWebController.h"
#import <iCarousel.h>
@interface ViewController ()<iCarouselDelegate,iCarouselDataSource>
//装模型的数组
@property (nonatomic, strong) NSMutableArray<RabbitDataListItem *> *rabbitList;

@property (nonatomic, strong) NSArray<RabbitDataListItem *> *rabbitDataList;

@property (nonatomic, strong) NSArray<RabbitDataIndexpicItem *> *dataIndexList;

@property (nonatomic, assign) NSInteger pageNumber;

@property (nonatomic, strong) NSArray *childPath;

@property (nonatomic, strong) UITableViewCell *cell;

@property (nonatomic, strong) UILabel *headerText;

//头部视图的view
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) iCarousel *ic;
@property (nonatomic, strong) UIPageControl *pc;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) NSArray<RabbitDataIndexpicItem *> *litpic;


@end
@implementation ViewController

- (instancetype)initWithIndex:(NSInteger)index
{
    if (self = [super init]) {
        self.index = index;
    }
    return self;
}

- (NSMutableArray *)rabbitList {
    if(_rabbitList == nil) {
        _rabbitList = [[NSMutableArray alloc] init];
    }
    return _rabbitList;
}

- (NSArray *)childPath {
    if(_childPath == nil) {
        _childPath = [[NSArray alloc] init];
        _childPath = @[
                       @"appid=1&classmore=indexpic&appid=1&appver=2.1",
                       @"appid=1&class=heronews&mod=八卦&appid=1&appver=2.1",
                       @"appid=1&dtid=83623&classmore=indexpic&appid=1&appver=2.1",
                       @"appid=1&dtid=31537&classmore=indexpic&appid=1&appver=2.1",
                       @"appid=1&dtid=31538&classmore=indexpic&appid=1&appver=2.1",
                       @"appid=1&dtid=31528&classmore=indexpic&appid=1&appver=2.1",
                       @"appid=1&dtid=91821&appid=1&appver=2.1",
                       @"appid=1&dtid=57067&appid=1&appver=2.1",
                       @"appid=1&type=pic&dtid=83623,31528,31537,31538,57067,91821&appid=1&appver=2.1",
                       @"appid=1&type=video&dtid=83623,31528,31537,31538,57067,91821&appid=1&appver=2.1",
                       @"appid=1&type=guide&dtid=83623,31528,31537,31538,57067,91821&appid=1&appver=2.1",
                       @"appid=1&class=heronews&mod=幻化&appid=1&appver=2.1",
                       @"appid=1&dtid=0&class=heronews&mod=趣闻&classmore=indexpic&appid=1&appver=2.1",
                       @"appid=1&class=cos&mod=cos&classmore=indexpic&dtid=0&appid=1&appver=2.1",
                       @"appid=1&class=heronews&mod=美女&classmore=indexpic&typechild=cos1&appid=1&appver=2.1"
                       ];
    }
    return _childPath;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.pageNumber = 11;
    typeof(self) weakSelf = self;
    [self.tableView addHeaderRefresh:^{
        [NetManager GETRabbitItemWithChildpath:weakSelf.childPath[weakSelf.index] startnumber:@"" completionHandler:^(RabbitItem *rabbitPlay, NSError *error) {
            [weakSelf.tableView endHeaderRefresh];
            if (!error) {
                weakSelf.rabbitDataList = rabbitPlay.data.list;
                weakSelf.dataIndexList = rabbitPlay.data.indexpic;
                [weakSelf.rabbitList removeAllObjects];
                [weakSelf.rabbitList addObjectsFromArray:weakSelf.rabbitDataList];
                [weakSelf.tableView reloadData];
                
                weakSelf.litpic = rabbitPlay.data.indexpic;
                [weakSelf.timer invalidate];
                if (self.litpic.count > 0) {
                    weakSelf.tableView.tableHeaderView = weakSelf.headerView;
                    if (self.litpic.count == 1) {
                        weakSelf.ic.scrollEnabled = NO;
                        weakSelf.pc = nil;
                    } else {
                        weakSelf.pc.numberOfPages = weakSelf.litpic.count;
                    }
                    [weakSelf.ic reloadData];
                    
                    weakSelf.timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
                        [weakSelf.ic scrollToItemAtIndex:weakSelf.ic.currentItemIndex + 1 animated:YES];
                    } repeats:YES];
                }
                else
                {
                    weakSelf.tableView.tableHeaderView = nil;
                }
                
                if (weakSelf.rabbitDataList.count < 10) {
                    [weakSelf.tableView endRefreshWithNoMoreData];
                }
                else
                {
                    [weakSelf.tableView resetNoMoreData];
                }
            }
        }];
    }];
    [self.tableView beginHeaderRefresh];
    NSString *startNum = [NSString stringWithFormat:@"&start=%ld",self.pageNumber];
    [self.tableView addFooterRefresh:^{
        [NetManager GETRabbitItemWithChildpath:weakSelf.childPath[weakSelf.index] startnumber:startNum completionHandler:^(RabbitItem *rabbitPlay, NSError *error) {
            [weakSelf.tableView endFooterRefresh];
            if (!error) {
                weakSelf.pageNumber += 10;
                [weakSelf.rabbitList addObjectsFromArray:rabbitPlay.data.list];
                [weakSelf.tableView reloadData];
                if (weakSelf.rabbitDataList.count < 10) {
                    [weakSelf.tableView endRefreshWithNoMoreData];
                }
            }
        }];
    }];
    
    [self.tableView registerClass:[OnePicCell class] forCellReuseIdentifier:@"OnePicCell"];
    [self.tableView registerClass:[ThreePicCell class] forCellReuseIdentifier:@"ThreePicCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rabbitList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RabbitDataListItem *listItem = self.rabbitList[indexPath.row];
    if (self.rabbitList[indexPath.row].showitem.count != 0) {
        ThreePicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThreePicCell" forIndexPath:indexPath];
        [cell.firIV setImageURL:[NSURL URLWithString:listItem.showitem[0].pic]];
        [cell.secIV setImageURL:[NSURL URLWithString:listItem.showitem[1].pic]];
        [cell.thiIV setImageURL:[NSURL URLWithString:listItem.showitem[2].pic]];
        
        cell.titleLb.text = listItem.title;
        cell.numberOfPeo.text = [NSString stringWithFormat:@"%@人浏览",listItem.click];
        
        return cell;
    }
    else
    {
        OnePicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OnePicCell" forIndexPath:indexPath];
        [cell.iconIV setImageURL:[NSURL URLWithString:listItem.litpic]];
        cell.titleLb.text = listItem.title;
        cell.detailLb.text = listItem.des;
        cell.numberOfpeo.text = [NSString stringWithFormat:@"%@人浏览吧",listItem.click];
        return cell;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //    id obj = self.rabbitList[indexPath.row];
    //    if ([obj isKindOfClass:[ThreePicCell class]]) {
    //        return 180;
    //    }
    //
    //       return 100;
    //
    if (self.rabbitList[indexPath.row].showitem.count != 0)
    {
        return 190;
    }
    return 100;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailWebController *detailVC = [[DetailWebController alloc]initWithDetailPath:self.rabbitList[indexPath.row].html5];
    [self.navigationController pushViewController:detailVC animated:YES];
}


#pragma mark - 头部滚动视图懒加载
- (UIView *)headerView {
    if(_headerView == nil) {
        _headerView = [[UIView alloc] init];
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, [UIScreen mainScreen].bounds.size.width / 2 + 30) ];
        self.ic = [[iCarousel alloc] init];
        [self.headerView addSubview:self.ic];
        [self.ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
            make.bottom.offset(-30);
            
        }];
        self.ic.delegate = self;
        self.ic.dataSource = self;
        self.ic.scrollSpeed = 0;
        
        
        UIView *labelView = [[UIView alloc]init];
        labelView.backgroundColor = [UIColor grayColor];
        [self.headerView addSubview:labelView];
        [labelView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.offset(0);
            make.top.mas_equalTo(self.ic.mas_bottom);
        }];
        
        self.pc = [[UIPageControl alloc] init];
        [labelView addSubview:self.pc];
        [self.pc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(5);
        }];
        
        self.headerText = [[UILabel alloc]init];
        self.headerText.textColor = [UIColor orangeColor];
        [labelView addSubview:self.headerText];
        [self.headerText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(10);
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(self.pc.mas_left).offset(-5);
        }];
        
    }
    return _headerView;
}

- (NSArray<RabbitDataIndexpicItem *> *)litpic {
    if(_litpic == nil) {
        _litpic = [[NSArray<RabbitDataIndexpicItem *> alloc] init];
    }
    return _litpic;
}

#pragma mark - ic Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.litpic.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (!view) {
        view = [[UIView alloc]initWithFrame:carousel.bounds];
        UIImageView *iconIV = [UIImageView new];
        [view addSubview:iconIV];
        [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        iconIV.contentMode = UIViewContentModeScaleAspectFill;
        iconIV.clipsToBounds = YES;
        iconIV.tag = 1000;
    }
    UIImageView *iconIV = [view viewWithTag:1000];
    [iconIV setImageURL:[NSURL URLWithString:self.rabbitList[index].litpic]];
    
    self.headerText.text = self.dataIndexList[index].title;
    
    
    return view;
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    self.pc.currentPage = carousel.currentItemIndex;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    DetailWebController *detailVC = [[DetailWebController alloc]initWithDetailPath:self.rabbitList[index].html5];
    [self.navigationController pushViewController:detailVC animated:YES];
}
@end
