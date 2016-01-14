//
//  QuranicTableViewCell.m
//  Radio
//
//  Created by Arie on 12/6/15.
//  Copyright © 2015 Dalvk Studio. All rights reserved.
//

#import "QuranicTableViewCell.h"
#import "Quranic/QuranicDataModels.h"
@implementation QuranicTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (void)setPost:(QuranicPosts *)post {
   
    NSRange range = [post.titlePlain rangeOfString:@"("];
    self.quranicLabelContent.text = [post.titlePlain substringToIndex:range.location];
    self.surahAndAyatLabel.text = [self processTheSurah:post.titlePlain];;
    
}
- (NSString *)processTheSurah:(NSString *)source {
    
     NSArray *surahQuranArray = @[@"Al-Fatihah",@"Al-Baqoroh",@"Ali Imran",@"An-Nisa",@"Al-Ma'idah",@"Al-An'am",@"Al-A'raf",@"Al-Anfal",@"At-Taubah",@"Yunus",@"Hud",@"Yusuf",@"Ar-Ra'd",@"Ibrahim",@"Al-Hijr",@"An-Nahl",@"Al-Isra",@"Al-Kahf",@"Maryam",@"Ta Ha",@"Al-Anbiya",@"Al-Hajj",@"Al-Mu'minun",@"An-Nur",@"Al-Furqon",@"Asy-Syu'ara'",@"An-Naml",@"Al-Qasas",@"Al-Ankabut",@"Ar-Rum",@"Luqman",@"As-Sajdah",@"Al-Ahzab",@"Saba'",@"Fatir",@"Ya'Sin",@"As-Saffaat",@"Sad",@"Az-Zumar",@"Al-Mu'min",@"Fussilat",@"Asy-Syura",@"Az-Zhukruf",@"Ad-Dukhan"@"Al-Jasiyah",@"Al-Ahqaf",@"Muhammad",@"Al-Fath",@"Al-Hujurat",@"Qaf",@"Adzariat",@"At-Tur",@"An-Najm",@"Al-Qomar",@"Ar-rahman",@"Al-Waqi'ah",@"Al-Hadid",@"Al-Mujadilah",@"Al-Hasyr",@"Al-Mumtahannah",@"As-Saff",@"Al-Jumu'ah",@"Al-Munafiqun",@"At-Tagabun",@"At-Talaq",@"At-Tahrim",@"Al-Mulk",@"Al-Qalam",@"Al-Haqqah",@"Al-Ma'arij",@"Nuh",@"Al-Jinn",@"Al-Muzzammil",@"Al-Muddassir",@"Al-Qiyamah",@"Al-Insan",@"Al-Mursalat",@"An-Naba'",@"An-Nazi'at",@"'Abasa",@"At-Takwir",@"Al-Infitar",@"Al-Mutaffifin",@"Al-Inshiqaq",@"Al-Burut",@"At-Tariq",@"Al-A'la",@"Al-Ghasiyah",@"Al-Fajr",@"Al-Balad",@"Ash-Shams",@"Al-Lail",@"Ad-Duhaa",@"Ash-Sharh",@"At-Tin",@"Al-Alaq",@"Al-Qadr",@"Al-Bayyinah",@"Az-Zalzalah",@"Al-'Adiyat",@"Al-Qariah",@"At-Takathur",@"Al-Asr",@"Al-Humazah",@"Al-Fil",@"Qurays",@"Al-Ma'un",@"Al-Kautsar",@"Al-Kafirun",@"Am-Nasr",@"Al-Lahab",@"Al-Ikhlas",@"Al-Falaq",@"An-Nas"];
    NSRange start = [source rangeOfString:@"("];
    NSRange end = [source rangeOfString:@":"];
    
    NSRange startAyat = [source rangeOfString:@":"];
    NSRange endAyat = [source rangeOfString:@")"];
    NSString *shortString = [source substringWithRange:NSMakeRange(start.location, end.location - start.location)];
    NSString *shortStringAyat = [source substringWithRange:NSMakeRange(startAyat.location, endAyat.location - startAyat.location)];
    NSInteger surat = [[shortString stringByReplacingOccurrencesOfString:@"(" withString:@""] integerValue];
    return [NSString stringWithFormat:@"%@%@",[surahQuranArray objectAtIndex:surat-1],[shortStringAyat stringByReplacingOccurrencesOfString:@")" withString:@""]];
}
@end
