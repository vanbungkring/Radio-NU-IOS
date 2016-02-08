//
//  StreamingViewController.m
//  Radio
//
//  Created by Arie on 12/5/15.
//  Copyright © 2015 Dalvk Studio. All rights reserved.
//

#import "StreamingViewController.h"
#import "StreamingView.h"
#import <StreamingKit/STKAudioPlayer.h>
@interface StreamingViewController ()
@property (nonatomic,strong) StreamingView *view;
@property (nonatomic,strong) STKAudioPlayer* audioPlayer;
@end

@implementation StreamingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.audioPlayer= [[STKAudioPlayer alloc] init];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)playDidTapped:(id)sender {
    self.view.playButton.selected = !self.view.playButton.selected;
    if (self.view.playButton.selected) {
        [self.view.playButton setTitle:@"Pause" forState:UIControlStateNormal];
        [self.audioPlayer play:@"http://119.2.80.21:8001/;stream.nsv&type=mp3"];
    }
    else {
         [self.view.playButton setTitle:@"Play" forState:UIControlStateNormal];
        [self.audioPlayer stop];
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
