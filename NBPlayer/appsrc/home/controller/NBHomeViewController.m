//
//  NBHomeViewController.m
//  NBPlayer
//
//  Created by yushang on 2019/7/21.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "NBHomeViewController.h"
#import "NBHomeViewModel.h"
#import "NBVideoTableViewCell.h"
#import "VideoPlayViewController.h"


@interface NBHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong ,nonatomic) UITableView *tableView;



@end

@implementation NBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _homeVmodel = (NBHomeViewModel*)self.vmodel;
    

    [self setupUI];
    
    [self bindSignal];
    
}


-(void)bindSignal{
    @weakify(self)
    [self.homeVmodel.videsSuj subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        [self.tableView reloadData];
    }];
    
    [self.homeVmodel loadDocumentLibraryFile];
}


-(void)setupUI{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[NBVideoTableViewCell class] forCellReuseIdentifier:@"NBVideoTableViewCell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.homeVmodel.videoArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NBVideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NBVideoTableViewCell"];
    VideoMessage *meg = self.homeVmodel.videoArray[indexPath.row];
    
    [cell updateCell:meg];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //http://video-oss.qiaofangyun.com/uatTest_companyasdf123sa1s/video/2019/08/13/1565676969.292076/A5B177F0-0872-4785-ABB4-E3F245952754L0001.mp4
    VideoMessage *meg = self.homeVmodel.videoArray[indexPath.row];
    NSURL *fileUrl = [NSURL URLWithString:@"http://video-oss.qiaofangyun.com/uatTest_companyasdf123sa1s/video/2019/08/13/1565676969.292076/A5B177F0-0872-4785-ABB4-E3F245952754L0001.mp4"];
    VideoPlayViewModel *videovm = [[VideoPlayViewModel alloc]initWithUrl:fileUrl];
    VideoPlayViewController *videovc = [[VideoPlayViewController alloc]initwithViewModel:videovm];
    [self.navigationController pushViewController:videovc animated:true];
}



@end