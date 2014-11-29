//
//  TestsqtViewController.m
//  TestView
//
//  Created by Teru on 2013/10/03.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import "TestsqtViewController.h"
#import "sqtViewController.h"
#import "Data.h"
#import "ScoreData.h"
#import "Word.h"
#import "Score.h"
#import "TestWord.h"
#import "CorrectAnswerData.h"
#import "TestWords.h"
#import "TestWordsData.h"
#import "HelpViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface TestsqtViewController ()

@property (nonatomic, assign) int lookOrWrite;

@end

@implementation TestsqtViewController
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:0.9]
#define UIColorAlphaFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:0.6]
#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

@synthesize dismissblock;
@synthesize checkTextField;
@synthesize wordNo;
@synthesize correctName;
@synthesize speechSynthesizer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        if (self) {
            // Custom initialization
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars=NO;
    self.automaticallyAdjustsScrollViewInsets=NO;
    */
    
    if ([wordNo isEqualToString:@"1"]) {
        
        TestWord *word1 = [TestWord new];
        word1.name = @"afraid";
        word1.detail = @"形容詞 more ～; most ～\n~を恐れている, ~がこわい, いやだ\n\nこわくて~できない, 遠慮して~できない\n\n~するのではないかと心配する, 恐れる\nI didn't mention it because I was ___ of upsetting him.\n彼の気を悪くすると思って、その事に触れなかった。\n\n~を気にかける, 心配する";
        word1.hatuon = @"əfréɪd";
        word1.reibun = @"I didn't mention it because I was afraid of upsetting him.";
        
        TestWord *word2 = [TestWord new];
        word2.name = @"agree";
        word2.detail = @"動詞 ～s/-z/; ～d/-d/; ～ing\n自動詞\n意見が同じである, 賛意を示す; ~かということに同感する\nWe ___d to leave at once.\nすぐに離れる事に賛成しました。\n\n~を正しいと認める\n\n~に同意する, ~を承諾[承知]する\n\n~を決定する, ~で合意に達する ~することに取り決める\n\n他動詞\n意見が同じである, 賛意を示す\n\n~を取り決める";
        word2.hatuon = @"əɡríː";
        word2.reibun = @"We agreed to leave at once.";
        
        TestWord *word3 = [TestWord new];
        word3.name = @"angry";
        word3.detail = @"形容詞 __ier; __iest/more ～; most ～\n~に怒って, 腹を立てて\nHis imperious look makes us ___.\n彼の横暴な様子に腹が立つ。\nDon't be ___ over such trivial matters.\nそんな些細な事で怒らないで。\n\n怒った口調、表情; 怒った様子の人";
        word3.hatuon = @"ǽŋɡri";
        word3.reibun = @"His imperious look makes us angry.     Don't be angry over such trivial matters.";
        
        TestWord *word4 = [TestWord new];
        word4.name = @"arrive";
        word4.detail = @"動詞 ～s/-z/; ～d/-d/; ___ing\n自動詞\n到着する, 着く ; 来る, 足を踏み入れる\nWe shall ___ soon after.\nすぐに着きます。\nYou must ___ at the airport two hours early.\n2時間前には空港に到着してください。\n\n~が届く, 配達される ; 料理が運ばれる";
        word4.hatuon = @"əráɪv";
        word4.reibun = @"We shall arrive soon after.     You must arrive at the airport two hours early.";
        
        TestWord *word5 = [TestWord new];
        word5.name = @"attack";
        word5.detail = @"名詞 複 ～s/-s/\n攻撃, 襲撃, 暴力\n\n批判, 酷評\n\n発病, 発作; 突然襲われること\n\n動詞 ～s/-s/; ～ed/-t/; ～ing\n~を襲う ; ~を攻撃する\nOnce you show any sign of fear, he will ___ you.\n恐怖を感じているのを察せられると襲われるぞ。\n\n~を痛烈に批判する\nThere is a newspaper article ___ing the Prime Minister.\n新聞に首相を批判する記事がある。\n\n問題に取り組む, 着手する\n\n~を冒す, ~に害を与える";
        word5.hatuon = @"ətǽk";
        word5.reibun = @"Once you show any sign of fear, he will attack you.     There is a newspaper article attacking the Prime Minister.";
        
        TestWord *word6 = [TestWord new];
        word6.name = @"bottom";
        word6.detail =  @"名詞 複 ～s/-z/\n一番下, 最下部; ふもと; 降りたところ, 下\n\n底\nThere are tea leaves in the ___ of my cup.\nコップの底に茶葉があります。\n\n末席, 下っ端; びり, 最下位 \nHe was always ___ of the class in maths.\n彼の数学の成績はいつもクラスで最下位だった。\n\n奥; 行き止まり; 端\n\n原因, 根本; 真相\n\n形容詞\n底の; 底にいる";
        word6.hatuon = @"bɑ́təm|bɔ́t-";
        word6.reibun = @"There are tea leaves in the bottom of my cup.     He was always bottom of the class in maths.";
        
        TestWord *word7 = [TestWord new];
        word7.name = @"clever";
        word7.detail = @"形容詞 ～er; ～est/more ～; most ～\n利口な, 賢い, 覚え[理解]が早い\nHe's so ___, he makes me feel inferior.\n彼はとても賢いので劣等感を感じる。\n\n抜け目ない, ずる賢い\n\n上手な, 器用な\nHe is ___ at arithmetic.\n彼は算数が得意だ。\n\n巧みな, うまくできた; 気がきいた";
        word7.hatuon = @"klévər";
        word7.reibun = @"He's so clever, he makes me feel inferior.     He is clever at arithmetic.";
        
        TestWord *word8 = [TestWord new];
        word8.name = @"cruel";
        word8.detail = @"形容詞 ～er; ～est\n残酷な, 冷酷な, 無慈悲な\nHe is a ___ assassin.\n彼は冷酷な殺し屋だ。\n\n~するのは残酷だ, ひどい, 忍びない\n\nつらい, 痛ましい, 悲惨な, ひどい\nThe death of their daughter was a ___ blow.\n娘の死は彼らにとって辛い出来事であった。";
        word8.hatuon = @"krú(ː)əl";
        word8.reibun = @"He is a cruel assassin.     The death of their daughter was a cruel blow.";
        
        TestWord *word9 = [TestWord new];
        word9.name = @"finally";
        word9.detail = @"副詞\nとうとう, ついに; 結局\nAfter several delays, he ___ set out at 8 o'clock.\n数回の遅延で彼はようやく8時に出発した。\n\n終わりに当たって, 最後になりますが\n\n最終的に, 決定的に\nIt's not ___ settled yet.\nまだ最終決定ではない。";
        word9.hatuon = @"fáɪn(ə)li";
        word9.reibun = @"After several delays, he finally set out at 8 o'clock.     It's not finally settled yet.";
        
        TestWord *word10 = [TestWord new];
        word10.name = @"hide";
        word10.detail = @"動詞 ～s/-dz/; hid/hɪd/; ___den/hɪ́d(ə)n/, hid; ___ing\n他動詞\n~を隠す; ~をかくまう\nI ___ the message in a cleave in the rock.\nメッセージを岩の割れ目に隠す。\n\n~を伏せておく, 秘密にする, 隠しておく\nThe future is ___den from us.\n未来の事は誰にも分からない。\n\n自動詞\n隠れる, ひそむ; 潜伏する";
        word10.hatuon = @"haɪd";
        word10.reibun = @"I hide the message in a cleave in the rock.     The future is hidden from us.";
        
        TestWord *word11 = [TestWord new];
        word11.name = @"hunt";
        word11.detail =  @"動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n~を狩る, ~の狩猟をする\nWolves ___ in packs.\n狼は群れで狩りをする。\n\n~を探し求める; ~を追跡する, 捜す\nJohn set out that day to ___ for work.\nその日ジョンは仕事を探しに出かけた。\n\nくまなく捜す\n\n自動詞\n狩りをする\n\n探し求める, 捜す\n\n名詞複～s/-ts/\n探索, 捜索; 追跡; 探求";
        word11.hatuon = @"hʌnt";
        word11.reibun = @"Wolves hunt in packs.     John set out that day to hunt for work.";
        
        TestWord *word12 = [TestWord new];
        word12.name = @"lot";
        word12.detail =  @"名詞 複～s/-ts/\nたくさん, どっさり, 多数, 多量, 大量\nI have several ___s of essays to mark this weekend.\n今週末は添削するエッセイがかなりある。\n\nずっと, だいぶ\n\n大いに~; よく~ \n\n一口, 一組, 一山; 商品番号; ロット\n___ 99 is a pair of antique vases.\n99番の競売品は骨董品の壷だ。";
        word12.hatuon = @"lɑt|lɔt";
        word12.reibun = @"I have several lots of essays to mark this weekend.     Lot 99 is a pair of antique vases.";
        
        TestWord *word13 = [TestWord new];
        word13.name = @"middle";
        word13.detail =  @"名詞 複～s/-z/\n中央; 中央部分, 真ん中; 中間, 中途\nHe planted roses in the ___ of the garden.\n彼はバラを庭の真ん中に植えた。\n\n形容詞 比較なし\n真ん中の, 中央の; 中間の, 中頃の;中位の, 平均の\nThe man has reached ___ age.\nその男性は既に中年だ。";
        word13.hatuon = @"mɪ́d(ə)l";
        word13.reibun = @"He planted roses in the middle of the garden.     The man has reached middle age.";
        
        TestWord *word14 = [TestWord new];
        word14.name = @"moment";
        word14.detail =  @"名詞 複～s/-ts/\n瞬間, 短時間; ちょっと, しばらく \nI'll be back in a ___.\nすぐに戻ります。\n\n時期, 機会; 場合\nThe big ___ has come at last!\nついにこの時が来た！";
        word14.hatuon = @"móʊmənt";
        word14.reibun = @"I'll be back in a moment.     The big moment has come at last!";
        
        TestWord *word15 = [TestWord new];
        word15.name = @"pleased";
        word15.detail =  @"形容詞more ～; most ～\n~して[できて]うれしい, 幸せである, 満足している\nHe was ___ with their warm welcome.\n彼らの熱烈な歓迎が嬉しかった。\n\n喜んで, 気に入って;  満足して";
        word15.hatuon = @"pliːzd";
        word15.reibun = @"He was pleased with their warm welcome.";
        
        TestWord *word16 = [TestWord new];
        word16.name = @"promise";
        word16.detail =  @"動詞～s/-ɪz/; ～d/-t/; -ising\n他動詞\n~すると約束する[請け合う]; ~ということを約束する; ~ということを楽しみにする\nI ___ never to reveal his secret.\n秘密は漏らさないと約束する。\n\n~を与えると約束する\n\n~を心待ちにする\n\n~すると約束する\n\n事が起こりそうなことを示す; ~しそうである\n\n見込みがある\n\n名詞 複～es/-ɪz/\n約束\n\n見込み, 有望; 気配, 兆し";
        word16.hatuon = @"prɑ́məs|prɔ́m-";
        word16.reibun = @"I promise never to reveal his secret.";
        
        TestWord *word17 = [TestWord new];
        word17.name = @"reply";
        word17.detail =  @"動詞___ies/-z/; ___ied/-d/; ～ing\n自動詞\n答える, 返事をする, 応答する\nHe gave me no chance to ___ to his question.\n彼は私に質問に答える機会をくれなかった。\n\n答える, 応じる, 応酬する, 応戦する\n\n他動詞\n~と答える; ~と答える\n\n名詞 複___ies/-z/\n返事, 応答\nThank you for your prompt ___ to e-mail.\nメールの早急な返信ありがとうございます。\n\n応答, 応酬, 応戦";
        word17.hatuon = @"rɪpláɪ";
        word17.reibun = @"He gave me no chance to reply to his question.     Thank you for your prompt reply to e-mail.";
        
        TestWord *word18 = [TestWord new];
        word18.name = @"safe";
        word18.detail =  @"形容詞～r; ～st\n安全な, 危険な目に遭わない; ~しても大丈夫だ, 差し支えない\n\n安全な, 危険がない ; 無事な, 無傷な; 安心した; 自信[確信]のある; 信頼が置ける, 注意深い\nThe rescuers brought the climbers back ___ and sound.\nレスキュー隊員は登山者を無事救出した。\n\n安全な; 危険の及ばない距離\nThere is no ___ landing on that coast.\nその海岸に上陸するのは危険だ。\n\n方法が成功しそうな, リスクが少ない\n\n話題、作品が無難な, 当り障りのない";
        word18.hatuon = @"seɪf";
        word18.reibun = @"The rescuers brought the climbers back safe and sound.     There is no safe landing on that coast.";
        
        TestWord *word19 = [TestWord new];
        word19.name = @"trick";
        word19.detail =  @"名詞 複～s/-s/\nたくらみ, 策略, 計略\nYou can't fool me with that old ___!\nそんな古いやり方に引っかかるもんか！\n\nいたずら, 冗談\n\n秘訣, こつ, うまいやり方\nThe ___ is to hold your breath while you aim.\nこつは狙いを定めた時に息を殺す事だ。\n\n手品, トリック, 芸当, 妙技\n\n癖\n\n動詞～s/-s/; ～ed/-t/; ～ing\n他動詞\nだます, 欺く; 人をだまして取る";
        word19.hatuon = @"trɪk";
        word19.reibun = @"You can't fool me with that old trick!  The trick is to hold your breath while you aim.";
        
        TestWord *word20 = [TestWord new];
        word20.name = @"well";
        word20.detail =  @"副詞better/bétər/; best/best/\n上手に, うまく; 申し分なく; 適切に\n\n十分に, よく\nI can't sleep ___ because the tap is dripping.\n水道の蛇口の水漏れがうるさくてよく眠れなかった。";
        word20.hatuon = @"wel";
        word20.reibun = @"I can't sleep well because the tap is dripping.";
        
        
        words = [NSMutableArray arrayWithObjects:
                 word1, word2, word3, word4, word5, word6, word7, word8, word9, word10, word11, word12, word13,
                 word14, word15, word16, word17, word18, word19, word20, nil];
    }
    
    if ([wordNo isEqualToString:@"2"]){
        TestWord *word21 = [TestWord new];
        word21.name = @"adventure";
        word21.detail =  @"名詞 複～s/-z/\n冒険, 冒険旅行; 非日常的な出来事[経験]\nNo matter how hard he tried, he couldn't persuade his friends to give up the ___.\n彼がどんなに努力しても、その冒険を諦めるように友達を説得出来なかった。\n\n冒険心; 危険を冒すこと";
        word21.hatuon = @"ədvén(t)ʃər";
        word21.reibun = @"No matter how hard he tried, he couldn't persuade his friends to give up the adventure.";
        
        TestWord *word22 = [TestWord new];
        word22.name = @"approach";
        word22.detail =  @"動詞～es/-ɪz/; ～ed/-t/; ～ing\n他動詞\n場所に近づく, 接近する\n\n頼む, 話をもちかける, 接触する\nHe still had not the courage to ___ her.\n彼はまだ彼女に話しかける勇気がなかった。\n\n出来事、時期に近づく, ~を迎える\n\n~に到達しようとする, ~の域に近づく, ~に匹敵する\n\n~に取りかかる, 着手する\n\n自動詞\n近づく, 接近する; 出来事、時期が近づく, もうすぐやってくる\n\n名詞 複～es/-ɪz/\n取り組み方, 手法, 研究方法, アプローチ\n\n近づくこと, 接近\nThe company makes an ___ to the supermarket chain.\nその会社はスーパーマーケットチェーン店と交渉している。\n\n近づく[通じる]道, 入口, 進入路\n\n依頼, 打診, 申し出";
        word22.hatuon = @"əpróʊtʃ";
        word22.reibun = @"He still had not the courage to approach her.     The company makes an approach to the supermarket chain.";
        
        TestWord *word23 = [TestWord new];
        word23.name = @"carefully";
        word23.detail =  @"副詞more ～; most ～\n注意深く, 丁寧に, 綿密に, 入念に\n\n慎重に, 綿密[入念]に\n\n注意深く, 慎重に\n\n注意して, 気をつけて, 慎重に\nShe drives ___ up the rocky lane.\n彼女は石のでこぼこ道で慎重に運転する。";
        word23.hatuon = @"kéərf(ə)li";
        word23.reibun = @"She drives carefully up the rocky lane.";
        
        TestWord *word24 = [TestWord new];
        word24.name = @"chemical";
        word24.detail =  @"形容詞\n化学の, 化学的な; 化学用の; 化学的に作られた; 化学薬品の\n\n名詞 複～s/-z/\n化学薬品[製品]; 化学物質\nThe industry produces agricultural ___s.\nその工場は農薬を生産している。";
        word24.hatuon = @"kémɪk(ə)l";
        word24.reibun = @"The industry produces agricultural chemicals.";
        
        TestWord *word25 = [TestWord new];
        word25.name = @"create";
        word25.detail =  @"動詞～s/-ts/; ～d/-ɪd/; -ating\n他動詞\n~を創造する, 造る; ~を創作[創設, 開発]する, 生み出す\nSome people believe that God ___d the world.\n一部の人は神がこの世界を創造したと信じている。\nThis is the kind of atmosphere we want to ___.\nこれが私達が作りたい雰囲気だ。\n\n~を引き起こす";
        word25.hatuon = @"kriéɪt";
        word25.reibun = @"Some people believe that God created the world.     This is the kind of atmosphere we want to create.";
        
        TestWord *word26 = [TestWord new];
        word26.name = @"evil";
        word26.detail =  @"形容詞～er; ～est\n悪い, 邪悪な; ~が悪意に満ちた\n\n害を及ぼす, 有害な\n\nひどく不快な, いやな; 評判が悪い\nWhat an ___ smell!\nなんてにおいだ！\n\n名詞 複～s/-z/\n害悪, 弊害\n\n副詞\n悪く";
        word26.hatuon = @"íːv(ə)l";
        word26.reibun = @"What an evil smell!";
        
        TestWord *word27 = [TestWord new];
        word27.name = @"experiment";
        word27.detail =  @"名詞 複～s/-ts/\n実験; 試み\nThe students will have an ___ in the laboratory tomorrow.\nその学生は明日実験室で実験を行う。\n\n動詞\n自動詞\n実験する; 試みる";
        word27.hatuon = @"ɪkspérɪmənt";
        word27.reibun = @"The students will have an experiment in the laboratory tomorrow.";
        
        TestWord *word28 = [TestWord new];
        word28.name = @"kill";
        word28.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\n~を殺す, 殺す結果となる; ~の生命を奪う\n\n死ぬ\nHis wife was ___ed in a car accident.\n彼の妻は交通事故で亡くなった。\n\n植物を枯らす\n\n怒る, 激怒する\n\n機会、考え、計画をつぶす, 終わらせる;エンジン照明を切る;プロセスを終了する\n\n空いた時間をつぶす\n\n痛み、味、音色を消す, ~の作用[働き]を損なう; 気持ちを冷めさせる; 速度を落とす\nThe noise ___ed the music.\nその雑音は音楽を台無しにした。\n\nひどく参らせる, 圧倒する\nThe heavy work almost ___ed me.\nその仕事でくたくたになった。\n\n自動詞\n命を奪う; 殺す, 殺人を犯す; 植物が枯れる";
        word28.hatuon = @"kɪl";
        word28.reibun = @"His wife was killed in a car accident.     The noise killed the music.     The heavy work almost killed me.";
        
        TestWord *word29 = [TestWord new];
        word29.name = @"laboratory";
        word29.detail =  @"名詞 複-ries/-z/\n実験室; 試験所; 研究所; 実験用の\nThe school has a large biological ___.\nその学校は大きな生物学の実験室がある。";
        word29.hatuon = @"lǽb(ə)rətɔ̀ːri|ləbɔ́rət(ə)ri";
        word29.reibun = @"The school has a large biological laboratory.";
        
        TestWord *word30 = [TestWord new];
        word30.name = @"laugh";
        word30.detail =  @"動詞～s/-s/; ～ed/-t/; ～ing\n自動詞\n笑う; あざ笑う, 嘲笑する; 軽視する\nYou should not ___ at the handicapped.\n障害者を笑ってはいけない。\n\n笑う, 笑いたい気持ちになる\n\n他動詞\n~な笑い方をする \n\n笑って~になる\n\n笑って~にする; 笑って~をやめさせる\n\n名詞 複～s/-s/\n笑い; 笑い声";
        word30.hatuon = @"læf|lɑːf";
        word30.reibun = @"You should not laugh at the handicapped.";
        
        TestWord *word31 = [TestWord new];
        word31.name = @"loud";
        word31.detail =  @"形容詞～er; ～est\nうるさい, やかましい, 騒々しい\nAll of this ___ music is driving me up the wall.\n騒々しい音楽にイライラする。\n\n声が大きい\n\n~がけばけばしい, 派手な, 俗悪な\n\n副詞～er; ～est\n大声で, 大きな音で";
        word31.hatuon = @"laʊd";
        word31.reibun = @"All of this loud music is driving me up the wall.";
        
        TestWord *word32 = [TestWord new];
        word32.name = @"nervous";
        word32.detail =  @"形容詞more ～; most ～\n心配して, 不安で, びくびくして; 自信のない\n\n神経質な, 神経過敏な, 過度に緊張した; 臆病な, 不安な; 動揺しやすい; 緊迫した; 不安からくる意識、反応\nHe is suffering from ___ tension.\n彼はあまりの緊張に苦しんでいる。\n\n神経の, 神経性の, 神経に作用する";
        word32.hatuon = @"nə́ːrvəs";
        word32.reibun = @"He is suffering from nervous tension.";
        
        TestWord *word33 = [TestWord new];
        word33.name = @"noise";
        word33.detail =  @"名詞 複～s/-ɪz/\n騒音, 雑音, 物音; 騒ぎ声; 騒々しさ; 音\nThere is so much ___ in this restaurant, I can hardly hear you talking.\nこのレストランは本当に騒がしいので、あなたの話がほとんど聞こえません。\n\n雑音, ノイズ";
        word33.hatuon = @"nɔɪz";
        word33.reibun = @"There is so much noise in this restaurant, I can hardly hear you talking.";
        
        TestWord *word34 = [TestWord new];
        word34.name = @"project";
        word34.detail =  @"名詞 複～s/-ts/ \n事業計画, プロジェクト, 企画\nOur ___ was scrubbed.\n私達のプロジェクトは中止された。\n\n研究課題, 自主研究\n\n動詞/prədʒékt/～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n~を見積もる; ~だと推測する; ~すると予測する; ~と見積もられている\n\n映像を映写する; 影、光を投げる, 輪郭を映す ; 声をはっきり大きく出す\n\n~を他人に伝える; ~という印象を与える";
        word34.hatuon = @"prɑ́dʒèkt|prɔ́-, prə́ʊ-";
        word34.reibun = @"Our project was scrubbed.";
        
        TestWord *word35 = [TestWord new];
        word35.name = @"scare";
        word35.detail =  @"動詞～s/-z/; ～d/-d/; ___ing/skéərɪŋ/\n他動詞\n~を怖がらせる, おびえさせる, ぎょっと[はっと]させる\n\n~を怖がらせて~させる\n\n~を立ちのかせる, 離れさせる\nThe dog ___d the thief away.\nその犬は泥棒を追い払った。\n\n~を引き離す, 敬遠させる\n\n名詞\n恐怖\n\n不安, 恐れ";
        word35.hatuon = @"skeər";
        word35.reibun = @"The dog scared the thief away.";
        
        TestWord *word36 = [TestWord new];
        word36.name = @"secret";
        word36.detail =  @"形容詞more ～; most ～\n秘密の, 内密の; 知られていない; 人目につかない場所\nWe discovered a ___ passage behind the wall.\n壁の後ろに秘密の通路を見つけた。\n\n外に表れない, 隠れた感情; 内奥の\n\n口がかたい ; こそこそやる\n\n名詞 複～s/-ts/\n秘密; 機密; 内緒\nOur plan must remain a ___.\n私達の計画を漏らしてはならない。\n\n秘訣; 秘伝, こつ\n\n不思議, 神秘, なぞ";
        word36.hatuon = @"síːkrət";
        word36.reibun = @"We discovered a secret passage behind the wall.     Our plan must remain a secret.";
        
        TestWord *word37 = [TestWord new];
        word37.name = @"shout";
        word37.detail =  @"動詞～s/-ts/; ～ed/-ɪd/; ～ing\n自動詞\n叫ぶ; 大声を出す ; 大声で言う, どなる\nHe opened his mouth to ___, but no sound came out.\n彼は叫ぼうとして口を開けたが、声が出なかった。\n\n他動詞\n~を叫ぶ;~を大声で言う ; ~ということをどなる, わめく\n\n名詞 複～s/-ts/\n叫び, 大声, 歓声, 怒号";
        word37.hatuon = @"ʃaʊt";
        word37.reibun = @"He opened his mouth to shout, but no sound came out.";
        
        TestWord *word38 = [TestWord new];
        word38.name = @"smell";
        word38.detail =  @"動詞～s/-z/; ～ed/-d/, ___lt/smelt/; ～ing\n他動詞\n~のにおいがする; においで~ということに気づく; ~するにおいがする \nI could ___ that the milk was not fresh.\nそのミルクが新鮮でないことがにおいで分かった。\n\n~のにおいをかぐ\n\n自動詞\n~のにおいがする; ~の香りがする\n\nいやなにおいがする, 悪臭を放つ\n\nにおいを識別できる, 嗅覚がある\n\n違法である, 不正である\n\n名詞 複～s/-z/\nにおい, 香り; 悪臭\nThe strong ___ made me throw up.\nその強烈なにおいで嘔吐した。";
        word38.hatuon = @"smel";
        word38.reibun = @"I could smell that the milk was not fresh.     The strong smell made me throw up.";
        
        TestWord *word39 = [TestWord new];
        word39.name = @"terrible";
        word39.detail =  @"形容詞more ～; most ～\n猛烈な, ものすごい状況、損害\n\nひどい, ひどくまずい[悪い];  ひどくへたな; いやな\nThe earthquake was a ___ catastrophe.\nその地震は恐ろしい災難であった。";
        word39.hatuon = @"térəb(ə)l";
        word39.reibun = @"The earthquake was a terrible catastrophe.";
        
        TestWord *word40 = [TestWord new];
        word40.name = @"worse";
        word40.detail =  @"形容詞\nより悪い, もっとひどい\nThe weather is getting ___ and ___.\n天気が悪くなっている。\n\nより重い病気で; 病状がより悪い\nShe has been taken ___ recently.\n最近彼女の病状が更に悪化している。\n\n副詞\nもっとひどく\n\n名詞\nいっそう悪いもの[状態]";
        word40.hatuon = @"wəːrs";
        word40.reibun = @"The weather is getting worse and worse.     She has been taken worse recently.";
        
        words = [NSMutableArray arrayWithObjects:
                 word21, word22, word23, word24, word25,
                 word26, word27, word28, word29, word30, word31, word32, word33, word34, word35, word36, word37,
                 word38, word39, word40, nil];
    }
    
    if ([wordNo isEqualToString:@"3"]){
        TestWord *word41 = [TestWord new];
        word41.name = @"alien";
        word41.detail =  @"形容詞more ～; most ～\n外国の; 異人種の\n\n慣れない, 経験のない~\n\n相容れない, 異質である\nWhen I first went to New York, it all felt very ___ to me.\n私が初めてニューヨークに来た時は、見たことのないものばかりだった。\n\n地球外生命体の\n\n名詞\n地球外生命体, 宇宙人, エイリアン";
        word41.hatuon = @"éɪliən, -jən";
        word41.reibun = @"When I first went to New York, it all felt very alien to me.";
        
        TestWord *word42 = [TestWord new];
        word42.name = @"among";
        word42.detail =  @"前置詞\n3人[3つ]以上の間に; ~の中に ; ~の間を\n\n人々の間で\n\n同種の~のうちの1つ[1人]で; ~の中に含まれる\nNew York is ___ the largest cities in the world.\nニューヨークは世界最大都市の一つである。\n\nある集合の中で\n\n3人以上の間で; ~のそれぞれに";
        word42.hatuon = @"əmʌ́ŋ";
        word42.reibun = @"New York is among the largest cities in the world.";
        
        TestWord *word43 = [TestWord new];
        word43.name = @"chart";
        word43.detail =  @"名詞 複～s/-ts/\n図, 図表, グラフ\nCan you read the weather ___?\n天気図を読めますか？\n\nヒットチャート; ヒットチャート入りの\n\n動詞\n他動詞\n~を図表[グラフ]にする; 図表が~を示す\nOn the map we ___ the course of the river.\n地図上にその川の流れを示した。\n\n~を計画する; ~を明示する";
        word43.hatuon = @"tʃɑːrt";
        word43.reibun = @"Can you read the weather chart?     On the map we chart the course of the river.";
        
        TestWord *word44 = [TestWord new];
        word44.name = @"cloud";
        word44.detail =  @"名詞 複～s/-dz/\n雲\nWhen there are black ___s you can tell it's going to rain.\n黒い雲が現れたら雨が降ると分かる。\n\n雲のような物\n\n集団, 大群\n\n不安, 災いのきざし, 暗雲\n\n動詞～s/-dz/; ～ed/-ɪd/; ～ing\n他動詞\nガラスを曇らせる\n\n思考、記憶、判断、理解を曇らせる, 鈍らせる\n\n状況、事態をわかりにくくする";
        word44.hatuon = @"klaʊd";
        word44.reibun = @"When there are black clouds you can tell it's going to rain.";
        
        TestWord *word45 = [TestWord new];
        word45.name = @"comprehend";
        word45.detail =  @"動詞～s/-dz/; ～ed/-ɪd/; ～ing\n他動詞\n~を理解する; ~ということを理解する\nThe child couldn't ___ the text.\nその子はテキストの意味が理解出来なかった。";
        word45.hatuon = @"kɑ̀mprɪhénd|kɔ̀m-";
        word45.reibun = @"The child couldn't comprehend the text.";
        
        TestWord *word46 = [TestWord new];
        word46.name = @"describe";
        word46.detail =  @"動詞～s/-z/; ～d/-d/; ___ing\n他動詞\n~の特徴を述べる, 言い表す; ~を記述する, 描写する, 説明する\nThe police asked me to ___ exactly how it happened.\n警察はそれがどのように起きたのかを説明するよう私に求めた。\n\n~を~だと言う, 称する; ~を~と表現[形容]する\n\n~かを述べる\n\n~したことについて述べる";
        word46.hatuon = @"dɪskráɪb";
        word46.reibun = @"The police asked me to describe exactly how it happened.";
        
        
        TestWord *word47 = [TestWord new];
        word47.name = @"ever";
        word47.detail =  @"副詞\nいつか; これまでに, かつて\nHave you ___ been to Tokyo?\n東京に行ったことはありますか？\n\nもし一度でも, とにかく\n\nかつて, 今まで; まさに\nI don't think I ___ met you.\nあなたに会ったことはないと思う。\n\nいっそう, ますます\n\n絶えず";
        word47.hatuon = @"évər";
        word47.reibun = @"Have you ever been to Tokyo?     I don't think I ever met you.";
        
        TestWord *word48 = [TestWord new];
        word48.name = @"fail";
        word48.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n自動詞\n~し損なう, できない\n\n~が失敗する, うまくいかない; ~に失敗する\nWe must hang together,or our plan will ___.\nお互い協力しないと私達の計画は失敗するだろう。\n\n不合格になる\n\n~するのを怠る, ~しない; ~が起こらない\n\n~を怠る \n\n~が動かなくなる, 働かなくなる\n\n衰える, 弱る; 光、音が弱まる\n\n他動詞\n試験、学科、検査に落ちる\nHe got a ___ in history and passes in other subjects.\n彼の歴史のテストは不合格だったが、他の科目は合格だった。\n\n人の役に立たない, 期待にそむく\n\n教師が生徒を落とす, ~に落第点を付ける";
        word48.hatuon = @"feɪl";
        word48.reibun = @"We must hang together, or our plan will fail.     He got a fail in history and passes in other subjects.";
        
        TestWord *word49 = [TestWord new];
        word49.name = @"friendly";
        word49.detail =  @"形容詞-lier; -liest/more ～; most ～\n親しみのある, 優しい; 友情のこもった; 場所がくつろげる\nThe meeting is gone on in very ___ atmosphere.\n会議は非常に和やかな雰囲気で行われた。\n\n親切な, 愛想のよい, 人なつっこい; 賛成する, 好意的な \n\n仲がよい";
        word49.hatuon = @"frén(d)li";
        word49.reibun = @"The meeting is gone on in very friendly atmosphere.";
        
        TestWord *word50 = [TestWord new];
        word50.name = @"grade";
        word50.detail =  @"名詞 複～s/-dz/\n等級, 品質の程度; 段階, 程度, 過程\nThis ___ of wool can be sold at a fairly low price.\nこの等級の羊毛はかなり低い価格で取引される。\n\n階級, 階層\n\n成績, 評価, 評点\n\n学年, 年級 ; 同学年の全生徒\n\n小学校\n\n動詞～s/-dz/; ～d/-ɪd/; ___ing\n他動詞\n~に等級を付ける, ~を類別する, 格付けする\nThey ___ eggs before they send them to the shops.\n彼らは卵に等級を付けてから店舗に配送する。\n\n自動詞\n等級[品質]である";
        word50.hatuon = @"ɡreɪd";
        word50.reibun = @"This grade of wool can be sold at a fairly low price.     They grade eggs before they send them to the shops.";
        
        TestWord *word51 = [TestWord new];
        word51.name = @"instead";
        word51.detail =  @"副詞\nその代わりに; そうせずに, そうではなく, それどころか\nI gave him advice ___ of money.\n金銭ではなく、アドバイスをした。\n\n~の代わりに, ~ではなくて, ~どころか";
        word51.hatuon = @"ɪnstéd";
        word51.reibun = @"I gave him advice instead of money.";
        
        TestWord *word52 = [TestWord new];
        word52.name = @"library";
        word52.detail =  @"名詞 複-ies/-z/\n図書館; 図書室";
        word52.hatuon = @"láɪbrèri|-br(ə)ri, -b(ə)ri";
        word52.reibun = @"";
        
        TestWord *word53 = [TestWord new];
        word53.name = @"planet";
        word53.detail =  @"名詞 複～s/-ts/\n惑星\n\n世界, 地球全体";
        word53.hatuon = @"plǽnɪt";
        word53.reibun = @"";
        
        TestWord *word54 = [TestWord new];
        word54.name = @"report";
        word54.detail =  @"名詞 複～s/-ts/\n報告\n\n報道, 記事\n\n報告書, レポート\nHe is reading a ___ of the state of the roads.\n彼は道路状況の報告書を読んでいる。\n\nうわさ, 風説, 評判\n\n動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n~を報告する, 伝える; マスコミが~を報道する; ~を取材する\n\n~ということを報告[報道]する; ~したと報告する; ~と報告する\n\n~であると報告[報道]される; ~であると報告する\nThe crash happened seconds after the pilot ___ed engine trouble.\nパイロットがエンジントラブルの報告を行った数秒後に墜落した。\n\n公表する, 発表する\n\n通報する, 届け出る ; 告げ口する\n\n自動詞\n報告する, 報告書を作成する\n\nマスコミが報道する ; 記者が記事を書く";
        word54.hatuon = @"rɪpɔ́ːrt";
        word54.reibun = @"He is reading a report of the state of the roads.     The crash happened seconds after the pilot reported engine trouble.";
        
        TestWord *word55 = [TestWord new];
        word55.name = @"several";
        word55.detail =  @"形容詞\nいくつかの, いくらかの, 数人[個]の\nMy husband has ___ shirts of different colors.\n夫は色の違うシャツを何着も持っている。\n\nそれぞれの, 個々の; いろいろな\n\n代名詞\nいくらかのもの, いくつか";
        word55.hatuon = @"sévr(ə)l";
        word55.reibun = @"My husband has several shirts of different colors.";
        
        TestWord *word56 = [TestWord new];
        word56.name = @"solve";
        word56.detail =  @"動詞～s/-z/; ～d/-d/; ___ing\n他動詞\n~を解決する, 処理する, 打開する\n\n~を解く, 解明する; ~を解答する\nThis problem is too difficult for me to ___.\nこの問題は難しすぎて私には解けない。";
        word56.hatuon = @"sɑlv|sɔlv";
        word56.reibun = @"This problem is too difficult for me to solve.";
        
        TestWord *word57 = [TestWord new];
        word57.name = @"suddenly";
        word57.detail =  @"副詞more ～; most ～\n突然, いきなり, 不意に\nAll sorts of problems assailed us ___.\n様々な難題が突然突き付けられた。";
        word57.hatuon = @"sʌ́d(ə)nli";
        word57.reibun = @"All sorts of problems assailed us suddenly.";
        
        TestWord *word58 = [TestWord new];
        word58.name = @"suppose";
        word58.detail =  @"動詞～s/-ɪz/; ～d/-d/; -posing\n他動詞\n~することになっている, ~しなければならない\n\n~と判断する, ~であろうと思う, ~と想定[推察, 推定]する\nI ___ he would be about fifty when he obtained a doctorate.\n彼は50歳ぐらいの時に博士号を取得したと思う。\n\n~を~だと思う\n\n~としたらどうだろうか; 仮に~としよう ; ~が~であるとすれば \n\n~というのはどうでしょうか";
        word58.hatuon = @"səpóʊz";
        word58.reibun = @"I suppose he would be about fifty when he obtained a doctorate.";
        
        TestWord *word59 = [TestWord new];
        word59.name = @"universe";
        word59.detail =  @"名詞 複～s/-ɪz/\n宇宙; 万物, 森羅万象\n\n分野, 領域, 世界; 生活";
        word59.hatuon = @"júːnɪvə̀ːrs";
        word59.reibun = @"";
        
        TestWord *word60 = [TestWord new];
        word60.name = @"view";
        word60.detail =  @"名詞 複～s/-z/\n意見, 考え, 見解\n\n見方, 考え方\n\n視界, 視野; 視力\n\n見えること\nThe valley was hidden from ___ in the mist.\nその渓谷は霧に隠れて見えなかった。\n\n見る[観察する]こと ; 検分\n\n眺め; ~図\n\n意図, 目的, 意向\n\n見通し, 見込み\n\n動詞\n他動詞\n~を見る, 眺める; ~を調査[検分]する\nPeople came from all over the world to ___ her work.\n世界中の人が彼女の作品を見に来る。\n\n~を~であると考える[見なす]\n\n~を見る, 考察する";
        word60.hatuon = @"vjuː";
        word60.reibun = @"The valley was hidden from view in the mist.     People came from all over the world to view her work.";
        
        words = [NSMutableArray arrayWithObjects:
                 word41, word42, word43, word44, word45, word46, word47, word48, word49,
                 word50, word51, word52, word53, word54, word55, word56, word57, word58, word59, word60, nil];
    }
    
    if ([wordNo isEqualToString:@"4"]){
        TestWord *word61 = [TestWord new];
        word61.name = @"appropriate";
        word61.detail =  @"形容詞more ～; most ～\nきちんと合った, 適切な, ふさわしい\nIt is not easy to choose clothes which are ___ to your beautiful figure.\nあなたの美しい体型に合う洋服を選ぶのは簡単ではない。\n\n動詞/-èɪt/～s/-ts/; ～d/-ɪd/; -ating\n他動詞\n~を私物化する; 金品を横領[着服]する\n\n金銭を充当する, 使用する";
        word61.hatuon = @"əpróʊpriət";
        word61.reibun = @"It is not easy to choose clothes which are appropriate to your beautiful figure.";
        
        TestWord *word62 = [TestWord new];
        word62.name = @"avoid";
        word62.detail =  @"動詞～s/-dz/; ～ed/-ɪd/; ～ing\n他動詞\n事故、危険な事態を避ける, 防ぐ\n\n~を避ける, 場所に近寄らないようにする; ~しないようにする\nThey all ___ed mentioning that name.\n彼らはその名を口にすることを避けた。";
        word62.hatuon = @"əvɔ́ɪd";
        word62.reibun = @"They all avoided mentioning that name.";
        
        TestWord *word63 = [TestWord new];
        word63.name = @"behave";
        word63.detail =  @"動詞～s/-z/; ～d/-d/; ___ing\n自動詞\nふるまう, 行動する  ; 行儀よくする\nIf you ___ like that, you'll get yourself disliked.\nそのような行為は嫌われるよ。\n\n他動詞\n行動する, ふるまう; 子供が行儀よくする";
        word63.hatuon = @"bɪhéɪv";
        word63.reibun = @"If you behave like that, you'll get yourself disliked.";
        
        TestWord *word64 = [TestWord new];
        word64.name = @"calm";
        word64.detail =  @"形容詞～er; ～est\n~が落ち着いた, 冷静な; ~が平穏な\nYou should keep ___ even in face of danger.\n危険な目にあっても冷静でなければならない。\n\n風のない, 平穏な\n\n名詞～s/-z/\n平穏, 静けさ; 無風状態, なぎ\n\n平静, 平穏, 冷静\n\n動詞\n他動詞\n~を静める, 穏やかにする, なだめる";
        word64.hatuon = @"kɑːm";
        word64.reibun = @"You should keep calm even in face of danger.";
        
        TestWord *word65 = [TestWord new];
        word65.name = @"concern";
        word65.detail =  @"名詞 複～s/-z/\n心配事, 心配の種, 懸念材料\n\n心配, 懸念, 不安\nI am not insensible of your ___.\nあなたが心配しているのに気付かなかった訳ではない。\n\n心遣い, 配慮, 思いやり\n\n思い入れ ; 重要と見なすこと\n\n関心事, 関心の対象\n\n重要な事, 問題\n\n関係, 関連 ; 利害関係, 出資すること\n\n責務, 責任, 任務\n\n動詞～s/-z/; ～ed/-d/; ～ing \n他動詞\n~に関係する, 影響を与える, 重要である; かかわる, 関与[関係]する\n\n~を心配させる; 気にかける\n\n本、話が~にかかわる, ~についてのものである";
        word65.hatuon = @"kənsə́ːrn";
        word65.reibun = @"I am not insensible of your concern.";
        
        TestWord *word66 = [TestWord new];
        word66.name = @"content";
        word66.detail =  @"形容詞more ～; most ～\n満足して, 甘んじて\nI am very ___ with my life at present.\n今の生活にとても満足している。\n\n喜んで~する, 甘んじて~する\n\n動詞\n他動詞\n満足する, 甘んじる";
        word66.hatuon = @"kəntént";
        word66.reibun = @"I am very content with my life at present.";
        
        TestWord *word67 = [TestWord new];
        word67.name = @"expect";
        word67.detail =  @"動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n~を予想する; ~するつもりである, ~することを予想する\n\n~するだろうと思う\n\n~が来る[起こる]だろうと思う\nThis is what we ___ to happen.\nこれは私達が起きると予測したことだ。\n\n~を要求する, 求める ; ~するように要求する, 求める\n\n~を期待する; ~することを期待する, ~してもらいたいと思う";
        word67.hatuon = @"ɪkspékt, eks-";
        word67.reibun = @"This is what we expect to happen.";
        
        TestWord *word68 = [TestWord new];
        word68.name = @"frequently";
        word68.detail =  @"副詞more ～; most ～\nしばしば, たびたび, 頻繁に\nHe comes to visit me ___.\n彼はよく私に会いに来る。";
        word68.hatuon = @"fríːkwəntli";
        word68.reibun = @"He comes to visit me frequently.";
        
        TestWord *word69 = [TestWord new];
        word69.name = @"habit";
        word69.detail =  @"名詞 複～s/-ts/\n習慣, 癖\nHe is in the ___ of rising early.\n彼は早起きする習慣がある。\n\n酒、タバコの常用, 中毒; 麻薬中毒";
        word69.hatuon = @"hǽbɪt";
        word69.reibun = @"He is in the habit of rising early.";
        
        TestWord *word70 = [TestWord new];
        word70.name = @"instruct";
        word70.detail =  @"動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n指示を与える;~するよう指示する, 命じる\n; ~と命じる\n\n教える\nPlease ___ me how to do my work.\nどうやって仕事をするのか指導お願いします。\n\n~と知らせる";
        word70.hatuon = @"ɪnstrʌ́kt";
        word70.reibun = @"Please instruct me how to do my work.";
        
        TestWord *word71 = [TestWord new];
        word71.name = @"issue";
        word71.detail =  @"名詞 複～s/-z/\n争点, 論点; 核心\nYou're just avoiding the ___.\nあなたは単に問題を避けているだけだ。\n\n社会的な問題, 気がかり\n\n~号, 版\n\n動詞～s/-z/; ～d/-d/; issuing\n他動詞\n声明を出す, 発する\n\n~を発行する, ~を支給する, 給与する, 渡す\nMay I ___ a ticket to you now?\n今あなたにチケットをお渡ししてもいいですか？\n\n~を発布する, 公布する";
        word71.hatuon = @"ɪ́ʃuː";
        word71.reibun = @"You're just avoiding the issue.     May I issue a ticket to you now?";
        
        TestWord *word72 = [TestWord new];
        word72.name = @"none";
        word72.detail =  @"代名詞\n3者以上のうちだれも~ない, ~のうち何も~ない\n\n何も~ない, だれも~ない\n___ of us like to go skate in winter.\n私達は誰も冬にスケートに行こうと思わない。\n\nひとつもない, 全然ない\n\n副詞\nまったく~でない\n\nまったく~でない, ~どころではない";
        word72.hatuon = @"nʌn";
        word72.reibun = @"None of us like to go skate in winter.";
        
        TestWord *word73 = [TestWord new];
        word73.name = @"patient";
        word73.detail =  @"名詞 複～s/-ts/\n患者, 病人\nThe ___ is seriously ill and is being kept under continuous observation.\nその病人の病状は深刻で観察を続けている。\n\n形容詞more ～; most ～\n忍耐強い, 我慢[根気]強い ; 態度が辛抱強い";
        word73.hatuon = @"péɪʃ(ə)nt";
        word73.reibun = @"The patient is seriously ill and is being kept under continuous observation.";
        
        TestWord *word74 = [TestWord new];
        word74.name = @"positive";
        word74.detail =  @"形容詞more ～; most ～\n積極的な, 建設的な, 前向きの, 楽観的な\n\n事が良い, 好ましい; 見込みのある, 有望な\nThese developments will have a ___ effect on the stability of our financial market.\nこの進展は私達の金融市場安定に良い影響を与えるだろう。\n\n有益な, 役立つ, ためになる; 教育的な, 善行を促す\n\n確信して, 自信のある \n\n反応、批評が肯定的な, 好意的な\n\n陽性の";
        word74.hatuon = @"pɑ́zətɪv|pɔ́z-";
        word74.reibun = @"These developments will have a positive effect on the stability of our financial market.";
        
        TestWord *word75 = [TestWord new];
        word75.name = @"punish";
        word75.detail =  @"動詞～es/-ɪz/; ～ed/-t/; ～ing\n他動詞\n罰する, 懲らしめる; ~で罰する\n\n~に罰を科す\nTheir teacher ___ed them for their rudeness.\n彼らの失礼な態度から教師は彼らを罰した。";
        word75.hatuon = @"pʌ́nɪʃ";
        word75.reibun = @"Their teacher punished them for their rudeness.";
        
        TestWord *word76 = [TestWord new];
        word76.name = @"represent";
        word76.detail =  @"動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n~を代表する; 代理をする ; 選出議員である; ~の考えを代弁する\n\n出席[参加]している; 見受けられる\n\n~の一例である, 好例[典型]である\n\n~を表す, 象徴する, ~の印である\n\n~を描く, 表現する; ~しているのを描く\nThese pictures ___ Japanese landscapes at all seasons of the year.\nこれらの絵は日本の四季の風景を描いている。";
        word76.hatuon = @"rèprɪzént";
        word76.reibun = @"These pictures represent Japanese landscapes at all seasons of the year.";
        
        TestWord *word77 = [TestWord new];
        word77.name = @"shake";
        word77.detail =  @"動詞～s/-s/; shook/ʃʊk/; ～n/-(ə)n/; shaking\n他動詞\n~を振る, 揺さぶる; ~を揺り動かして~にする\n\n~を振り払う, 揺り落とす ;~を振りかける \n\n動揺させる, 落ち着かせない; 動揺する\n\n~をぐらつかせる, 心を乱す\n\n自動詞\n~が揺れる, 震動する\n\n~が震える\nHis voice shook with fear.\n彼の声は恐怖に震えた。\n\n名詞 複～s/-s/\n振ること, 調味料のひと振り分; 握手\nShe reached out her hand and offered to ___ hands with him.\n彼女は手を差し出し、彼に握手を求めた。\n\n震え; 悪寒";
        word77.hatuon = @"ʃeɪk";
        word77.reibun = @"His voice shook with fear.     She reached out her hand and offered to shake hands with him.";
        
        TestWord *word78 = [TestWord new];
        word78.name = @"spread";
        word78.detail =  @"動詞～s/-dz/; ～; ～ing\n他動詞\n~を広げる, 並べる\nHe ___ the map flat out on the floor.\n彼は地図を床に平らに広げた。\n\n~を大きく広げる, 鳥、虫が翼、羽を広げる\n\n蔓延[伝染]させる; 問題、影響を広める, 拡大させる; 炎、ガス、液体を広げる, 拡散させる\n\nうわさ、知識を広める, 吹聴する; ~を普及させる\nWho ___ these rumours?\n誰がデマを飛ばしたんだ？\n\n~を塗る, つける; ~につける\n\n支払い、授業を行う, 引き延ばす\n\n~を分担する, 分散させる; ~を分配する\n\n自動詞\n蔓延する, 広がる, 問題、影響が及ぶ, 拡大する ; うわさが広まる, 知識が普及する, 伝わる ; ~が分布する\n\n~が塗れる, 広がる, 伸びる; 塗る\n\n雲、野原が覆う\n\n名詞 複～s/-dz/\n人の増加, 増大; 普及\n\n土地の広がり\n\nさまざまな~; 範囲, 幅";
        word78.hatuon = @"spred";
        word78.reibun = @"He spread the map flat out on the floor.     Who spread these rumours.";
        
        TestWord *word79 = [TestWord new];
        word79.name = @"stroll";
        word79.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n自動詞\nぶらぶら歩く, 散歩する; さまよう, 放浪する\n\n他動詞\n~をぶらつく, 散歩する\n\n名詞\nぶらぶら歩き, 散歩\nShe decided to take a ___ in the garden.\n彼女は庭で散歩しようと決めた。";
        word79.hatuon = @"stroʊl";
        word79.reibun = @"She decided to take a stroll in the garden.";
        
        TestWord *word80 = [TestWord new];
        word80.name = @"village";
        word80.detail =  @"名詞 複～s/-ɪz/\n村, 村落 \n\n村の\n\n村人たち";
        word80.hatuon = @"vɪ́lɪdʒ";
        word80.reibun = @"";
        
        words = [NSMutableArray arrayWithObjects:
                 word61,
                 word62, word63, word64, word65, word66, word67, word68, word69, word70, word71, word72, word73,
                 word74, word75, word76, word77, word78, word79, word80,  nil];
    }
    
    if ([wordNo isEqualToString:@"5"]){
        TestWord *word81 = [TestWord new];
        word81.name = @"aware";
        word81.detail =  @"形容詞more ～; most ～\n~に気づいている, ~を知っている, 認識[意識, 自覚]している \nThen he became ___ that they were regarding him with interest.\nその時、彼らが興味深げに彼を見つめているのに気付いた。\n\n意識の高い, 知識[認識]のある";
        word81.hatuon = @"əwéər";
        word81.reibun = @"Then he became aware that they were regarding him with interest.";
        
        TestWord *word82 = [TestWord new];
        word82.name = @"badly";
        word82.detail =  @"副詞\nまずく, へたに~する; 悪くふるまう\nThe child behaved ___ at the party.\nその子はパーティーで行儀が悪かった。\n\nとても, どうしても欲しい、必要だ\n\nかなり, ひどく傷つける、悪くなる\n\n不当に, 不利に扱う";
        word82.hatuon = @"bǽdli";
        word82.reibun = @"The child behaved badly at the party.";
        
        TestWord *word83 = [TestWord new];
        word83.name = @"belong";
        word83.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n自動詞\n~に属している; ~の所有物である, ~のものである; ~の保護下にある\n\n組織の一員である\nWhat party do you ___ to?\nどの党派に所属していますか？\n\nある時代のものである; ~の特徴を持つ\n\n属する, 部類である";
        word83.hatuon = @"bɪlɔ́ːŋ|-lɔ́ŋ";
        word83.reibun = @"What party do you belong to.";
        
        TestWord *word84 = [TestWord new];
        word84.name = @"continue";
        word84.detail =  @"動詞～s/-z/; ～d/-d/; -uing\n自動詞\n~が続く, 続いている, 継続する\nWet weather may ___ for a few more days.\n湿っぽい天気は後数日続くだろう。\n\n続ける; 続行する\n\n~が続く, 続けられる\n\n道が延びている; 動き続ける\n\nとどまる, 引き続きいる\n\n他動詞\n~を続ける; ~し続ける \n\n~を再び続ける, 続行する; 続ける";
        word84.hatuon = @"kəntɪ́njuː";
        word84.reibun = @"Wet weather may continue for a few more days.";
        
        TestWord *word85 = [TestWord new];
        word85.name = @"error";
        word85.detail =  @"名詞 複～s/-z/\n間違い, 誤り, 過失, ミス\nThe accident was caused by human ___.\nその事故は人為的過誤によるものだった。\n\n思い違い, 誤解, 勘違い";
        word85.hatuon = @"érər";
        word85.reibun = @"The accident was caused by human error.";
        
        TestWord *word86 = [TestWord new];
        word86.name = @"experience";
        word86.detail =  @"名詞 複～s/-ɪz/\n経験, 体験; 知識, 技能\nHe has had no previous ___ in this kind of job.\n彼はこの種の仕事の経験がない。\n\n経験したこと, 体験した事柄\n\n感情、身体的な不調を感じること, 体験すること\n\n動詞～s/-ɪz/; ～d/-t/; -encing\n他動詞\n~を経験[体験]する\n\n感情、身体的な不調を感じる, 味わう";
        word86.hatuon = @"ɪkspɪ́əriəns, eks-";
        word86.reibun = @"He has had no previous experience in this kind of job.";
        
        TestWord *word87 = [TestWord new];
        word87.name = @"field";
        word87.detail =  @"名詞 複～s/-dz/\n畑, 田, 牧草地; 野原, 芝地\n\n分野, 領域\nHe has become famous in his own ___.\n彼はその分野で有名になった。\n\nグラウンド, 運動場; フィールド\n\n視野, 視界\n\n一面の~\n\n~用地, ~場";
        word87.hatuon = @"fiːld";
        word87.reibun = @"He has become famous in his own field.";
        
        TestWord *word88 = [TestWord new];
        word88.name = @"hurt";
        word88.detail =  @"動詞～s/-ts/; ～; ～ing\n他動詞\n~を傷つける, ~にけがをさせる[する]\n\n言葉が人の感情を傷つける, ~を不快にする; 気分を害する\n\n~にとってたいしたことではない, 問題にはならない\n\n~に損害を与える; ~を妨害する\nThe rumors ___ his reputation badly.\nその噂は彼の名誉を大きく傷付けた。\n\n自動詞\n体の一部が痛む, 痛い; ~が痛みを与える\n\n~が感情を傷つける, 不快にさせる\n\n形容詞\nけがをした, 傷ついた\n\n気分を害した, 精神的に傷ついた\n\n名詞\n心の傷, 痛み; 精神的苦痛;  損害, 害";
        word88.hatuon = @"həːrt";
        word88.reibun = @"The rumors hurt his reputation badly.";
        
        TestWord *word89 = [TestWord new];
        word89.name = @"judgment";
        word89.detail =  @"名詞 複～s/-ts/\n意見, 見解; 判断, 判定\nIn my ___, we should accept their apology.\n私の意見としては、彼らの詫びを受け入れるべきだ。\n\n判断力, 分別, 見識\n\n判決; 裁判";
        word89.hatuon = @"dʒʌ́dʒmənt";
        word89.reibun = @"In my judgment, we should accept their apology.";
        
        TestWord *word90 = [TestWord new];
        word90.name = @"likely";
        word90.detail =  @"形容詞more ～; most ～\nありそうな, 起こりそうな; 起こる可能性の高い; ~しそうである; ~する可能性が高い\n\nもっともらしい説明; ありそうな原因、結果; 見込みのある;  適した場所、人\n\nおそらく, たぶん\nI'm ___ to be very busy tomorrow.\n多分、明日とても忙しい。";
        word90.hatuon = @"láɪkli";
        word90.reibun = @"I'm likely to be very busy tomorrow.";
        
        TestWord *word91 = [TestWord new];
        word91.name = @"normal";
        word91.detail =  @"形容詞more ～; most ～\n標準の, 平均の, 普通の\n\n正常な, 標準的な\nEverything is absolutely ___.\n全て正常。";
        word91.hatuon = @"nɔ́ːrm(ə)l";
        word91.reibun = @"Everything is absolutely normal.";
        
        TestWord *word92 = [TestWord new];
        word92.name = @"rare";
        word92.detail =  @"形容詞～r; ～st\n物がまれな, 珍しい, 希少価値のある; 出来事、状況がまれな, めったに起きない\nIt is ___ to find such a genius nowadays.\nそのような天才は今は滅多にいない。";
        word92.hatuon = @"reər";
        word92.reibun = @"It is rare to find such a genius nowadays.";
        
        TestWord *word93 = [TestWord new];
        word93.name = @"relax";
        word93.detail =  @"動詞～es/-ɪz/; ～ed/-t/; ～ing\n他動詞\nくつろがせる, リラックスさせる\nI just want to sit down and ___.\n座って休みたいだけです。\n\n体をほぐす\n\n体がほぐれる";
        word93.hatuon = @"rɪlǽks";
        word93.reibun = @"I just want to sit down and relax.";
        
        TestWord *word94 = [TestWord new];
        word94.name = @"request";
        word94.detail =  @"名詞 複～s/-ts/\n要請, 依頼 ; 頼むこと ; 頼み[願い]事; 要求[請求]物; 依頼文, 請願書\nHis answer to my ___ was a negative.\n彼は私の頼みを断った。\n\n動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n~を要請する, 頼む";
        word94.hatuon = @"rɪkwést";
        word94.reibun = @"His answer to my request was a negative.";
        
        TestWord *word95 = [TestWord new];
        word95.name = @"reside";
        word95.detail =  @"動詞\n自動詞\n居住する; 駐在する\nThis family has ___d in this city for 60 years.\nこの家族は60年間この都市で暮らしている。\n\n性質がある, 備わっている";
        word95.hatuon = @"rɪzáɪd";
        word95.reibun = @"This family has resided in this city for 60 years.";
        
        TestWord *word96 = [TestWord new];
        word96.name = @"result";
        word96.detail =  @"名詞 複～s/-ts/\n結果, 成り行き, 結末\nThese problems are the ___ of years of bad management.\nそれらの問題は何年も適切な管理をしなかった結果だ。\n\n結果; 計算の結果, 答え\n\n業績\n\n動詞～s/-ts/; ～ed/-ɪd/; ～ing\n自動詞\n~という結果に終わる, ~に帰着する\n\n結果として起こる, 起因する";
        word96.hatuon = @"rɪzʌ́lt";
        word96.reibun = @"These problems are the result of years of bad management.";
        
        TestWord *word97 = [TestWord new];
        word97.name = @"roll";
        word97.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n自動詞\n~が転がる, 転がって進む\nA ball can ___ smoothly on a plane.\nボールは平面で滑らかに転がる。\n\n~が転がる, 転げ回る\n\n~が進む, 動く, 走る; 車で行く\n\n波が押し寄せる, うねる; 雲が流れる, 漂う; 地面がなだらかに起伏する\n\n船、飛行機が揺れる, 横揺れする\n\n太鼓、雷がゴロゴロ鳴る, 低い音が長く続く\n\n他動詞\n~を転がす, 転がして運ぶ\n\n~を丸める, 巻く\n\n~を丸めて円筒形、球形にする\nYou should ___ the wool into a ball before you start knitting.\n編み物を始める前に毛糸を丸めなければならない。\n\n生地をのばす, 道をならす; ~をのばして~にする\n\n車輪付きの物を動かす, 進ませる, 走らせる\n\n名詞 複～s/-z/\n1巻きの紙、テープ、紙幣\n\n回転, 転がす動き, 転がり; 回転させること\n\n低く続く轟音, とどろき; 朗々とした調子; さえずり";
        word97.hatuon = @"roʊl";
        word97.reibun = @"A ball can roll smoothly on a plane.     You should roll the wool into a ball before you start knitting.";
        
        TestWord *word98 = [TestWord new];
        word98.name = @"since";
        word98.detail =  @"接続詞\n~から, ~以降; ~以来\nShe's so easily fatigued ___ her illness.\n彼女は病気を患ってから疲れやすくなった。\n\n~して以来ある期間になる\n\n~なので, だから, である以上\n\n~なので言うが";
        word98.hatuon = @"sɪns";
        word98.reibun = @"She's so easily fatigued since her illness.";
        
        TestWord *word99 = [TestWord new];
        word99.name = @"visible";
        word99.detail =  @"形容詞more ～; most ～\n目に見える;見える\nThe body was ___ below the surface of the lake.\nその死体は湖の中ではっきり見えた。\n\n明らかな, はっきりした\n\n~によく登場する; 人目につく";
        word99.hatuon = @"vɪ́zəb(ə)l";
        word99.reibun = @"The body was visible below the surface of the lake.";
        
        TestWord *word100 = [TestWord new];
        word100.name = @"wild";
        word100.detail =  @"形容詞～er; ～est\n野生の, 自然の環境で育つ, 人の手のかかっていない\nIn nature, all animals are ___ and free.\n自然界では全ての動物は野生で自由である。\n\n未開の; 自然のままの; 荒涼とした; 人の住んでない土地\n\n~が狂気じみた; 激情した ; 熱狂的な, 猛烈な\n\n乱暴な, 荒々しい, 手のつけようのない; 放埓とした\n\n見当違いの, 突拍子もない, でたらめな; 的をそれた; 派手な, 奇抜な\n\n夢中に思って, 気に入って  ; たまらなくて\n\n荒れた, 激しい天候、海; 動乱の時勢\n\n副詞\n乱暴に";
        word100.hatuon = @"waɪld";
        word100.reibun = @"In nature, all animals are wild and free.";
        
        words = [NSMutableArray arrayWithObjects:
                 word81, word82, word83, word84, word85,
                 word86, word87, word88, word89, word90, word91, word92, word93, word94, word95, word96, word97,
                 word98, word99, word100, nil];
    }
    
    if ([wordNo isEqualToString:@"6"]) {
        
        TestWord *word1 = [TestWord new];
        word1.name = @"advantage";
        word1.detail = @"名詞 複～s/-ɪz/\n利点, 長所 ;優越点, 強み\n\n有利な状態, 優位, 優越, 便利, 好都合\nRich has an ___ over you since he can speak German.\nリッチはドイツ語が話せるので君より有利だ。";
        word1.hatuon = @"ədvǽntɪdʒ|-vɑ́ːn-";
        word1.reibun = @"Rich has an advantage over you since he can speak German.";
        
        TestWord *word2 = [TestWord new];
        word2.name = @"cause";
        word2.detail = @"名詞 複～s/-ɪz/\n原因, 要因; 原因になる人[物]\n\n理由, 根拠, 動機\nYou have no ___ for complaint.\nあなたは文句を言う理由がない。\n\n理想, 主義, 主張, 大義; 運動, 団体\n\n動詞～s/-ɪz/; ～d/-d/; ___ing\n他動詞\n~をもたらす[引き起こす]\nSmoking can ___ lung cancer.\n喫煙は肺ガンを引き起こす。\nShe is always ___ing trouble for people.\n彼女はいつも人に迷惑をかける。\n\n~に~させる";
        word2.hatuon = @"kɔːz";
        word2.reibun = @"You have no cause for complaint.     Smoking can cause lung cancer.     She is always causing trouble for people.";
        
        TestWord *word3 = [TestWord new];
        word3.name = @"choice";
        word3.detail = @"名詞 複～s/-ɪz/\n選択;選ぶこと\nWe have no ___ except to trust ourselves.\n自分達を信じるしかなかった。\n\n選ぶ人[物]; 選ばれた人[物]; 選り抜き\n\n選択範囲";
        word3.hatuon = @"tʃɔɪs";
        word3.reibun = @"We have no choice except to trust ourselves.";
        
        TestWord *word4 = [TestWord new];
        word4.name = @"community";
        word4.detail = @"名詞 複-ties/-z/\n地域社会, コミュニティ; 市町村, 自治体; 地域住民\n\n共同体, コミュニティ, 社会, ~界\nThe international ___ forbids use of any chemical weapons.\n国際社会は一切の化学兵器の使用を禁止している。\n\n一般社会, 世間\n\n一体感, 帰属意識;共通性;共有";
        word4.hatuon = @"kəmjúːnəti";
        word4.reibun = @"The international community forbids use of any chemical weapons.";
        
        TestWord *word5 = [TestWord new];
        word5.name = @"dead";
        word5.detail = @"形容詞\n死んだ, 死んでいる; 枯れた\nHe has been ___ for two years.\n彼が亡くなって二年になる。\n\n死者たち\n\n停止した; 電池が切れた; ~が機能しない; エンジンが動かない\nThe battery is ___.\n電池が切れた。\nThe phone went ___.\n電話が通じなかった。\n\n活気がない, おもしろみに欠ける; 動きがない\n\n疲れ切った\n\n感覚のない, まひした; 無感動な, 無感覚な\n\n興味を引かない, おもしろくない, 退屈な\n\n廃れた, 使われていない言語、習慣、法律\n\nまったくの, 完全な, 絶対的な; 突然の; 正確な; 確実な";
        word5.hatuon = @"ded";
        word5.reibun = @"He has been dead for two years.     The battery is dead.     The phone went dead.";
        
        TestWord *word6 = [TestWord new];
        word6.name = @"distance";
        word6.detail =  @"名詞 複～s/-ɪz/\n距離, 隔たり, 間隔, 道のり\n\n遠距離, 遠方; 遠い地点; 空間的な広がり; 遠景\nWe can see a windmill in the ___.\n遠くに風車が見える。\n\n相違, 隔たり, 距離\n\n隔たり, 間隔, 経過; 長い期間\n\n動詞\n他動詞\n~を遠ざける, 引き離す; 心理的に距離をおく";
        word6.hatuon = @"dɪ́st(ə)ns";
        word6.reibun = @"We can see a windmill in the distance.";
        
        TestWord *word7 = [TestWord new];
        word7.name = @"escape";
        word7.detail = @"動詞～s/-s/; ～d/-t/; ___ing\n自動詞\n逃げる, 逃亡する, 脱出する\nTo my surprise, he could ___ from that big fire.\n彼が大火事から逃げ出せたことに驚いた。\n\n逃れる, 助かる, 免れる;逃避する\n\n他動詞\n危険な状況を逃れる, 免れる, 避ける; ~するのを免れる\n\n名詞\n逃亡, 脱出; 逃避, 回避 ; 逃げる手段;逃避のための\n\n現実逃避, 気晴らし\n\n気体、液体、熱が漏れること, 漏れ";
        word7.hatuon = @"ɪskéɪp, es-";
        word7.reibun = @"To my surprise, he could escape from that big fire.";
        
        TestWord *word8 = [TestWord new];
        word8.name = @"face";
        word8.detail = @"名詞 複～s/-ɪz/\n顔, 顔面\nHer ___ lit up when she saw he was coming.\n彼が来たのを見ると彼女の顔は明るくなった。\n\n表情, 顔つき\n\n人\n\n表面, 正面; 立体の各面; ~の表側;時計の文字盤; 急斜面; 採掘現場\n\n様相, 側面, 概観\n\n動詞～s/-ɪz/; ～d/-t/; ___ing\n他動詞\n~に向かう, ~に面する; ~と向かい合う, 対面する\n\n~が直面している ; いやな人と向き合う, 話す; ~を率直に認める, 直視する";
        word8.hatuon = @"feɪs";
        word8.reibun = @"Her face lit up when she saw he was coming.";
        
        TestWord *word9 = [TestWord new];
        word9.name = @"follow";
        word9.detail = @"動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\n~の後について行く; 一緒に行く;すぐ後から行く\nThey blew up the bridge so that the enemy couldn't ___ them.\n彼らは橋を爆破して敵が追いかけて来るのを防いだ。\n\n~の跡を継ぐ\n\n~に従う, ~を守る; ~を信奉する\n\n~をたどる; ~にそって行く\n\n~に注目する\n\n~を理解する\n\n自動詞\nついて行く\n\n事が結果として起こる; 当然~ということになる\n\n理解する";
        word9.hatuon = @"fɑ́loʊ|fɔ́ləʊ";
        word9.reibun = @"They blew up the bridge so that the enemy couldn't follow them.";
        
        TestWord *word10 = [TestWord new];
        word10.name = @"fright";
        word10.detail = @"名詞\n恐ろしい体験[考え]; 恐怖感, 恐ろしさ; あがること\nHearing the news, we turned pale with ___.\nそのニュースを聞いた後、恐怖で顔が青ざめた。";
        word10.hatuon = @"fraɪt";
        word10.reibun = @"Hearing the news, we turned pale with fright.";
        
        TestWord *word11 = [TestWord new];
        word11.name = @"ghost";
        word11.detail =  @"名詞 複～s/-ts/\n幽霊, 亡霊\n\n幻影, 影 ; かすかな[ごくわずかの]";
        word11.hatuon = @"ɡoʊst";
        word11.reibun = @"";
        
        TestWord *word12 = [TestWord new];
        word12.name = @"individual";
        word12.detail =  @"形容詞\n個々の, 個別的な,それぞれの; 単一の; 個体の\nIt is difficult for a teacher to give ___ attention to children in a large class.\n教師は人数の多いクラスで各学生の面倒を見ることは難しい。\n\n独特の,独自の\n\n個人的な, 個人の\n\n名詞 複～s/-z/\n個人; 個体";
        word12.hatuon = @"ɪ̀ndɪvɪ́dʒu(ə)l";
        word12.reibun = @"It is difficult for a teacher to give individual attention to children in a large class.";
        
        TestWord *word13 = [TestWord new];
        word13.name = @"pet";
        word13.detail =  @"名詞 複～s/-ts/\nペット, 愛玩動物";
        word13.hatuon = @"pet";
        word13.reibun = @"";
        
        TestWord *word14 = [TestWord new];
        word14.name = @"reach";
        word14.detail =  @"動詞～es/-ɪz/; ～ed/-t/; ～ing\n他動詞\n~に着く, 到着する\n\n手、腕を差し出す\n\n手が届く; ~を取る\n\n~を取ってやる\n\n量、程度、段階に達する, 及ぶ\n\n結果、同意に達する\nHopefully, they will ___ an agreement after the talk.\n会談後、彼らは合意に達するだろう。\n\n~に届く\n\n~に連絡を取る\n\n自動詞\n手を差し出す,手を伸ばす ; 手を差し入れる\n\n手が届く\n\n~が達する, 届く, 及ぶ\n\n名詞 複～es/-ɪz/\n手の届く範囲, 届く距離; 腕の長さ; 手腕を伸ばすこと\n\n範囲";
        word14.hatuon = @"riːtʃ";
        word14.reibun = @"Hopefully, they will reach an agreement after the talk.";
        
        TestWord *word15 = [TestWord new];
        word15.name = @"return";
        word15.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n自動詞\n戻る, 帰る \nWhat time does your husband ___ from work?\n旦那さんは何時に仕事から帰りますか？\n\n~がもとの状態に戻る, 回復する\n\nもとの行為にまた戻る, 再開する\n\n他動詞\n借りた~を返す, 戻す\n\n受けたものを返す; 相手の行為に報いる\n\n名詞 複～s/-z/\n帰ってくること, 帰宅, 帰国, 帰還\n\n返すこと, 戻すこと, 返却, 返送\n\nまた始めること, 再開\n\n~がもとに戻ること, 復帰, 回復\n\n利益, 収益\n\n投票結果\n\n形容詞\n帰りの, 戻りの";
        word15.hatuon = @"rɪtə́ːrn";
        word15.reibun = @"What time does your husband return from work.";
        
        TestWord *word16 = [TestWord new];
        word16.name = @"survive";
        word16.detail =  @"動詞～s/-z/; ～d/-d/; -viving\n自動詞\n生き残る, 助かる; どうにかやっていく ; 存続する;無事な状態で生き残る\nShe was the only one to ___ the crash.\n彼女はその墜落事故で唯一生き残った。\n\n何とか生きていく\n\n他動詞\n生き延びる; ~の以後も存続する; 無事な状態で切り抜ける";
        word16.hatuon = @"sərváɪv";
        word16.reibun = @"She was the only one to survive the crash.";
        
        TestWord *word17 = [TestWord new];
        word17.name = @"upset";
        word17.detail =  @"動詞～s/-ts/; ～; ～ting\n他動詞\n動揺させる, うろたえさせる; ~を心配させる; ~ということが~を動揺させる\n\n混乱[転覆]させる\nThe whole plan was ___ owing to his absence.\n彼が来なかったので全ての計画が台無しになった。\n\n胃の調子を悪くする\n\n形容詞\n取り乱した, うろたえた; あわてふためいて; 腹を立てた\n\n具合の悪い胃\n\n名詞\n不調";
        word17.hatuon = @"ʌ̀psét";
        word17.reibun = @"The whole plan was upset owing to his absence.";
        
        TestWord *word18 = [TestWord new];
        word18.name = @"voice";
        word18.detail =  @"名詞 複～s/-ɪz/\n声, 話す声; 声の質[調子]; 口調 \nWe could hear the children's ___s in the garden.\n庭で子供達の声が聞こえた。\n\n声を出す能力";
        word18.hatuon = @"vɔɪs";
        word18.reibun = @"We could hear the children's voices in the garden.";
        
        TestWord *word19 = [TestWord new];
        word19.name = @"weather";
        word19.detail =  @"名詞\n天気, 天候, 気象; 天候の, 気象の\nWhat is the ___ like today?\n今日はどんな天気ですか？\n\n天気予報, 気象情報.\n\n暴風雨; 悪天候\n\n動詞\n他動詞\n変色する, 風化する, 傷む; 日焼けする\n\n無事に乗り切る, うまく切り抜ける";
        word19.hatuon = @"wéðər";
        word19.reibun = @"What is the weather like today.";
        
        TestWord *word20 = [TestWord new];
        word20.name = @"wise";
        word20.detail =  @"形容詞～r; ～st\n判断、行為、賢い, 賢明な, 分別のある\nTo a ___ person, time is like a diamond.\n賢い人にとって時間はダイアモンドと同じくらい貴重だ。\n\nくわしい, 通じた; 博識な, 学識がある\n\n偉そうぶった, 知ったかぶりの";
        word20.hatuon = @"waɪz";
        word20.reibun = @"To a wise person, time is like a diamond.";
        
        
        words = [NSMutableArray arrayWithObjects:
                 word1, word2, word3, word4, word5, word6, word7, word8, word9, word10, word11, word12, word13,
                 word14, word15, word16, word17, word18, word19, word20, nil];
    }
    
    if ([wordNo isEqualToString:@"7"]) {
        TestWord *word21 = [TestWord new];
        word21.name = @"allow";
        word21.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\n~するのを許す ; ~させる; ~を許す, 認める\nYou are not ___ed to smoke here.\nここで喫煙してはいけない。\n\n許可する \n\n~を与える\n\n時間、配分を見ておく, 充てる; 猶予する\n\n自動詞\n事が許される";
        word21.hatuon = @"əláʊ";
        word21.reibun = @"You are not allowed to smoke here.";
        
        TestWord *word22 = [TestWord new];
        word22.name = @"announce";
        word22.detail =  @"動詞～s/-ɪz/; ～d/-t/; ___ing\n他動詞\n~を知らせる, 通知[公告, 告知, 発表]する\nFootsteps ___d his return.\n足音で彼が帰って来たことが分かった。\n\n~であると発表する\n\n~を知らせる, 取り次ぐ\n\n~を告げる, アナウンスする";
        word22.hatuon = @"ənáʊns";
        word22.reibun = @"Footsteps announced his return.";
        
        TestWord *word23 = [TestWord new];
        word23.name = @"beside";
        word23.detail =  @"前置詞\n~のそばに, ~の近くに\nI set a chair ___ him and sat down.\n椅子を彼の隣に置いて座った。\n\n~に比べると\n\n~とは無関係で, 要点をはずれて";
        word23.hatuon = @"bɪsáɪd, bə-";
        word23.reibun = @"I set a chair beside him and sat down.";
        
        TestWord *word24 = [TestWord new];
        word24.name = @"challenge";
        word24.detail =  @"名詞 複～s/-ɪz/\n課題, 意欲をそそるもの ; 難問, 難題; 意欲, やりがい\n\n異議, 抗議, 説明要求\n\n挑戦;申し込み\n\n動詞～s/-ɪz/; ～d/-d/; -lenging\n異議を唱える, ~を疑問視する\n\n挑戦する, 競う\nNew competitors are emerging to ___ the old economic arrangements.\n古い経済構造に挑もうと新たな競争相手が現れている。\n\n~の能力を試す, その気にさせる; 刺激する";
        word24.hatuon = @"tʃǽlɪn(d)ʒ";
        word24.reibun = @"New competitors are emerging to challenge the old economic arrangements.";
        
        TestWord *word25 = [TestWord new];
        word25.name = @"claim";
        word25.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\n~を主張する; ~だと主張する, 断言する; ~と主張する\n\n要求する, ~の所有権[権利]を主張する; 賠償を請求する \nThe government would not even consider his ___ for money.\n政府は彼の賠償金の要求を考慮しなかった。\n\n~が関心を呼ぶ\n\n自動詞\n支払い請求をする\n\n名詞～s/-z/\n主張, 断言\n\n権利の主張, 資格; 請求権\n\n要求, 請求 ;請求(金)";
        word25.hatuon = @"kleɪm";
        word25.reibun = @"The government would not even consider his claim for money.";
        
        TestWord *word26 = [TestWord new];
        word26.name = @"condition";
        word26.detail =  @"名詞 複～s/-z/\n状態; 体調, 調子; コンディション;健康状態\n\n状況, 事情, 環境; 気象条件\n___s in poor quarters were horrible.\n貧困居住区環境は劣悪だった。\n\n条件; 必要条件\n\n動詞\n他動詞\n~が慣れている, 訓練されている, 条件づけられている";
        word26.hatuon = @"kəndɪ́ʃ(ə)n";
        word26.reibun = @"Conditions in poor quarters were horrible.";
        
        TestWord *word27 = [TestWord new];
        word27.name = @"contribute";
        word27.detail =  @"動詞～s/-ts/; ～d/-ɪd/; -uting\n他動詞\n~を提供する, 与える\n\n~に投稿する, 寄稿する\n\n自動詞\n寄与する, 貢献する; 寄付する\nIt was generous of her to ___ such a large sum.\nあの大金を寄付する彼女は気前がよかった。\n\n~の一因となる, 一助となる \n\n投稿[寄稿]する";
        word27.hatuon = @"kəntrɪ́bjət|-bjuːt, kɔ́ntrɪbjuːt";
        word27.reibun = @"It was generous of her to contribute such a large sum.";
        
        TestWord *word28 = [TestWord new];
        word28.name = @"difference";
        word28.detail =  @"名詞 複～s/-ɪz/\n違い, 相違; 区別; 変化\nThere is a slight ___ between them.\n彼らの間には僅かな違いがある。\n\n数量の差, 差異; 差額\n\n意見の不一致, 不和, 紛争";
        word28.hatuon = @"dɪ́fr(ə)ns";
        word28.reibun = @"There is a slight difference between them.";
        
        TestWord *word29 = [TestWord new];
        word29.name = @"divide";
        word29.detail =  @"動詞～s/-dz/; ～d/-ɪd/; ___ing\n他動詞\n~を分ける; ~を分割して~にする\n___ the cake into equal parts.\nケーキを同じ大きさに切り分けた。\n\n~を隔てる, 分離する\n\n~を分配する, 分ける ;~を振り分ける \n\n数字を割る, 割り算する ; 数字で割る\n\n~を分裂させる; ~が対立している\n\n自動詞\n~が分かれる, 分割する ; ~が分岐する;細胞が分裂する\n\n割り算をする;割る ; 数が割り切れる ; 割り切る";
        word29.hatuon = @"dɪváɪd";
        word29.reibun = @"Divide the cake into equal parts.";
        
        TestWord *word30 = [TestWord new];
        word30.name = @"expert";
        word30.detail =  @"名詞 複～s/-ts/\n熟練者, 専門家, 達人, 玄人\nAccording to ___ opinions, they gave up the experiment immediately.\n専門家の意見に従い、彼らはすぐに実験を諦めた。\n\n形容詞more ～; most ～\n熟達した, 巧みな, うまい; 専門的知識のある ";
        word30.hatuon = @"ékspəːrt";
        word30.reibun = @"According to expert opinions, they gave up the experiment immediately.";
        
        TestWord *word31 = [TestWord new];
        word31.name = @"famous";
        word31.detail =  @"形容詞more ～; most ～\n有名な, 著名な\nThe parks of this city are ___ for their ornate fountains.\nこの都市の公園は華麗な噴水で有名だ。\n\nうわさでは知っている, 例の";
        word31.hatuon = @"féɪməs";
        word31.reibun = @"The parks of this city are famous for their ornate fountains.";
        
        TestWord *word32 = [TestWord new];
        word32.name = @"force";
        word32.detail =  @"名詞 複～s/-ɪz/\n力, 強さ; 威力; 自然の力\n\n影響力を持つ~, 支配力\n\n説得力, 効果; 意味\n\n軍隊; 部隊; 陸海空軍; 軍事力, 軍事行動\n\n他動詞\n~に無理やり~させる; ~することを強いる\nNo power on earth could ___ me to do it .\n私にそれを行うように命令出来る者はこの世にいない。\n\n~を押しつける\n\n~を押し込む, 押し進める ; 力ずくで~を取る\n\nほほえみを無理に作る, 声を無理に出す";
        word32.hatuon = @"fɔːrs";
        word32.reibun = @"No power on earth could force me to do it .";
        
        TestWord *word33 = [TestWord new];
        word33.name = @"harm";
        word33.detail =  @"名詞\n害, 損害, 危害\n\n悪意, 悪気\n\n不都合, 良くない面, さしつかえ\n\n動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\n~を傷つける, 害する, 痛める\nI won't ___ you if you let me talk.\n黙って俺の話を聞くなら傷付けはしない。";
        word33.hatuon = @"hɑːrm";
        word33.reibun = @"I won't harm you if you let me talk.";
        
        TestWord *word34 = [TestWord new];
        word34.name = @"lay";
        word34.detail =  @"動詞～s/-z/; __id/leɪd/; ～ing\n他動詞\n体の一部を置く, 当てる\n\n横に寝かす; 死体を横たえる\nI ___ down not so much to sleep as to think.\n寝るというよりは考える為に横になった。\n\n~を置く; ~を振り下ろす\nYou may ___ it on the table.\n机の上にそれを置いていいよ。\n\n~を敷く, 広げる, 固定する; ~を塗る; ~を積む, 並べる; ~を敷設する\n\n~を~で覆う; ~を並べる\n\n卵を産む\n\n計画、基盤を作る, 立てる, 築く\n\n企みを立てる; ~をしかける\n\n力点、信頼を置く\n\n~を~にする";
        word34.hatuon = @"leɪ";
        word34.reibun = @"I lay down not so much to sleep as to think.     You may lay it on the table.";
        
        TestWord *word35 = [TestWord new];
        word35.name = @"peace";
        word35.detail =  @"名詞\n平和, 政治的、社会的安定; 平和な状態[期間]\nThe situation poses a grave threat to world ___.\nその情勢は世界の平和に対して重大な脅威を与える。\n\n和平, 和睦; 講和(条約)\n\n 静けさ, 静寂; 沈黙\n\n(心の)安定, 平穏, 安らぎ, 安楽";
        word35.hatuon = @"piːs";
        word35.reibun = @"The situation poses a grave threat to world peace.";
        
        TestWord *word36 = [TestWord new];
        word36.name = @"prince";
        word36.detail =  @"名詞 複～s/-ɪz/\n王子, 皇子, 親王\n\n君主, 公";
        word36.hatuon = @"prɪns";
        word36.reibun = @"";
        
        TestWord *word37 = [TestWord new];
        word37.name = @"protect";
        word37.detail =  @"動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n~を保護する\nThese rare tigers are ___ed by special laws.\nその貴重な虎は特別な法律によって保護されている。\n\n~を守る, 保護する, かばう\n\n~させないようにする\n\n自動詞\n保護機能がある, 防ぐ ;保険、契約が 補償をする";
        word37.hatuon = @"prətékt, ｟米｠proʊ-";
        word37.reibun = @"These rare tigers are protected by special laws.";
        
        TestWord *word38 = [TestWord new];
        word38.name = @"sense";
        word38.detail =  @"名詞 複～s/-ɪz/\n分別のあること, 思慮, 良識 ; 判断力\n\n漠然とした感覚, 感じ; 意識, 心持ち, 気持ち\n\n感じる力, 心, 感覚, センス\nI lost my ___ of taste.\n味覚を失った。\nYour brother has a good ___ of humor.\nあなたの兄弟はユーモアのセンスがある。\n\n意識; 正気, 本性, 本心\n\n価値, 意義, 意味; 理由, 道理\n\n動詞\n感づく, 気づく; ~ということを感づく; ~が~するのを感づく\n\n~を探知する; ~かを感知する";
        word38.hatuon = @"sens";
        word38.reibun = @"I lost my sense of taste.     Your brother has a good sense of humor.";
        
        TestWord *word39 = [TestWord new];
        word39.name = @"sudden";
        word39.detail =  @"形容詞more ～; most ～\n突然の, 急な, 不意の, 思いがけない, 唐突な\nTheir ___ attack made us more aware of the danger around us.\n彼らの奇襲は私達の周囲への危険意識を更に高めた。";
        word39.hatuon = @"sʌ́d(ə)n";
        word39.reibun = @"Their sudden attack made us more aware of the danger around us.";
        
        TestWord *word40 = [TestWord new];
        word40.name = @"therefore";
        word40.detail =  @"副詞\nそれゆえに, それで, したがって\nHe was the only candidate; ___, he was elected.\n彼は唯一の候補者だったので当選した。";
        word40.hatuon = @"ðéərfɔ̀ːr";
        word40.reibun = @"He was the only candidate; therefore, he was elected.";
        
        words = [NSMutableArray arrayWithObjects:
                 word21, word22, word23, word24, word25,
                 word26, word27, word28, word29, word30, word31, word32, word33, word34, word35, word36, word37,
                 word38, word39, word40, nil];
    }
    
    if ([wordNo isEqualToString:@"8"]) {
        TestWord *word41 = [TestWord new];
        word41.name = @"accept";
        word41.detail =  @"動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n~を受け取る; ~を受諾する, ~に応じる\nWe gave him a present,but he did not ___ it.\n私達は彼にプレゼントをあげたが、彼は受け取らなかった。\n\n~を受け入れる\n\n~を正しいとみなす; ~を真実、事実と認める; ~ということを認める\n\n~を甘受する, 容認する; ~にやむなく従う; ~を~として受け入れる; ~ということを受け入れる\n\n~を負う, 引き受ける\n\n小切手、クレジットカードを受け付ける; 手形を受け取る\n\n~を有効な物として認める, 採用する \n\n~を迎え入れる ; ~の入学、入会を認める";
        word41.hatuon = @"əksépt, æk-";
        word41.reibun = @"We gave him a present,but he did not accept it.";
        
        TestWord *word42 = [TestWord new];
        word42.name = @"arrange";
        word42.detail =  @"動詞～s/-ɪz/; ～d/-d/; ___ing\n他動詞\n~の手はずを整える, 計画をする, 準備をする; ~ということを取り決める\n\n~を手配する, 用意する\nI have ___d one of my staff to meet you at the airport.\nあなたを迎えに一人の職員を空港に手配した。\n\n~をきちんと並べる, 配列する; 整える,整頓する";
        word42.hatuon = @"əréɪn(d)ʒ";
        word42.reibun = @"I have arranged one of my staff to meet you at the airport.";
        
        TestWord *word43 = [TestWord new];
        word43.name = @"attend";
        word43.detail =  @"動詞～s/-dz/; ～ed/-ɪd/; ～ing\n他動詞\n~に出席する\nDuring summer vacations some teachers ___ seminars at college.\n夏休みの間、一部の教師は大学のセミナーに出席する。\n\n~を診る, 看病する; 付き添う, 随行する\n\n自動詞\n~を扱う, 処理する\n\n~に注意を払う; ~を注意して聞く";
        word43.hatuon = @"əténd";
        word43.reibun = @"During summer vacations some teachers attend seminars at college.";
        
        TestWord *word44 = [TestWord new];
        word44.name = @"balance";
        word44.detail =  @"名詞 複～s/-ɪz/\n均衡, バランス, 釣り合い; 均衡のとれた状態;平衡感覚; 平静, 落ち着き \nThe girl lost her ___ and fell off the ___ beam.\n彼女はバランスを失い、平均台から落下した。\n\n大勢, 大半\n\n預金残高;残金, 差額\n\n残り, 余り\n\n均衡をとるもの, 相殺するもの\n\n動詞～s/-ɪz/; ～d/-t/; -ancing\n他動詞\n~のバランスをとる[保つ]\n\n~の両立を図る, 釣り合いをとる\n\n~の収支を合わせる; ~を収入内におさめる\n\n自動詞\nバランスをとる[保つ]";
        word44.hatuon = @"bǽləns";
        word44.reibun = @"The girl lost her balance and fell off the balance beam.";
        
        TestWord *word45 = [TestWord new];
        word45.name = @"contrast";
        word45.detail =  @"名詞 複～s/-ts/\n対照, 対比;差異, 相違 \nThere is a great ___ between good and evil.\n善と悪には対照的な相違がある。\n\n対照的な~\n\nコントラスト; 対比\n\n~と比べて, 対照的に\n\n動詞～s/-ts/; ～ed/-ɪd/; ～ing\nkəntrǽst|-trɑ́ːst\n自動詞\n~が対照をなす, 相違が際だつ\n\n他動詞\n~を比較する, 対照させる; ~と~を対比する";
        word45.hatuon = @"kɑ́ntræst|kɔ́ntrɑːst/kəntrǽst|-trɑ́ːst";
        word45.reibun = @"There is a great contrast between good and evil.";
        
        TestWord *word46 = [TestWord new];
        word46.name = @"encourage";
        word46.detail =  @"動詞～s/-ɪz/; ～d/-d/; -aging\n他動詞\n~を励ます, 勇気づける\nHer success ___d me to try the same thing.\n彼女の成功は私が同様の事を試す励みとなった。\n\n~するよう奨励する, 勧める; ~するよう仕向ける, ~をそそのかす\n\n激励される\n\n~を促進する, 助成する; ~を助長する";
        word46.hatuon = @"ɪnkə́ːrɪdʒ|-kʌ́r-";
        word46.reibun = @"Her success encouraged me to try the same thing.";
        
        TestWord *word47 = [TestWord new];
        word47.name = @"familiar";
        word47.detail =  @"形容詞more ～; most ～\nよく知られている, なじみの, 見[聞き]おぼえのある\n\n熟知している, 精通している\nI am not really ___ with the local laws.\n地方の法律に詳しくない。";
        word47.hatuon = @"fəmɪ́ljər|-iə";
        word47.reibun = @"I am not really familiar with the local laws.";
        
        TestWord *word48 = [TestWord new];
        word48.name = @"grab";
        word48.detail =  @"動詞～s/-z/; ～bed/-d/; ～bing\n他動詞\n~をつかむ, ひっつかむ; 逮捕する\nWhen I gave him the chance, he ___bed it at once.\n彼にそのチャンスを与えたら、彼はすぐにそれを摑み取った。\n\n~をつかみとる, ひったくる, 奪い取る; 横取りする ; タクシーをつかまえる\n\n~の注意を引き付ける\n\n~をすばやく[簡単に]取る, がっつく\n\n~に印象を与える, 人の心、関心、注目をとらえる, 引き付ける\n\n名詞\nつかむ[つかもうとする]こと ; つかんだ物, 横領[強奪]物";
        word48.hatuon = @"ɡræb";
        word48.reibun = @"When I gave him the chance, he grabbed it at once.";
        
        TestWord *word49 = [TestWord new];
        word49.name = @"hang";
        word49.detail =  @"動詞～s/-z/; hung/hʌŋ/\n他動詞\n~を掛ける, つるす, つり下げる\nYou may ___ your coat on the hook.\nコートをそのフックに掛けていいよ。\n\n~を貼る; ~を展示する\n\n~が飾られている\n\n絞首刑にする ; 首をつる\n\n~をたれる, うなだれる; ~をたらす\n\n自動詞\nつり下がる, ぶら下がる, ぶら下がっている\n\n~がたれる, たれ下がる; 掛かっている, 下がっている \n\nたれ下がって~になっている; ~に下がっている\n\n~が掛かっている, 陳列されている ;~が展示される\n\n煙、霧、においが宙に浮く, 漂う; ~が宙を舞う\n\nもたれかかる, 身を乗り出す, 突き出ている";
        word49.hatuon = @"hæŋ";
        word49.reibun = @"You may hang your coat on the hook.";
        
        TestWord *word50 = [TestWord new];
        word50.name = @"huge";
        word50.detail =  @"形容詞～r; ～st\n巨大な; 莫大な, 大変な; でっかい, 大した\nThe ___ ship was sunk by a homing missile.\nその巨大な軍艦は誘導ミサイルによって撃沈された。";
        word50.hatuon = @"hjuːdʒ";
        word50.reibun = @"The huge ship was sunk by a homing missile.";
        
        TestWord *word51 = [TestWord new];
        word51.name = @"necessary";
        word51.detail =  @"形容詞more ～; most ～\n必要な, 不可欠な\nShe will make ___ arrangements.\n彼女は必要な準備をするだろう。\n\n~することが必要だ\n\n~をする必要がある\n\n必然的な, 必然的に生じる\n\n名詞 複-ies/-z/\n生活必需品, 必要な物";
        word51.hatuon = @"nésəsèri, nésəs(ə)ri";
        word51.reibun = @"She will make necessary arrangements.";
        
        TestWord *word52 = [TestWord new];
        word52.name = @"pattern";
        word52.detail =  @"名詞 複～s/-z/\n様式, 形式, パターン ;型\nTraining and education follow different ___s in different regions.\n訓練と教育は場所によって従う形式が異なる。\n\n模様, デザイン;形式\n\n手本, 模範\n\n動詞\n他動詞\n~の型に倣って作られる";
        word52.hatuon = @"pǽtərn";
        word52.reibun = @"Training and education follow different patterns in different regions.";
        
        TestWord *word53 = [TestWord new];
        word53.name = @"propose";
        word53.detail =  @"動詞～s/-ɪz/; ～d/-d/; -posing\n他動詞\n~を提案する; 動議を提出する; ~しようと提案する\n\n指名する, 推薦する\n\n~を提案する; ~であると提唱する\n\n~をもくろむ; ~するつもりである\n\n自動詞\n結婚を申し込む\nHe had ___d marriage, unsuccessfully, twice already.\n彼は二回プロポーズしたが、二回とも失敗した。";
        word53.hatuon = @"prəpóʊz";
        word53.reibun = @"He had proposed marriage, unsuccessfully, twice already.";
        
        TestWord *word54 = [TestWord new];
        word54.name = @"purpose";
        word54.detail =  @"名詞 複～s/-ɪz/\n 目的, 意図, ねらい ; 理由, 趣旨\nWhat is the ___ of your visit?\nあなたの来訪の目的は何ですか？\n\n生きがい";
        word54.hatuon = @"pə́ːrpəs";
        word54.reibun = @"What is the purpose of your visit.";
        
        TestWord *word55 = [TestWord new];
        word55.name = @"release";
        word55.detail =  @"動詞～s/-ɪz/; ～d/-t/; ___ing\n他動詞\n~を解き放す, 自由にする;  ~を救出する\n\n~を放す; ~を投下する; ~を発射する\n\n~を公表、公開する\n\n~をはずす, 解く\n\n~を発散する, 表に出す; ~を発揮する\n\n~を放出する, 放つ\n\n~を解く, 免除する\n\n名詞 複～s/-ɪz/\n解放, 釈放, 退院; 救出 ; 解除; 解除装置\nThe prisoner was questioned before his ___.\nその囚人は解放される前に尋問された。\n\n~からの解放, 息抜き; 発散, 解放\n\n発売, リリース; 新譜; 映画の封切り; 封切り映画\n\n公開, 公表\n\n~の放出, 流出";
        word55.hatuon = @"rɪlíːs";
        word55.reibun = @"The prisoner was questioned before his release.";
        
        TestWord *word56 = [TestWord new];
        word56.name = @"require";
        word56.detail =  @"動詞～s/-z/; ～d/-d/; ___ing/-wáɪ(ə)rɪŋ/\n他動詞\n~を必要とする; ~を必要とする; ~することが必要である\nThis game ___s a minimum of three players.\nこのゲームは最低３人のプレイヤーが必要だ。\n\n~するように要求する, 命令する; ~を要求する";
        word56.hatuon = @"rɪkwáɪər";
        word56.reibun = @"This game requires a minimum of three players.";
        
        TestWord *word57 = [TestWord new];
        word57.name = @"single";
        word57.detail =  @"形容詞\nたった1つの\n\n個々の, 1つ1つの, 各々の; まさに, 唯一の\nThe letter was written on a ___ sheet of paper.\nその手紙は一枚の紙に書かれていた。\n\n独身の; ひとり身の\n\nベッドが1人用の; 部屋が1人専用の, シングルの\n\n片方だけの;切符が片道の; 花弁が一重の, ゲームがシングル試合の\n\n名詞\n独身者\n\n片道切符";
        word57.hatuon = @"sɪ́ŋɡ(ə)l";
        word57.reibun = @"The letter was written on a single sheet of paper.";
        
        TestWord *word58 = [TestWord new];
        word58.name = @"success";
        word58.detail =  @"名詞 複～es/-ɪz/\n成功; 出世; 合格\nThe school has only been open for six months, so it's hard to evaluate its ___.\nその学校は創設してまだ６ヶ月なので、成功か否かの評価は難しい。\n\nうまくいった事[物]; 大当たり\n\n成功した人";
        word58.hatuon = @"səksés";
        word58.reibun = @"The school has only been open for six months, so it's hard to evaluate its success.";
        
        TestWord *word59 = [TestWord new];
        word59.name = @"tear";
        word59.detail =  @"(1)名詞 複～s/-z/\n涙; 泣くこと\n\n(2)動詞～s/-z/; _ore/tɔːr/; _orn/tɔːrn/;～ing/téərɪŋ/\n他動詞\n~を引き裂く, 破る; ~を引き裂いて~にする; 穴を開ける\n\n~を引き裂いて~にする\n\n~を引きはがす, 破り取る, 引き離す\n\n分裂する, ばらばらになる  ; 心を引き裂かれる, 傷つく\nHer heart was _orn by anxiety.\n彼女の心は不安に引き裂かれた。\n\n自動詞\n~が裂ける, 破れる; 穴が開く\n\n引っぱる, 引き裂こうとする\n\n大急ぎで動く, 疾走する";
        word59.hatuon = @"(1)tɪər, (2)teər";
        word59.reibun = @"Her heart was torn by anxiety.";
        
        TestWord *word60 = [TestWord new];
        word60.name = @"theory";
        word60.detail =  @"名詞 複-ries/-z/\n学説, ~論\n\n原理; 理論, 理屈\nIn ___, anything could happen.\n理論上、どんな事でも起こり得る。\n\n推測, 憶測; 個人的見解";
        word60.hatuon = @"θíːəri|θɪ́ə-";
        word60.reibun = @"In theory, anything could happen.";
        
        words = [NSMutableArray arrayWithObjects:
                 word41, word42, word43, word44, word45, word46, word47, word48, word49,
                 word50, word51, word52, word53, word54, word55, word56, word57, word58, word59, word60, nil];
    }
    
    if ([wordNo isEqualToString:@"9"]) {
        TestWord *word61 = [TestWord new];
        word61.name = @"against";
        word61.detail =  @"前置詞\n~に反対して\nThere are 26 votes for him and 8 ___ him.\n彼に賛成が26、反対が8票ある。\n\n~に反して\n\n~に違反して\n\n~に対して, 対抗して\n\n~に不利で\n\n~によりかかって, もたれて\n\n~に当たって, 触って\n\n~に逆らって\nWe sailed ___ the wind.\n風に逆らって航行した。\n\n~を背にして, ~に映えて\n\n~と関連して; ~が背景となって; ~と引換えに\n\n~と比べて; ~と照らし合わせて\n\n~に備えて; ~を防いで, ~に対して";
        word61.hatuon = @"əɡénst, əɡéɪnst";
        word61.reibun = @"There are 26 votes for him and 8 against him.     We sailed against the wind.";
        
        TestWord *word62 = [TestWord new];
        word62.name = @"beach";
        word62.detail =  @"名詞 複～es/-əz/\n浜辺, 海岸, 湖岸; 砂浜, なぎさ";
        word62.hatuon = @"biːtʃ";
        word62.reibun = @"";
        
        TestWord *word63 = [TestWord new];
        word63.name = @"damage";
        word63.detail =  @"名詞 複～s/-ɪz/\n損害, 損傷, 被害\nThe flood did a lot of ___ to the crops.\nその洪水は農作物に大きな被害を与えた。\n\n損害賠償金\n\n動詞～s/-ɪz/; ～d/-d/; -aging\n他動詞\n~に損害[損傷]を与える; 健康を損なう";
        word63.hatuon = @"dǽmɪdʒ";
        word63.reibun = @"The flood did a lot of damage to the crops.";
        
        TestWord *word64 = [TestWord new];
        word64.name = @"discover";
        word64.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing/-kʌ́v(ə)rɪŋ/\n他動詞\n~を発見する, 見つける; ~に気付く\nThe fact is that he did not ___ it.\n彼がそれに気付かなかった事実。\n\n~ということを知る[悟る]; ~かどうかわかる\n\n~しているのを見つける; ~であるとわかる\n\n楽しみ、趣味を見いだす";
        word64.hatuon = @"dɪskʌ́vər";
        word64.reibun = @"The fact is that he did not discover it.";
        
        TestWord *word65 = [TestWord new];
        word65.name = @"emotion";
        word65.detail =  @"名詞 複～s/-z/\n感情, 気持ち; 感動, 感激 ; 情動\nLove, joy, hate, fear and grief are all ___s.\n愛、喜び、憎しみ、恐れ、悲しみは全て感情だ。";
        word65.hatuon = @"ɪmóʊʃ(ə)n";
        word65.reibun = @"Love, joy, hate, fear and grief are all emotions.";
        
        TestWord *word66 = [TestWord new];
        word66.name = @"fix";
        word66.detail =  @"動詞～es/-ɪz/; ～ed/-t/; ～ing\n他動詞\n~を固定する, 取り付ける\n\n~を留める ; ~を定着させる\n\n食事、飲み物を作る, 用意する\n\n~を修理する, 直す; 繕う;~を治療する\nMy watch has stopped, it needs ___ing.\n私の時計は止まったので、修理が必要だ。\n\n~を改善する, 解決する\n\n時間、場所、日時を決める; 特定する;価格を設定する, 固定する\nHave you ___ed on a date for the wedding?\n結婚式の日取りは決めましたか？\n\n~を不正に仕組む; 人を買収する; ~を不正に操作する\n\n~を整える\n\n視線、注意が引きつけられる, 注がれる\n\n自動詞\n視線が向く, じっと見つめる\n\n~するつもりである\n\n名詞\n困った状況, 苦境\n\n解決策";
        word66.hatuon = @"fɪks";
        word66.reibun = @"My watch has stopped, it needs fixing.     Have you fixed on a date for the wedding?";
        
        TestWord *word67 = [TestWord new];
        word67.name = @"frank";
        word67.detail =  @"形容詞～er; ～est/more ～; most ～\n率直な, ストレートな, 包み隠さない\nTo be very ___, I think you have very little chance of getting the job.\n正直に言うと、あなたがその仕事を得られるチャンスはほとんどないと思う。\n\n公然の, 明らかな";
        word67.hatuon = @"fræŋk";
        word67.reibun = @"To be very frank, I think you have very little chance of getting the job.";
        
        TestWord *word68 = [TestWord new];
        word68.name = @"identify";
        word68.detail =  @"動詞-fies/-z/; -fied/-d/; ～ing\n他動詞\n同一人物であると確認する, ~の身元を確認する, ~を同定する; ~であるとわかる\nI found it hard to ___ with any of the characters in the film.\nこの映画のどの役にもはっきりと見分けがつかなかった。\n\n~を特定する, 明確にする; ~か特定する\n\n~を同一視する, 関連づけて考える\n\n関係する, 共鳴する\n\n自動詞\n共感する, 一体感を持つ";
        word68.hatuon = @"aɪdéntəfàɪ";
        word68.reibun = @"I found it hard to identify with any of the characters in the film.";
        
        TestWord *word69 = [TestWord new];
        word69.name = @"island";
        word69.detail =  @"名詞 複～s/-dz/\n島; ~島;島の\n\n島に似たもの; 趣が周辺と異なる所";
        word69.hatuon = @"áɪlənd";
        word69.reibun = @"";
        
        TestWord *word70 = [TestWord new];
        word70.name = @"ocean";
        word70.detail =  @"名詞 複～s/-z/\n海\n\n海洋, 大洋; ~洋, ~海\n\n膨大な量[広がり]";
        word70.hatuon = @"óʊʃ(ə)n";
        word70.reibun = @"";
        
        TestWord *word71 = [TestWord new];
        word71.name = @"perhaps";
        word71.detail =  @"副詞\nひょっとすると , おそらく, ~かもしれない\nAs she's been ill ___ she'll need some help.\n彼女は病気になったので、助けが必要かもしれない。\n\nひょっとすると, たぶん, ~といったところである\n\nたぶん, だいたい, おおよそ\n\n~してはどうでしょう, ~してもらえないでしょうか, ~(して)さし上げましょうか;~した方がいいでしょう \n\nそうでしょうね, ええまあ;そうでしょうけど.";
        word71.hatuon = @"pərhǽps";
        word71.reibun = @"As she's been ill perhaps she'll need some help.";
        
        TestWord *word72 = [TestWord new];
        word72.name = @"pleasant";
        word72.detail =  @"形容詞more ～; most ～/\n楽しい;魅力的な, 気持ちのよい, 快い ; ~することは愉快だ\nWe spent many hours in a ___ conversation.\n私達は数時間楽しい会話を交わした。\n\n親しみやすい, 快活な, 好感のもてる; 礼儀正しい\n\n天候がよい, 快適な";
        word72.hatuon = @"pléz(ə)nt";
        word72.reibun = @"We spent many hours in a pleasant conversation.";
        
        TestWord *word73 = [TestWord new];
        word73.name = @"prevent";
        word73.detail =  @"動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n~するのを妨げる\nIt is the job of the police to ___ crime.\n犯罪を防ぐのは警察の職責だ。\n\n~を防ぐ, 中止させる; じゃまする\n\n~を予防する, 防止する";
        word73.hatuon = @"prɪvént";
        word73.reibun = @"It is the job of the police to prevent crime.";
        
        TestWord *word74 = [TestWord new];
        word74.name = @"rock";
        word74.detail =  @"名詞 複～s/-s/\n岩, 岩盤, 岩壁, 岩山\n\n岩石, 岩;石, 小石\n\n暗礁, 岩礁";
        word74.hatuon = @"rɑk|rɔk";
        word74.reibun = @"";
        
        TestWord *word75 = [TestWord new];
        word75.name = @"save";
        word75.detail =  @"動詞～s/-z/; ～d/-d/; ___ing\n他動詞\n~を救う, 救助する\nThe doctor managed to ___ his life.\nその医者は彼の命を救った。\n\n金を蓄える, 貯蓄する;~を取っておく\n\n~を節約する ; ~の節約になる \n\n~をしなくて済むようにする, ~のむだを省く; ~の手間を省く;~することを不要にする\n\n~を確保する\n\n自動詞\n貯金する";
        word75.hatuon = @"seɪv";
        word75.reibun = @"The doctor managed to save his life.";
        
        TestWord *word76 = [TestWord new];
        word76.name = @"step";
        word76.detail =  @"名詞 複～s/-s/\n歩み, ~歩; 歩幅\n\n問題解決、成功への一歩, 段階, 手段\nWe should take ___s to prevent war\n戦争を防ぐ手段を講じるべきだ。\n\n屋外の階段 \n\n階級, 職階\n\n歩調; 足取り, 歩くしぐさ; ステップ\n\n脚立\n\n動詞～s/-s/; ～ped/-t/; ～ping\n自動詞\n一歩進む, 一歩分動く\n\n短い距離を歩く";
        word76.hatuon = @"step";
        word76.reibun = @"We should take steps to prevent war.";
        
        TestWord *word77 = [TestWord new];
        word77.name = @"still";
        word77.detail =  @"副詞\nまだ, なお, 今でも, 依然として; 今後も\n\nそれでも, それにもかかわらず\nAlthough she felt ill, she ___ went to work.\n彼女は具合が悪かったが出勤した。\n\nそうだとしても\n\nさらに,いっそう\n\n形容詞～er; ～est\n静止した, 動かない, じっとした\n\n場所がしんとした, 音[声]がしない";
        word77.hatuon = @"stɪl";
        word77.reibun = @"Although she felt ill, she still went to work.";
        
        TestWord *word78 = [TestWord new];
        word78.name = @"taste";
        word78.detail =  @"名詞 複～s/-ts/\n味, 風味\nThe medicine has a bitter ___.\nその薬は苦みがある。\n\nセンス, 鑑賞[判断]力\n\n好み, 嗜好\n\n少量, 一口; 味見\n\n経験; 一端\n\n動詞～s/-ts/; ～d/-ɪd/; ___ing\n自動詞\n~な味がする\n\n~の味がする\n\n他動詞\n~を味わう; 味見する; 少し食べる[飲む]\n\n~の味がわかる, 味を感じる\n\n食物を口にする";
        word78.hatuon = @"teɪst";
        word78.reibun = @"The medicine has a bitter taste.";
        
        TestWord *word79 = [TestWord new];
        word79.name = @"throw";
        word79.detail =  @"動詞～s/-z/; threw/θruː/; ___n/θroʊn/; ～ing\n他動詞\n~を投げる\n\n~を無造作に置く, ほうり出す\nPick out some good apples from the box, and ___ away the rest.\n箱からいくつか良いリンゴを出して、残りは捨てた。\n\n~を発射する, 放つ ;~をかける\n\n~を押す, 動かす ; 相手を投げ倒す; 振り落とされる\n\n~を突然動かす; 身を投げ出す\n\n突然陥らせる, 投げ込む\n\n~を浴びせる, 落とす\n\n視線、ほほえみを投げかける, 向ける\n\n疑惑を投げかける\n\n~に投じる, 没頭する ; ~に注ぎ込む\n\n~を混乱させる, ろうばいさせる\n\nパーティを行う\n\n試合にわざと負ける\n\n自動詞\n投げる, ほうる; 振る\n\n名詞 複～s/-z/\n投げること;振ること";
        word79.hatuon = @"θroʊ";
        word79.reibun = @"Pick out some good apples from the box, and throw away the rest.";
        
        TestWord *word80 = [TestWord new];
        word80.name = @"wave";
        word80.detail =  @"名詞 複～s/-z/\n波\n\n振ること; 振って行う合図\n\n急増, 頻発; 高まり;波, 傾向\n\n波, 殺到\nThe boat was smashed by a huge ___.\nその船は巨大な波に呑まれた。\n\n動詞～s/-z/; ～d/-d/; ___ing\n自動詞\n手を振る\n\n~が揺れる, 揺らめく\n\n他動詞\n~を振る; ~を振り回す\n\n~に手を振って合図する; ~を振って指し示す\n\n手を振ってあいさつをする";
        word80.hatuon = @"weɪv";
        word80.reibun = @"The boat was smashed by a huge wave.";
        
        words = [NSMutableArray arrayWithObjects:
                 word61,
                 word62, word63, word64, word65, word66, word67, word68, word69, word70, word71, word72, word73,
                 word74, word75, word76, word77, word78, word79, word80, nil];
    }
    
    if ([wordNo isEqualToString:@"10"]) {
        TestWord *word81 = [TestWord new];
        word81.name = @"benefit";
        word81.detail =  @"名詞 複～s/-ts/\n利益, 利得; 利点, 特典; 恩恵; 成果\n\n公的補助金, ~手当\n\n給付金, 諸手当; 余得\n\n動詞\n他動詞\n~に利益[助力]を与える, ~のためになる\nThe new hospital will ___ the entire community.\n新しい病院は社会全体の利益となるだろう。\n\n自動詞\n利益[助力]を得る";
        word81.hatuon = @"bénɪfɪt";
        word81.reibun = @"The new hospital will benefit the entire community.";
        
        TestWord *word82 = [TestWord new];
        word82.name = @"certain";
        word82.detail =  @"形容詞more ～; most ～\n~だと確信している; ~することを確信している\n\n確かに[必ず]~する\n\n~だということは確かである, 明白である\nIt's ___ that every effect must have a cause.\n全ての結果に原因がある事は疑いの余地はない。\n\nある, 例の, あの\n\nいくらかの, ある程度の; かなりの\n\n決まっている, 一定の時刻、場所\n\n確実な, 信頼できる知識、証拠; 必ず起こる\n\n代名詞\n~の数人, 若干数, いくらか";
        word82.hatuon = @"sə́ːrt(ə)n";
        word82.reibun = @"It's certain that every effect must have a cause.";
        
        TestWord *word83 = [TestWord new];
        word83.name = @"chance";
        word83.detail =  @"名詞 複～s/-ɪz/\n見込み, 可能性 ; 勝算, 勝ち目 \nIs there any ___ of getting tickets for tonight's performance?\n今晩上演のチケットを手に入れられますか？\n\n機会; 好機, チャンス\n\n動詞～s/-ɪz/; ～d/-t/; ___ing\n他動詞\n~を思い切ってやってみる";
        word83.hatuon = @"tʃæns|tʃɑːns";
        word83.reibun = @"Is there any chance of getting tickets for tonight's performance?";
        
        TestWord *word84 = [TestWord new];
        word84.name = @"effect";
        word84.detail =  @"名詞 複～s/-ts/\n影響, 効果; 効用, 効能, ききめ\nThe aspirins soon took ___.\nアスピリンはすぐに効いた。\n\n効果, 装置; エフェクト; 印象, 雰囲気\n\n動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n結果をもたらす; 目的を成就する";
        word84.hatuon = @"ɪfékt";
        word84.reibun = @"The aspirins soon took effect.";
        
        TestWord *word85 = [TestWord new];
        word85.name = @"essential";
        word85.detail =  @"形容詞more ～; most ～\n必要不可欠な, きわめて重要な, 必須の\nConcentration is ___ if you want to do a good job.\nいい仕事をしたいなら集中力が必要だ。\n\n本質的な, 根本的な, 基本的な特徴、違い\n\n名詞 複～s/-z/\n必要不可欠な物\n\n最重要事項, 要点";
        word85.hatuon = @"ɪsénʃ(ə)l, es-";
        word85.reibun = @"Concentration is essential if you want to do a good job.";
        
        TestWord *word86 = [TestWord new];
        word86.name = @"far";
        word86.detail =  @"副詞\n遠く, ずっと, 遠くへ, はるかに\nHow ___ do you make it to the station?\n駅までどのくらいありますか？\n\n(時間)遠く, はるかに\n\nはるかに, 大いに, ずっと\n\nある場所、程度まで\n\n形容詞___ther; ___thest/further; furthest\n遠い方の, 向こうの; 最も遠い地点の; 奥の";
        word86.hatuon = @"fɑːr";
        word86.reibun = @"How far do you make it to the station.";
        
        TestWord *word87 = [TestWord new];
        word87.name = @"focus";
        word87.detail =  @"動詞～es, ～ed/-t/, ～ing\n他動詞\n注意、意識を集中させる\nThe noise made it hard for me to ___ on work.\nその騒音のせいで仕事に集中出来ない。\n\n~の焦点を合わせる\n\n自動詞\n焦点が合う, 焦点をしぼる; ~が集中する, 関心が向く\n\n名詞 複～es/-ɪz/, foci/-saɪ/\n中心, 焦点, 的\n\n重点, 力点; 目的, 意図\n\nピント";
        word87.hatuon = @"fóʊkəs";
        word87.reibun = @"The noise made it hard for me to focus on work.";
        
        TestWord *word88 = [TestWord new];
        word88.name = @"function";
        word88.detail =  @"名詞 複～s/-z/\n機能, 働き, 作用; 職務, 任務, 役割; 機能すること, 働き方\nThe ___ of the ear is to listen.\n耳の機能は聞く事だ。\n\n行事, 催し, 儀式, 祭典; 夕食会, パーティ\n\n動詞～s/-z/; ～ed/-d/; ～ing\n自動詞\n~が機能する, 働く, 動く; ~が正常に活動する\n\n機能[役割]を果たす ";
        word88.hatuon = @"fʌ́ŋ(k)ʃ(ə)n";
        word88.reibun = @"The function of the ear is to listen.";
        
        TestWord *word89 = [TestWord new];
        word89.name = @"grass";
        word89.detail =  @"名詞 複～es/-ɪz/\n草, 牧草; 芝\n\n草地, 牧草地;芝生, 芝地";
        word89.hatuon = @"ɡræs|ɡrɑːs";
        word89.reibun = @"";
        
        TestWord *word90 = [TestWord new];
        word90.name = @"guard";
        word90.detail =  @"名詞 複～s/-dz/\n警備員; 護衛; 警備隊\n\n防護器具, 安全装置\n\n防護, 防御, 防衛; 警戒, 監視, 警備\n\n警戒心, 用心, 不信感\n\n動詞～s/-dz/; ～ed/-ɪd/; ～ing\n他動詞\n~を守る, 保護する, 警備する\n\n~を監視する; ~を見張る\n\n秘密、情報、利得を守る, 守秘する, 漏らさない; 感情を表に出さない; ~を慎む, 控えめにする\n\n自動詞\n用心する, 警戒する; 発生を防ぐ, 予防する\nYou must ___ against catching a cold.\n風邪を引かないように予防しなければならない。";
        word90.hatuon = @"ɡɑːrd";
        word90.reibun = @"You must guard against catching a cold.";
        
        TestWord *word91 = [TestWord new];
        word91.name = @"image";
        word91.detail =  @"名詞 複～s/-ɪz/\n印象, イメージ\n\n像; 映像, 画像\nThe ___ in the mirror reflects his mood.\n鏡に彼の心情が映し出されている。\n\nそっくりな~\n\n象徴, 典型";
        word91.hatuon = @"ɪ́mɪdʒ";
        word91.reibun = @"The image in the mirror reflects his mood.";
        
        TestWord *word92 = [TestWord new];
        word92.name = @"immediate";
        word92.detail =  @"形容詞\n即座の, 即刻の, 即時の反応、行動、効果\nHe insisted on ___ payment.\n彼は即時払いを強く要求した。\n\n目下の, 目前の, 当面の, 急を要する必要な事、問題\n\nすぐ続いた; いちばん近い関係\n\n直接に接している, 隣の; じかの, 直接の原因\nThe ___ cause of death is unknown.\nその死の直接的原因は不明だ。";
        word92.hatuon = @"ɪmíːdiət, -dʒət";
        word92.reibun = @"He insisted on immediate payment.     The immediate cause of death is unknown.";
        
        TestWord *word93 = [TestWord new];
        word93.name = @"primary";
        word93.detail =  @"形容詞\n最も重要な, 主要な; 第1の\nAnother ___ reason is that there seems to be too many private cars and not enough public buses.\n別の主要な原因は自家用車が多過ぎて公共バスが少ないことだ。\n\n初等の, 初級の学校、教育\n\n最初の, 一次の, 初期の\n\n名詞 複-ries/-z/\n予備選挙\n\n原色 ";
        word93.hatuon = @"práɪmèri|-m(ə)ri";
        word93.reibun = @"Another primary reason is that there seems to be too many private cars and not enough public buses.";
        
        TestWord *word94 = [TestWord new];
        word94.name = @"proud";
        word94.detail =  @"形容詞～er; ～est\n誇りに思う, 誇るべき; うれしい, 喜ばしい\nIf your father had still been alive, he would have felt very ___ of you.\nもしあなたのお父様がご健在であれば、あなたを誇りに思ったでしょう。\n\n自慢げな, 得意になっている; 高慢な, 横柄な";
        word94.hatuon = @"praʊd";
        word94.reibun = @"If your father had still been alive, he would have felt very proud of you.";
        
        TestWord *word95 = [TestWord new];
        word95.name = @"remain";
        word95.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n自動詞\n~が~のままである, 相変わらず~だ\nThe present international situation ___s tense and turbulent.\n現在の国際情勢は未だ流動的で緊張が続いている。\n\n~にとどまる, 居残る\n\n~が残っている\n\nこれから~されなければならない, まだ~されないままだ\n\n名詞\n残り, 残り物";
        word95.hatuon = @"rɪméɪn";
        word95.reibun = @"The present international situation remains tense and turbulent.";
        
        TestWord *word96 = [TestWord new];
        word96.name = @"rest";
        word96.detail =  @"名詞 複～s/-ts/\n休息, 休憩; 休養; 睡眠\n\n解放 ; 安らぎ; 死, 永眠\n\n支え, 台\n\n動詞～s/-ts/; ～ed/-ɪd/; ～ing\n自動詞\n休息する, 休む; 眠る\n\n~の一部がある, 載っている ; もたれている\n\n見解、将来がかかっている, 基づく;依拠する, 当てにする\n\n決定、責任がかかっている, 次第である\n\n静止する; 問題、議論がそのままにされる\n\n永眠する\n\n他動詞\n~を休ませる, 休息させる\n\n腕、頭を置く, 載せる ;~をよりかからせる\n\n名詞\n残り\nWe'll eat some of the bread and keep the ___ for breakfast.\n私達はパンを少し食べて、残りは朝ご飯に取っておく。\n\nそのほかの~\n\n動詞\n自動詞\n~のままである, 依然として~である";
        word96.hatuon = @"rest";
        word96.reibun = @"We'll eat some of the bread and keep the rest for breakfast.";
        
        TestWord *word97 = [TestWord new];
        word97.name = @"separate";
        word97.detail =  @"動詞～s/-ts/; ～d/-ɪd/; -rating\n他動詞\n~を隔てる; ~を分ける; ~の勝敗を決める\n\n~を区分する, 分け隔てる, 仕切る\n\n引き離す, 別居させる, 離れ離れにさせる ; 仲たがいさせる\n\n~を区別する\n\n~をより分ける; 雑物を取り除く ; 成分の一部を分離する\nWe'd better ___ the good ones from the bad ones.\n良い物と悪い物を分けた方がいい。\n\n自動詞\n別れる, 離れる, 離脱する ; ~が離散する;分かれる\n\n夫婦が別居生活する; 別れて暮らす\n\n~がとれる, はがれる \n\n~が分離する\n\n形容詞\n~が離れた\n\n別々の, 個々の; 単独の; 異なる";
        word97.hatuon = @"sépərèɪt";
        word97.reibun = @"We'd better separate the good ones from the bad ones.";
        
        TestWord *word98 = [TestWord new];
        word98.name = @"site";
        word98.detail =  @"名詞 複～s/-ts/\n土地, 敷地\n\n出来事が起こった場所, 跡地\nRescue workers rushed to the ___ of the plane crash.\n救助隊員は飛行機墜落現場に急行した。\n\nウェブサイト\n\n動詞\n他動詞\n配置される, 設置される, 場所が決まる";
        word98.hatuon = @"saɪt";
        word98.reibun = @"Rescue workers rushed to the site of the plane crash.";
        
        TestWord *word99 = [TestWord new];
        word99.name = @"tail";
        word99.detail =  @"名詞 複～s/-z/\n尾, しっぽ\n\n尾に似たもの, たれているもの\n\n後部; 最後; 末尾";
        word99.hatuon = @"teɪl";
        word99.reibun = @"";
        
        TestWord *word100 = [TestWord new];
        word100.name = @"trouble";
        word100.detail =  @"名詞 複～s/-z/\n困ること; 迷惑; 困り事, やっかいな事\nI'm sorry to have to put you to so much ___\nご迷惑をおかけして申し訳ありません。\n\nやっかいな存在\n\n面倒なこと,手間, 骨折り, 努力; ~するのに苦労する\n\n苦しい状況, 危険な事態, 災難\n\nやっかいな事態 ,警察ざた\n\n問題点, 欠点, 短所\n\n心配事, 悩み事, 心配の種\n\n体の不調, 病気\n\n不調, 故障\n\nもめごと, 紛争, ごたごた\n\n動詞～s/-z/; ～d/-d/; -bling\n他動詞\n心配させる, 悩ませる, 困らせる\n\n~を苦しめる\n\n迷惑をかける\n\n自動詞\nわざわざ~しない";
        word100.hatuon = @"trʌ́b(ə)l";
        word100.reibun = @"I'm sorry to have to put you to so much trouble.";
        
        words = [NSMutableArray arrayWithObjects:
                 word81, word82, word83, word84, word85,
                 word86, word87, word88, word89, word90, word91, word92, word93, word94, word95, word96, word97,
                 word98, word99, word100, nil];
    }
    
    if ([wordNo isEqualToString:@"11"]) {
        
        TestWord *word1 = [TestWord new];
        word1.name = @"anymore";
        word1.detail = @"もはや, これ以上\nDon't waste my time ___.\nこれ以上私の時間を無駄にしないで。";
        word1.hatuon = @"ènimɔ'ːr";
        word1.reibun = @"Don't waste my time anymore.";
        
        TestWord *word2 = [TestWord new];
        word2.name = @"asleep";
        word2.detail = @"形容詞 副詞\n眠って\nHe soon fell ___ with weariness.\n彼は疲れからすぐに眠りについた。\n\n~がしびれて";
        word2.hatuon = @"əslíːp";
        word2.reibun = @"He soon fell asleep with weariness.";
        
        TestWord *word3 = [TestWord new];
        word3.name = @"berry";
        word3.detail = @"名詞 複-ries/-z/\nベリー";
        word3.hatuon = @"béri";
        word3.reibun = @"";
        
        TestWord *word4 = [TestWord new];
        word4.name = @"collect";
        word4.detail = @"動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n~を集める, 取りまとめる; ~を集合させる\n\n~を徴収する, 集金する;寄付金を集める, 募る\n\nいらない物をためる, ためこむ; 光、熱、エネルギーを集める\n\n~をまとめる; ~を奮い起こす; 心を落ち着ける, 気を取り直す\n\n給料、年金を受け取る; 賞品、賞金を勝ち取る\n\n~を取りに行く, 取ってくる; ~を回収する; 迎えに行く\nThe dustmen ___ the rubbish once a week.\nゴミ収集人は毎週一回ゴミを取りに来る。\n\n自動詞\n集まる, 参集する";
        word4.hatuon = @"kəlékt";
        word4.reibun = @"The dustmen collect the rubbish once a week.";
        
        TestWord *word5 = [TestWord new];
        word5.name = @"compete";
        word5.detail = @"動詞～s/-ts/; ～d/-ɪd/; -peting\n自動詞\n競争する, 競う, 張り合う, せり合う\nSeveral companies are ___ing for the contract.\nいくつかの会社がその契約を得る為に競っている。\n\nスポーツ、競技に参加する, 出場する\n\n匹敵する,勝負になる";
        word5.hatuon = @"kəmpíːt";
        word5.reibun = @"Several companies are competing for the contract.";
        
        TestWord *word6 = [TestWord new];
        word6.name = @"conversation";
        word6.detail =  @"名詞 複～s/-z/\n会話, おしゃべり, 対話, 座談, 雑談\nI listened to their ___.\n彼らの会話を聞いた。";
        word6.hatuon = @"kɑ̀nvərséɪʃ(ə)n|kɔ̀n-";
        word6.reibun = @"I listened to their conversation.";
        
        TestWord *word7 = [TestWord new];
        word7.name = @"creature";
        word7.detail = @"名詞 複～s/-z/\n生き物, 動物; 見知らぬ[想像上の]生物\nThis ___ lives in the depth of the ocean.\nその生物は深海に棲息している。\n\n言いなりになる者, 手先; とりこ";
        word7.hatuon = @"kríːtʃər";
        word7.reibun = @"This creature lives in the depth of the ocean.";
        
        TestWord *word8 = [TestWord new];
        word8.name = @"decision";
        word8.detail = @"名詞 複～s/-z/\n決定, 決意, 決心; 結論, 決着, 解決 ; 決定すること\nI don't think his ___ is wise in reality.\nその決定は懸命でないと思う。\n\n決断力, 決定能力\n\n評決, 判決";
        word8.hatuon = @"dɪsɪ́ʒ(ə)n";
        word8.reibun = @"I don't think his decision is wise in reality.";
        
        TestWord *word9 = [TestWord new];
        word9.name = @"either";
        word9.detail = @"副詞\n~か~かいずれか\nI will go on business ___ this week or next week.\n今週か来週に出張する。\n\n~でないなら~\n\n~も~もどちらも\n\n~もまた\n\nそれに, そのうえ, といっても\n\n形容詞\nどちらでも, どちらの~でも\n\nどちらの~も\n\n両方の~\n\n代名詞\nどちらか一方, どちらか\n\nどちらでも\n\nどちらも";
        word9.hatuon = @"íːðər, áɪ-|áɪ-, íː-";
        word9.reibun = @"I will go on business either this week or next week.";
        
        TestWord *word10 = [TestWord new];
        word10.name = @"forest";
        word10.detail = @"名詞 複～s/-ts/\n森林, 山林;森林;森の, 森に住む\n\n動詞\n他動詞\n~に植林する; ~を木々で覆う[森林化する]";
        word10.hatuon = @"fɔ́ːrəst";
        word10.reibun = @"";
        
        TestWord *word11 = [TestWord new];
        word11.name = @"ground";
        word11.detail =  @"名詞 複～s/-dz/\n地面, 地表;地上, 土, 土壌\n\n用地, ~場; 運動場, グラウンド;競技場\nYou shouldn't sit on the ___ when it's wet.\n地面が湿っている時は座るべきではない。\n\n敷地, 構内; 庭園\n\n海底, 湖底, 浅瀬\n\n沈殿物, かす\n\n理由, 根拠 ; 基礎, 基盤\n\n下塗り, 下地; バック, 背景色\n\n領域, 場所, 範囲; 主題, 話題;領域, 状況\n\n動詞～s/-z/; ～ed/-ɪd/; ～ing\n他動詞\n~を離陸させない, 地上にとめておく\n\n~を罰として遊びに行かせない\n\n~の基礎を教え込む";
        word11.hatuon = @"ɡraʊnd";
        word11.reibun = @"You shouldn't sit on the ground when it's wet.";
        
        TestWord *word12 = [TestWord new];
        word12.name = @"introduce";
        word12.detail =  @"動詞～s/-ɪz/; ～d/-t/; -ducing\n他動詞\n~を紹介する ; ~を引き合わせる, 紹介する; 自己紹介をする\nShe ___d me to her friend.\n彼女は私を彼女の友達に紹介した。\n\n~を導入する, 取り入れる; 持ち込む, 伝える, 広める\n\n~に触れさせる; ~に体験させる\n\n番組、話を始める ; 進行役を務める\n\n~が時代の始まりとなる\n\n話題を持ち出す\n\n~を注入する, 挿入する";
        word12.hatuon = @"ɪ̀ntrədjúːs";
        word12.reibun = @"She introduced me to her friend.";
        
        TestWord *word13 = [TestWord new];
        word13.name = @"marry";
        word13.detail =  @"動詞-ries/-z/; -ried/-d/; ～ing\n他動詞\n～と結婚する\nHe will ___ the girl first or last.\n彼は早晩その女の子と結婚するだろう。\n\n親が自分の子供を結婚させる;~を嫁[婿]にやる\n\n自動詞\n結婚する";
        word13.hatuon = @"mǽri, ｟米｠méri";
        word13.reibun = @"He will marry the girl first or last.";
        
        TestWord *word14 = [TestWord new];
        word14.name = @"prepare";
        word14.detail =  @"動詞～s/-z/; ～d/-d/; -paring/-péərɪŋ/\n他動詞\n~を準備する, 用意する, ~の段取りを整える\nHe is ___ing his speech for the meeting tomorrow.\n彼は明日集会で行うスピーチの準備をしている。\n\n~のために食事、飲み物を作る\n\n心の準備をさせる; ~する覚悟をさせる\n\n訓練する, 経験を積ませる\n\n自動詞\n準備を整える ; ~する準備をする\n\n覚悟をする";
        word14.hatuon = @"prɪpéər";
        word14.reibun = @"He is preparing his speech for the meeting tomorrow.";
        
        TestWord *word15 = [TestWord new];
        word15.name = @"sail";
        word15.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n自動詞\n航海する, 航行する, 帆走する\n\n出航する, 出帆する\nThis ship ___s for New York on Monday.\nこの船は月曜日ニューヨークに向けて出航する。\n\nヨットを操縦する\n\n他動詞\n海を航海する, 渡る; 飛行機が空を航行する, 飛ぶ\n\n名詞 複～s/-z/\n帆 \n\n航海, 帆走; 航程";
        word15.hatuon = @"seɪl";
        word15.reibun = @"This ship sails for New York on Monday.";
        
        TestWord *word16 = [TestWord new];
        word16.name = @"serious";
        word16.detail =  @"形容詞more ～; most ～\n~が重大な, 危険な, 重い, 深刻な, ゆゆしい; 重要な\nDo not treat this ___ matter as a joke.\nその大事を冗談にするな。\n\n本気の, 熱心な ; まじめな; ~が遊びではない\n\n本格的な, まじめな; 芸術本位の, かたい記事、作品\n\nきまじめな, 思慮深い; 無口な, 笑わない; 心配顔の\n\n大量の金額; 性能がよい, 値段が高い物";
        word16.hatuon = @"sɪ́əriəs";
        word16.reibun = @"Do not treat this serious matter as a joke.";
        
        TestWord *word17 = [TestWord new];
        word17.name = @"spend";
        word17.detail =  @"動詞～s/-dz/; ___t/spent/; ～ing\n他動詞\n金を使う, 費やす\n\n時間を費やす, かける ;時を過ごす\nYou really shouldn't ___ so much effort on it.\nそれに多大な努力を費やすべきではない。\n\n~を使う, 費やす; 力、勢いが尽きる; 疲れ果てる\n\n自動詞\n金を遣う";
        word17.hatuon = @"spend";
        word17.reibun = @"You really shouldn't spend so much effort on it.";
        
        TestWord *word18 = [TestWord new];
        word18.name = @"strange";
        word18.detail =  @"形容詞～r; ～st\n奇妙な, 普通でない, 変な, 不思議な\nHe had a ___ expression on his face.\n彼は妙な顔つきを露にした。\n\n見知らぬ, 初めての\n\n不慣れな, 経験がない; 勝手が違ってしっくりしない, 違和感がある\n\n副詞\n通常と違って, 不自然に";
        word18.hatuon = @"streɪn(d)ʒ";
        word18.reibun = @"He had a strange expression on his face.";
        
        TestWord *word19 = [TestWord new];
        word19.name = @"truth";
        word19.detail =  @"名詞 複～s/-ðz, -θs/\n真実, 事実, 本当のこと\nIt is far from the ___.\nそれは事実からは程遠い。\n\n真実であること, 真実味\n\n事実, 真理";
        word19.hatuon = @"truːθ";
        word19.reibun = @"It is far from the truth.";
        
        TestWord *word20 = [TestWord new];
        word20.name = @"wake";
        word20.detail =  @"動詞～s/-s/; woke/woʊk/; woken/woʊk(ə)n/; ___ing\n自動詞\n目を覚ます, 起きる ; 目覚めて~する\nI usually ___ up early.\nいつも早起きする。\n\n目覚める, 気づく\n\n他動詞\n~を目覚めさせる, 起こす\n\n~を目覚めさせる, 活気づける;人に気づかせる";
        word20.hatuon = @"weɪk";
        word20.reibun = @"I usually wake up early.";
        
        
        words = [NSMutableArray arrayWithObjects:
                 word1, word2, word3, word4, word5, word6, word7, word8, word9, word10, word11, word12, word13,
                 word14, word15, word16, word17, word18, word19, word20, nil];
    }
    
    if ( [wordNo isEqualToString:@"12"]){
        TestWord *word21 = [TestWord new];
        word21.name = @"alone";
        word21.detail =  @"形容詞\nたったひとりだ, 自分(たち)だけだ\nI was ___ in the classroom.\n教室でたった一人だった。\n\n孤独だ; 身寄り[知り合い]がない\n\n他に匹敵[比較]するものがない\n\n~のみ\n\n副詞\n一人で, 単身[単独]で; ~だけで, 独力で";
        word21.hatuon = @"əlóʊn";
        word21.reibun = @"I was alone in the classroom.";
        
        TestWord *word22 = [TestWord new];
        word22.name = @"apartment";
        word22.detail =  @"名詞 複～s/-ts/\nアパート, マンション\nI have an ___ in downtown Manhattan.\nマンハッタンの商業地区にアパートを持っている。\n\n部屋";
        word22.hatuon = @"əpɑ́ːrtmənt";
        word22.reibun = @"I have an apartment in downtown Manhattan.";
        
        TestWord *word23 = [TestWord new];
        word23.name = @"article";
        word23.detail =  @"名詞 複～s/-z/\n記事, 論説; 論文\nShe asked him to contribute a biweekly ___ on European affairs.\n彼女は彼に毎週ヨーロッパの状況に関する記事を書くように求めた。\n\n物, 品物, 商品;1個, 1品\n\n条項, 項目, 箇条; 規約";
        word23.hatuon = @"ɑ́ːrtɪk(ə)l";
        word23.reibun = @"She asked him to contribute a biweekly article on European affairs.";
        
        TestWord *word24 = [TestWord new];
        word24.name = @"artist";
        word24.detail =  @"名詞 複～s/-ts/\n芸術家\n\n絵のうまい人\n\n達人, 名人, 通";
        word24.hatuon = @"ɑ́ːrtəst";
        word24.reibun = @"";
        
        TestWord *word25 = [TestWord new];
        word25.name = @"attitude";
        word25.detail =  @"名詞 複～s/-dz/\n態度, 姿勢; 考え方, 意見, 判断\nWe must maintain a firm ___.\n我々は断固とした態度を取らなければならない。\n\n姿勢, 身構え\n\n";
        word25.hatuon = @"ǽtətjùːd";
        word25.reibun = @"We must maintain a firm attitude.";
        
        TestWord *word26 = [TestWord new];
        word26.name = @"compare";
        word26.detail =  @"動詞～s/-z/; ～d/-d/; -paring\n他動詞\n~を比べる; ~を比較する\nI ___d the copy with the original, but there was not much difference.\nコピーと原物を比べたが、大きな違いはなかった。\n\n~にたとえる, なぞらえる; ~が同じであると考える, 同等とみなす\n\n自動詞\n~と比べられる, 比較される\n\n~とは比べものにならない, 比べられない";
        word26.hatuon = @"kəmpéər";
        word26.reibun = @"I compared the copy with the original, but there was not much difference.";
        
        TestWord *word27 = [TestWord new];
        word27.name = @"judge";
        word27.detail =  @"名詞 複～s/-ɪz/\n裁判官, 判事; 治安判事\n\n審判, 審査員 \n\n適切な判断力のある人; 目きき, 鑑定家\n\n動詞～s/-ɪz/; ～d/-d/; judging\n他動詞\n~を判断する, 評価する ; ~であると判断する, 見極める; ~を批判する\n\n~を推定する, 見積もる; ~であると推定する\nHe's too young to ___ which is better.\n彼は若すぎるのでどちらが良いか判断出来ない。\n\n~を裁判する, ~に判決を下す\n\n自動詞\n判断する";
        word27.hatuon = @"dʒʌdʒ";
        word27.reibun = @"He's too young to judge which is better.";
        
        TestWord *word28 = [TestWord new];
        word28.name = @"magazine";
        word28.detail =  @"名詞 複～s/-z/\n雑誌, 定期刊行物\n\n雑誌の";
        word28.hatuon = @"mǽɡəzìːn";
        word28.reibun = @"";
        
        TestWord *word29 = [TestWord new];
        word29.name = @"material";
        word29.detail =  @"名詞 複～s/-z/\n生地, 服地\n\n原料, 材料, 素材\nThe workshop has shut down for lack of raw ___.\n原料不足によって作業場は操業停止している。\n\n用具, 道具\n\n題材, 情報, 考え; 資料\n\n人材, 人物\n\n曲, 出し物\n\n形容詞\n物質的な; 肉\n\n物質の; 有形の\n\n証拠、情報が重要な, 重大な";
        word29.hatuon = @"mətɪ́əriəl";
        word29.reibun = @"The workshop has shut down for lack of raw material.";
        
        TestWord *word30 = [TestWord new];
        word30.name = @"meal";
        word30.detail =  @"名詞 複～s/-z/\n食事の時間; 食事量, 1食分\nThis is the best ___ I had ever eaten.\nこれは私が食べた中で最高の食事だ。";
        word30.hatuon = @"miːl";
        word30.reibun = @"This is the best meal I had ever eaten.";
        
        TestWord *word31 = [TestWord new];
        word31.name = @"method";
        word31.detail =  @"名詞 複～s/-dz/\n方法, 方式\nI have a simple and easy ___.\n私には簡単で手軽な方法がある。\n\n秩序, 順序; 筋道; きちょうめんなこと";
        word31.hatuon = @"méθəd";
        word31.reibun = @"I have a simple and easy method.";
        
        TestWord *word32 = [TestWord new];
        word32.name = @"neighbor";
        word32.detail =  @"名詞 複～s/-z/\n隣人, 近所の人\nI borrowed a mower from my ___ to cut grass in my garden.\n庭の草を刈る為に近所の人から草刈り機を借りた。\n\n隣の人; 隣り合った物; 隣国\n\n同胞, 仲間\n\n形容詞\n隣[近く]に住む";
        word32.hatuon = @"néɪbər";
        word32.reibun = @"I borrowed a mower from my neighbor to cut grass in my garden.";
        
        TestWord *word33 = [TestWord new];
        word33.name = @"professional";
        word33.detail =  @"形容詞\n職業の, 職業に関する, 専門職の, 専門的な\n\n熟練した, くろうとはだしの\n\n本職の; プロの\nHe is a ___ journalist.\n彼はプロのジャーナリストだ。\n\n名詞 複～s/-z/\nプロ選手, くろうと\n\n職業人, 専門家\n\n熟練者";
        word33.hatuon = @"prəféʃ(ə)n(ə)l";
        word33.reibun = @"He is a professional journalist.";
        
        TestWord *word34 = [TestWord new];
        word34.name = @"profit";
        word34.detail =  @"名詞 複～s/-ts/\n利益, もうけ, 利潤, 黒字\nThere is very little ___ in selling newspapers at present.\n現在新聞を売却してもほとんど利益がない。\n\n利益, 得\n\n動詞～s/-ts/; ～ed/-ɪd/; ～ing\n自動詞\n利益を得る\n\n得をする; 教訓を得る\n\n他動詞\nの利益になる, 役に立つ";
        word34.hatuon = @"prɑ́fət|prɔ́f-";
        word34.reibun = @"There is very little profit in selling newspapers at present.";
        
        TestWord *word35 = [TestWord new];
        word35.name = @"quality";
        word35.detail =  @"名詞 複-ties/-z/\n質, 性質, 品質;特性, 特質, 属性\nHe examined the ___ of the furniture carefully.\n彼はその家具の品質を慎重に調べた。\n\n性格, 性質; 資質, 特徴\n\n高品質, 高水準, 上質, 良質\n\n形容詞\n高品質の";
        word35.hatuon = @"kwɑ́ləti|kwɔ́l-";
        word35.reibun = @"He examined the quality of the furniture carefully.";
        
        TestWord *word36 = [TestWord new];
        word36.name = @"shape";
        word36.detail =  @"名詞 複～s/-s/\n形, 形状; 輪郭;体形, スタイル\nThis island is triangular in ___.\nこの島は三角形の形をしている。\n\nおぼろげな姿の物, まぼろし, 幽霊\n\n具体的な形, 実現; 表現\n\n姿, 形\n\n状態, 調子\n\n型, 鋳型\n\n動詞～s/-s/; ～d/-t/; shaping\n他動詞\n~を形作る, 具体化する ; ~に影響を与える, ~を方向づける; ~を言い表す\n\n~を形作る ; 材料を押して~を作る\n\n~を適合させる, 合わせる\n\n自動詞\n~が思い通りに進展する; まとまる, 具体化する";
        word36.hatuon = @"ʃeɪp";
        word36.reibun = @"This island is triangular in shape.";
        
        TestWord *word37 = [TestWord new];
        word37.name = @"space";
        word37.detail =  @"名詞 複～s/-ɪz/\n場所, スペース, 空間 ; 広々としていること; 空き容量\nIt's easier for small car to find a parking ___.\n小型車は比較的簡単に駐車スペースが見つかる。\n\nすきま; 間隔, 距離\n\n場所, 空間; 面積\n\n土地\n\n宇宙空間;宇宙の\n\n空間\n\n期間;間隔; しばらくの間\n\n自由な時間\n\n語間, スペース; 文字の幅\n\n余白; 紙面; コマーシャルの時間\n\n動詞\n他動詞\n~を一定の間隔で置く; ~を一定の間隔で行う; ~の語間を空ける";
        word37.hatuon = @"speɪs";
        word37.reibun = @"It's easier for small car to find a parking space.";
        
        TestWord *word38 = [TestWord new];
        word38.name = @"stair";
        word38.detail =  @"名詞 複～s/-z/\n階段\n\n階段の1段\nThe child was sitting on the bottom ___.\n階段の一番下の段に座っていた。";
        word38.hatuon = @"steər";
        word38.reibun = @"The child was sitting on the bottom stair.";
        
        TestWord *word39 = [TestWord new];
        word39.name = @"symbol";
        word39.detail =  @"名詞 複～s/-z/\n象徴, 表象, シンボル\nThe dove is the ___ of peace.\n鳩は平和の象徴だ。\n\n記号, 符号";
        word39.hatuon = @"sɪ́mb(ə)l";
        word39.reibun = @"The dove is the symbol of peace.";
        
        TestWord *word40 = [TestWord new];
        word40.name = @"thin";
        word40.detail =  @"形容詞～ner; ～nest\n薄い; ~が薄手の\nThe ice on the pond is too ___ for skating.\nその池の氷はスケートをするには薄すぎる。\n\nやせて, ~が細い, ~が薄い, やせ細った\n\n液体が薄い, 水っぽい, 酒が弱い\n\n霧煙が薄い; 空気、気体が薄い, 希薄な\n\n~がまばらな, 閑散とした\n\n声、音がか細い; 色、光が弱い\n\n髪が薄い, まばらな; ~が茂っていない\n\n不景気の, ふるわない; 中身が乏しい\n\n説得力のない, 内容の薄い; 情報が乏しい\n\n動詞～s; ～ned; ～ning\n自動詞\n~がまばらになる\n\n髪が薄くなる";
        word40.hatuon = @"θɪn";
        word40.reibun = @"The ice on the pond is too thin for skating.";
        
		words = [NSMutableArray arrayWithObjects:
                 word21, word22, word23, word24, word25,
                 word26, word27, word28, word29, word30, word31, word32, word33, word34, word35, word36, word37,
                 word38, word39, word40,nil];
    }
    
    if ( [wordNo isEqualToString:@"13"]){
        TestWord *word41 = [TestWord new];
        word41.name = @"blood";
        word41.detail =  @"名詞\n血, 血液\n\n血統, 家系\n\n体液; 樹液\n\n流血, 暴力\n\n血気, 情熱";
        word41.hatuon = @"blʌd";
        word41.reibun = @"";
        
        TestWord *word42 = [TestWord new];
        word42.name = @"burn";
        word42.detail =  @"動詞～s/-z/; ～ed/-d/, ～t/-t/; ～ing\n自動詞\n~が燃える; ~が燃えている, 火事である; 燃えて~になる\n\n焦げる; 焦げて~になる\nHalf the candle had ___t away.\n蝋燭の半分が燃えた。\n\n日焼けする\n\nやけどをする ; ~がやけどをつくる\n\n燃料が燃える, 燃焼する\n\n光、灯火が輝く, ともる, 目が光る\n\n痛い, ひりひりする; ほてる\n\n~が熱くなっている, 紅潮している\n\n他動詞\n~を燃やす, 焼く; ~を燃やして力, 熱, 光を作る, ~を燃料とする; 火をともす\n\nやけどする\n\n~を焦がす, 焦げつかせる; 焼いて~に穴をあける; ~を焼いて~にする\n\n日焼けさせる; ~を日焼けさせて~にする\n\n~をひどく熱く感じさせる; ひりひりさせる\n\n名詞 複～s/-z/\nやけど, 熱傷 ; 焼け跡 ; 焼き印; 日焼け";
        word42.hatuon = @"bəːrn";
        word42.reibun = @"Half the candle had burnt away.";
        
        TestWord *word43 = [TestWord new];
        word43.name = @"cell";
        word43.detail =  @"名詞 複～s/-z/\n細胞\n\n独房, 監房\nThe prisoner was locked in a ___.\n囚人は独房に閉じ込められた。";
        word43.hatuon = @"sel";
        word43.reibun = @"The prisoner was locked in a cell.";
        
        TestWord *word44 = [TestWord new];
        word44.name = @"contain";
        word44.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\n~を含む, 入れている; 情報、考えを含む, 取り込んでいる; 物質が~を含む; 団体、組織が人数から成っている; 部屋、会場が人数を収容する\nDoes each cup ___ the same amount of milk?\nどのコップも同じ量のミルクが入っていますか？";
        word44.hatuon = @"kəntéɪn";
        word44.reibun = @"Does each cup contain the same amount of milk?";
        
        TestWord *word45 = [TestWord new];
        word45.name = @"correct";
        word45.detail =  @"形容詞more ～; most ～/～er; ～est\n正しい, 誤りのない, 正確な, 本当の\nYour answer to the question is ___.\nその問題に対するあなたの答えは正しい。\n\nふさわしい, 適切な; ~が礼儀正しい, 丁寧な\n\n動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n~を訂正する, 直す, 正す; ~を添削する\n\nしかる, 罰する";
        word45.hatuon = @"kərékt";
        word45.reibun = @"Your answer to the question is correct.";
        
        TestWord *word46 = [TestWord new];
        word46.name = @"crop";
        word46.detail =  @"名詞 複～s/-s/\n作物, 農産物\nThe flood did a lot of damage to the ___s.\nその洪水は農作物に大きな被害を与えた。\n\n収穫高, 作柄; 生産高\n\n続出する~; ~の集まり\n\n動詞～s/-s/; ～ped/-t/; ～ping\n他動詞\n~を短く切る; ~を刈って~にする\n\n~を切り落とす;不要な部分を切る\n\n自動詞\n作物ができる, 取れる";
        word46.hatuon = @"krɑp|krɔp";
        word46.reibun = @"The flood did a lot of damage to the crops.";
        
        TestWord *word47 = [TestWord new];
        word47.name = @"demand";
        word47.detail =  @"名詞 複～s/-dz/\n需要\n\n要求, 請求\nTheir ___ is entirely justified.\n彼らの要求は全く正当だ。\n\n負担, 差し迫った必要\n\n動詞～s/-dz/; ～ed/-ɪd/; ～ing\n他動詞\n~を要求する, 求める, 請求する ; ~することを要求する\n\n~するように要求する\n\n~を必要とする, 要する\n\n自動詞\n必要とする";
        word47.hatuon = @"dɪmǽnd|-mɑ́ːnd";
        word47.reibun = @"Their demand is entirely justified.";
        
        TestWord *word48 = [TestWord new];
        word48.name = @"equal";
        word48.detail =  @"形容詞more ～; most ～\n等しい, 同じで\n\n平等な, 対等の; 均等な, 一様な\n\n能力がある \n\n互角な,  匹敵する\nNobody can ___ him in intelligence.\n彼の知性に敵う者は誰もいない。\n\n動詞～s; ～ed; ～ing\n\n他動詞\n~と等しい\n\n~に匹敵する, 並ぶ\n\n名詞\n対等な~, 匹敵する~";
        word48.hatuon = @"íːkw(ə)l";
        word48.reibun = @"Nobody can equal him in intelligence.";
        
        TestWord *word49 = [TestWord new];
        word49.name = @"feed";
        word49.detail =  @"動詞～s/-dz/; _ed/_ed/; ～ing\n他動詞\nえさをやる; 肥料をやる; 食事を与える\nWill you ___ my cat for me?\n私の猫にえさを与えてくれませんか？\n\n~を養う\n\n食べ物、えさを与える\n\n燃料、コインを提供する, 投入する;コンピュータにデータを送る\n\n情報、うそを伝える, 吹き込む\n\n~をあおる; 虚栄心、罪悪感を感じさせる; ~を楽しませる\n\n自動詞\nえさを食べる; 乳を飲む\n\n名詞 複～s/-dz/\nえさ, かいば, 飼料";
        word49.hatuon = @"fiːd";
        word49.reibun = @"Will you feed my cat for me?";
        
        TestWord *word50 = [TestWord new];
        word50.name = @"hole";
        word50.detail =  @"名詞 複～s/-z/\n穴; くぼみ; すき間, 破れ目\nThere is a ___ in my sock.\n私の靴下に穴が開いている。\n\n巣穴, 隠れ家; 独房, 土牢\n\n苦境, 窮地; ~の空き, 時間のすき間\n\n欠点, 不備, 弱点\n\n他動詞\n~が穴があく";
        word50.hatuon = @"hoʊl";
        word50.reibun = @"There is a hole in my sock.";
        
        TestWord *word51 = [TestWord new];
        word51.name = @"increase";
        word51.detail =  @"動詞～s/-ɪz/; ～d/-t/; ___ing\n自動詞\n増える, 増加する\nThey have ___d the price of petrol again.\n彼らは再びガソリン代を値上げした。\n\n他動詞\n~を増やす, 高める\n\n名詞 複～s/-ɪz/\n増加, 上昇; 増加量";
        word51.hatuon = @"ɪnkríːs";
        word51.reibun = @"They have increased the price of petrol again.";
        
        TestWord *word52 = [TestWord new];
        word52.name = @"lord";
        word52.detail =  @"名詞 複～s/-dz/\n高位の貴族\n\n領主, 地主; 荘園主\n\n~長, 長官; ~主教\n\n主, 神; キリスト";
        word52.hatuon = @"lɔːrd";
        word52.reibun = @"";
        
        TestWord *word53 = [TestWord new];
        word53.name = @"owe";
        word53.detail =  @"動詞～s/-z/; ～d/-d/; ___ing\n借金がある, お金、金額を借りている; ~に金額の借金がある, ~にお金を借りている\nIncidentally, I think you still ___ me some money.\nついでに、あなたは私にまだいくらかのお金を返していないと思う。\n\n恩義[借り]がある ; ~に返すべきものをもらっている; ~を返す[する]義務がある\n\n~のおかげである\n\nある気持ちを抱いている\n\n~する義務がある";
        word53.hatuon = @"oʊ";
        word53.reibun = @"Incidentally, I think you still owe me some money.";
        
        TestWord *word54 = [TestWord new];
        word54.name = @"position";
        word54.detail =  @"名詞 複～s/-z/\n位置;所定の位置; 場所\nCan you find our ___ on this map?\nこの地図で私達の位置を見つけられますか？\n\n状況、財務状況\n\n姿勢; 向き;方向\n\n態度, 判断, 意見\n\n職, 仕事\n\n地位, 階級, 役職\n\n立場\n\n動詞\n他動詞\n~を置く";
        word54.hatuon = @"pəzɪ́ʃ(ə)n";
        word54.reibun = @"Can you find our position on this map?";
        
        TestWord *word55 = [TestWord new];
        word55.name = @"raise";
        word55.detail =  @"動詞～s/-ɪz/; ～d/-d/; raising\n他動詞\n~の一部を上げる\n\n~を掲げる; ~を立てる, ~を起こす\n\n起き上がる\n\n~を上げる, 増やす\n\n~を向上させる, 上げる\n\n~を育てる, 養育する\n\n~を飼育する; ~を栽培する\n\n金を募る; 資金を集める\n\n~を提起する; 質問、異議を出す\n\n恐怖、疑惑を引き起こす; ~を生じさせる\n\n声を張り上げる; 警報を鳴らす\n\n封鎖、包囲を解く, 解除する\n\n数字を累乗する\n\n水ぶくれを作る; パンをふくらませる\n\n名詞\n昇給額, 賃上げ\nThe percentage of the pay ___ equals the increase in prices.\n賃金上昇と物価上昇の割合は等しい。";
        word55.hatuon = @"reɪz";
        word55.reibun = @"The percentage of the pay raise equals the increase in prices.";
        
        TestWord *word56 = [TestWord new];
        word56.name = @"responsible";
        word56.detail =  @"形容詞more ～; most ～\n~に責任[責務]がある; 責任を負うべき\n\n~が原因である, 招いた\n\n信頼できる, 責任を果たしうる\nWe all think of her as a ___ teacher.\n私達は彼女を責任感のある教師だと思っている。\n\n責任能力が必要な, 責任の重い";
        word56.hatuon = @"rɪspɑ́nsəb(ə)l|-spɔ́n-";
        word56.reibun = @"We all think of her as a responsible teacher.";
        
        TestWord *word57 = [TestWord new];
        word57.name = @"sight";
        word57.detail =  @"名詞複～s/-ts/\n視力, 視覚\n\n見る[見える]こと; 一見, 一瞥\n\n視野, 見える範囲, 視界\nThe train is still in ___.\nその列車がまだ見える。\n\n景色, 光景, 眺め \n\n名所, 見所\n\nねらい, 目標\n\n物笑いの種, ひどいもの\n\n多数[多量]の~";
        word57.hatuon = @"saɪt";
        word57.reibun = @"The train is still in sight.";
        
        TestWord *word58 = [TestWord new];
        word58.name = @"spot";
        word58.detail =  @"名詞複～s/-ts/\n場所, 地点\nThis is the ___ where the two trucks collided.\nここはトラックが衝突した場所だ。\n\n斑点, まだら, ぶち; 染み, 汚点; 水玉模様\n\n発疹; にきび, 吹き出物\n\n出場, 出演, 出番; スポット広告\n\n良い、悪い点, 事, 箇所\n\n少量の~\n\n動詞～s/-ts/; ～ted/-ɪd/; ～ting\n他動詞\n~を見つける, 発見する, ~に気づく; ~しているのを見つける; ~ということに気づく\n\n~の能力、性質を見抜く, 察知する\n\n斑点、しみになっている\n\n自動詞\n雨がポツポツ降る\n\n形容詞\n即時支払いの, 現物取引の\n\n現場からの; ニュース、広告が番組の間に挿入される, 臨時の";
        word58.hatuon = @"spɑt|spɔt";
        word58.reibun = @"This is the spot where the two trucks collided.";
        
        TestWord *word59 = [TestWord new];
        word59.name = @"structure";
        word59.detail =  @"名詞 複～s/-z/\n構造, 仕組み, 構成; 組織, 機構\nWe learnt about the ___ of the brain today.\n今日私達は脳の構造について学んだ。\n\n建造物, 建築物, 構造物";
        word59.hatuon = @"strʌ́ktʃər";
        word59.reibun = @"We learnt about the structure of the brain today.";
        
        TestWord *word60 = [TestWord new];
        word60.name = @"whole";
        word60.detail =  @"形容詞\n全体の~, 全部の~, まるごとの~\nThe ___ country was anxious for peace.\n国中が平和を切望した。\n\n1つ丸ごとの; 丸~の期間, ~中\n\nたいへんな~, ものすごい~, 大事な~\n\n無傷で; 健康で\n\n名詞\n~全体, ~の全部\n\n統一体, 完全体\n\n副詞\n違いを強調して まったく";
        word60.hatuon = @"hoʊl";
        word60.reibun = @"The whole country was anxious for peace.";
        
		words = [NSMutableArray arrayWithObjects:
                 word41, word42, word43, word44, word45, word46, word47, word48, word49,
                 word50, word51, word52, word53, word54, word55, word56, word57, word58, word59, word60, nil];
    }
    
    if ( [wordNo isEqualToString:@"14"]){
        TestWord *word61 = [TestWord new];
        word61.name = @"coach";
        word61.detail =  @"名詞 複～es/-ɪz/\nコーチ, 指導者\nThe football ___ was criticized by the local paper.\nそのサッカーのコーチは地元紙に非難された。\n\nエコノミークラス, 普通席\n\n長距離[観光]バス\n\n動詞\n他動詞\nを指導する, コーチする;の家庭教師をする;  ~を訓練する ;のコーチを務める";
        word61.hatuon = @"koʊtʃ";
        word61.reibun = @"The football coach was criticized by the local paper.";
        
        TestWord *word62 = [TestWord new];
        word62.name = @"control";
        word62.detail =  @"名詞 複～s/-z/\n支配, 指揮, 管理; 統制(力)\n\n抑制, 規制, 制御 ; (感情の)抑制; 抑制策[手段], 規制\n\n操縦[制御]装置; 調整つまみ\nInflation has got out of ___.\nインフレは抑えられなくなった。\n\n検査(所), 管理(法), 検査官; 管制[管理]係\n\n動詞～s/-z/; ～led/-d/; ～ling\n他動詞\nを支配する, 指揮する, 操る\n\nを抑制する; を制限する, 統制する\n\nを食い止める, 抑える";
        word62.hatuon = @"kəntróʊl";
        word62.reibun = @"Inflation has got out of control.";
        
        TestWord *word63 = [TestWord new];
        word63.name = @"description";
        word63.detail =  @"名詞 複～s/-z/\n記述, 描写, 説明; 記述[描写, 説明]すること\nHe gave a ___ of what he had seen.\n彼は彼が目にした事を述べた。\n\n種類, たぐい\n\n説明書; 人相書き";
        word63.hatuon = @"dɪskrɪ́pʃ(ə)n";
        word63.reibun = @"He gave a description of what he had seen.";
        
        TestWord *word64 = [TestWord new];
        word64.name = @"direct";
        word64.detail =  @"形容詞more ～; most ～/\n直接の結果、関係, じかの, じゃまするものがない; すぐさまの\nI' m in ___ contact with the hijackers.\nハイジャック犯と直接接触している。\n\n直行の, まっすぐな\n\nまったくの; 正確な, そのものずばりの\n\n率直な, 単刀直入の, 端的な, ざっくばらんな\n\n直系の\n\n直射の\n\n動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n感情、言葉、物を向ける; 努力、関心を向ける, 注ぐ\n\nを管理する; を指導する\n\n道を教える \n\n~するよう指図する\n\n~を監督する\n\n副詞\nまっすぐに\n\n直接に";
        word64.hatuon = @"dərékt|daɪ-";
        word64.reibun = @"I' m in direct contact with the hijackers.";
        
        TestWord *word65 = [TestWord new];
        word65.name = @"exam";
        word65.detail =  @"名詞 複～s/-z/\n試験, テスト\nHe repeatedly fails to pass the ___.\n彼は何度も試験に落ちた。";
        word65.hatuon = @"ɪɡzǽm";
        word65.reibun = @"He repeatedly fails to pass the exam.";
        
        TestWord *word66 = [TestWord new];
        word66.name = @"example";
        word66.detail =  @"名詞 複～s/-z/\n例, 実例\n\n模範, 手本; 見本\nHer diligence has set an ___ to the others.\n彼の勤勉さは他の人の手本となった。\n\n見せしめ, 戒め";
        word66.hatuon = @"ɪɡzǽmp(ə)l|-zɑ́ːm-";
        word66.reibun = @"Her diligence has set an example to the others.";
        
        TestWord *word67 = [TestWord new];
        word67.name = @"limit";
        word67.detail =  @"名詞 複～s/-ts/\n限度, 上[下]限, 制限\nHer ambition knows no ___.\n彼の野望は際限がない。\n\n限界\n\n境界, 端\n\n動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n~を制限する, 抑える;~を制約する ; ~に限定する, 束縛する\n\n~に限られている, 限定されている";
        word67.hatuon = @"lɪ́mət";
        word67.reibun = @"Her ambition knows no limit.";
        
        TestWord *word68 = [TestWord new];
        word68.name = @"local";
        word68.detail =  @"形容詞\n地元の; その地方の; 当地の; 地域の\nI suggest that he put an advertisement in the ___ paper.\n彼に地元紙に広告を載せるよう提案した。\n\n各駅停車の\n\n局地的な; 考え方が狭い, 偏狭な\n\n地元の住民";
        word68.hatuon = @"lóʊk(ə)l";
        word68.reibun = @"I suggest that he put an advertisement in the local paper.";
        
        TestWord *word69 = [TestWord new];
        word69.name = @"magical";
        word69.detail =  @"形容詞more ～; most ～\n魅惑的な, 人を魅了する\n\n魔法の; 不思議な\nThis stone seems to have ___ powers.\nこの石はどうやら不思議な力を持っているようだ。";
        word69.hatuon = @"mǽdʒɪk(ə)l";
        word69.reibun = @"This stone seems to have magical powers.";
        
        TestWord *word70 = [TestWord new];
        word70.name = @"mail";
        word70.detail =  @"名詞 複～s/-z/\n郵便\n\n郵便物, 手紙類\nIs there another ___ in the afternoon?\n午後は他の郵便物がありましたか？\n\n電子メール\n\n動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\nを郵送する, 投函する\n\n~に送る\n\n電子メールで送る";
        word70.hatuon = @"meɪl";
        word70.reibun = @"Is there another mail in the afternoon?";
        
        TestWord *word71 = [TestWord new];
        word71.name = @"novel";
        word71.detail =  @"名詞 複～s/-z/\n小説";
        word71.hatuon = @"nɑ́v(ə)l|nɔ́v-";
        word71.reibun = @"";
        
        TestWord *word72 = [TestWord new];
        word72.name = @"outline";
        word72.detail =  @"名詞 複～s/-z/\n概略, 概要, あらまし, 要旨;骨子, 要点\nHe wrote down the ___ of his lecture.\n彼は彼の講演の要点を書き記した。\n\n輪郭, 外郭, アウトライン; 略図; 線描\n\n動詞～s/-z/; ～d/-d/; -lining\n他動詞\n要点を述べる, 概略を言う\n\n~に輪郭を付ける; ~の外形を引き立たせる; ~の略図を描く";
        word72.hatuon = @"áʊtlàɪn";
        word72.reibun = @"He wrote down the outline of his lecture.";
        
        TestWord *word73 = [TestWord new];
        word73.name = @"poet";
        word73.detail =  @"名詞 複～s/-ts/\n詩人, 歌人; 詩的着想のある人";
        word73.hatuon = @"póʊət";
        word73.reibun = @"";
        
        TestWord *word74 = [TestWord new];
        word74.name = @"print";
        word74.detail =  @"動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n~を印刷する; ~に印刷する\n\n出版する; 記事、写真を載せる\nHis second book is already in ___.\n彼の2冊目の本は既に出版されている。\n\n文字、画像を出力する, プリントアウトする\n\n写真をプリントする\n\n活字体で書く\n\nプリントする\n\n印を押す, ~の跡を付ける, ~を押しつける; 心に記憶を焼き付ける\n\n自動詞\n印刷する, 印刷業をする.\n\n~が出力する; 写真が焼き付けされる\n\n名詞 複～s/-ts/\n印刷; 印刷ぐあい; 字体; 印刷体; 印刷面\n\n印刷物, 出版物\n\n跡, 痕跡, 印; 指紋, 足跡; 名残, 影響\n\n印刷された模様\n\n版画; 印画; 映画、絵画の複製";
        word74.hatuon = @"prɪnt";
        word74.reibun = @"His second book is already in print.";
        
        TestWord *word75 = [TestWord new];
        word75.name = @"scene";
        word75.detail =  @"名詞 複～s/-z/\n演劇、オペラの場\n\n場面, シーン; 舞台, 背景\n\n景色, 光景, 眺め\nThe terrible ___ was engraved on his memory.\nその恐ろしい光景は彼の記憶に刻まれた。\n\n現場, 現地\n\n業界, 分野\n\n口論, 口げんか; 大騒ぎ\n\n状況; 出来事\n\n好み, 関心";
        word75.hatuon = @"siːn";
        word75.reibun = @"The terrible scene was engraved on his memory.";
        
        TestWord *word76 = [TestWord new];
        word76.name = @"sheet";
        word76.detail =  @"名詞 複～s/-ts/\nシーツ, 敷布\nWe change the ___ every week.\n私達は毎週シーツを取り替える。\n\n1枚のA紙、ガラス、金属板\n\n情報の記載された印刷物\n\n1枚の紙\n\n一面の氷、水";
        word76.hatuon = @"ʃiːt";
        word76.reibun = @"We change the sheet every week.";
        
        TestWord *word77 = [TestWord new];
        word77.name = @"silly";
        word77.detail =  @"形容詞-lier; -liest\n愚かな, ばかな, 賢明さのない\n\n子供じみた, まぬけな, ふざけた\nI look pretty ___ in this dress.\n私がこのドレスを着た姿はとても可笑しい。\n\n真剣に受け取れない, 現実味にかける, ばかげた\n\n気絶して, 気が遠くなって, 目を回して";
        word77.hatuon = @"sɪ́li";
        word77.reibun = @"I look pretty silly in this dress.";
        
        TestWord *word78 = [TestWord new];
        word78.name = @"store";
        word78.detail =  @"名詞 複～s/-z/\n店, 商店\n\n大型店, 百貨店\n\n大切にしまっておく物, とっておき; 蓄え, 備え\nHe always keeps several cases of wine in ___.\n彼はいつも複数のケースのワインをとっておく。\n\n倉庫\n\n動詞～s/-z/; ～d/-d/; storing/stɔ́ːrɪŋ/\n他動詞\n物を蓄える, とっておく, しまっておく, 貯蔵する\n\n悩み事を引き起こす, 招く";
        word78.hatuon = @"stɔːr";
        word78.reibun = @"He always keeps several cases of wine in store.";
        
        TestWord *word79 = [TestWord new];
        word79.name = @"suffer";
        word79.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing/sʌ́f(ə)rɪŋ/\n自動詞\n~を患う\n\n悩む, 苦しむ\n\n害を被る, 損害を受ける ;見劣りする, 質的に劣る\n\n罰を受ける\n\n耐えて頑張る, 負けずにやり遂げる\n\n他動詞\n苦痛を経験する, 受ける\n\n~に直面する; 損害を受ける, 被る\nThey ___ed huge losses in the financial crisis.\n彼らは経済危機で巨額な損失を被った。";
        word79.hatuon = @"sʌ́fər";
        word79.reibun = @"They suffered huge losses in the financial crisis.";
        
        TestWord *word80 = [TestWord new];
        word80.name = @"technology";
        word80.detail =  @"名詞 複-gies/-z/\n科学技術, テクノロジー; 工学, 応用科学; 技術的方法";
        word80.hatuon = @"teknɑ́lədʒi|-nɔ́l-";
        word80.reibun = @"";
        
		words = [NSMutableArray arrayWithObjects:
                 word61,
                 word62, word63, word64, word65, word66, word67, word68, word69, word70, word71, word72, word73,
                 word74, word75, word76, word77, word78, word79, word80, nil];
    }
    
    if ( [wordNo isEqualToString:@"15"]){
        TestWord *word81 = [TestWord new];
        word81.name = @"across";
        word81.detail =  @"前置詞\nを横切って, ~を渡って; 境界線を越えて\nCan you swim ___ the river?\nその川を泳いで渡れますか？\n\n平面、空間に またがって, ~にかかって; ~を交差して\n\nの向こう側に, ~を越えた所に\n\nの至る所に; 顔 の一面に\n\n社会的、政治的境界を越えて, 超越して\n\n副詞\n横切って, 渡って; 交差して; 横切って向こう側に\n\n向かって \n\n幅[直径]が~で\n\n~を見つけて\n\n考えが伝わって; 浮かんで";
        word81.hatuon = @"əkrɔ́ːs|əkrɔ́s";
        word81.reibun = @"Can you swim across the river?";
        
        TestWord *word82 = [TestWord new];
        word82.name = @"breathe";
        word82.detail =  @"動詞～s/-z/; ～d/-d/; ___ing\n自動詞\n息をする, 呼吸する;息を吹きかける\nFish cannot ___ out of water.\n魚は水から出ると息が出来ない。\n\n息をつく, 休む\n\n他動詞\n\n呼吸する;を吸い込む; 吐き出す;においを吐きかける";
        word82.hatuon = @"briːð";
        word82.reibun = @"Fish cannot breathe out of water.";
        
        TestWord *word83 = [TestWord new];
        word83.name = @"characteristic";
        word83.detail =  @"名詞 複～s/-s/\n特徴, 特色, 特質\nKindness is one of his ___s.\n親切心は彼の特徴の一つだ。\n\n形容詞more ～; most ～\n\n特徴を示す; 特有の, 独特の ; ~するのは~の特徴である";
        word83.hatuon = @"kæ̀rəktərɪ́stɪk";
        word83.reibun = @"Kindness is one of his characteristics.";
        
        TestWord *word84 = [TestWord new];
        word84.name = @"consume";
        word84.detail =  @"動詞～s/-z/; ～d/-d/; -suming\n他動詞\nを消費する, 消耗する, 使い果たす; ~を浪費する\nHis old car ___d much gasoline.\n彼の旧型の自動車はガソリンを多く消費する。\n\n~を食する, 飲む, 食べ[飲み]尽くす\n\n感情にかられる, 圧倒される";
        word84.hatuon = @"kənsjúːm";
        word84.reibun = @"His old car consumed much gasoline.";
        
        TestWord *word85 = [TestWord new];
        word85.name = @"excite";
        word85.detail =  @"動詞～s/-ts/; ～d/-ɪd/; ___ing\n他動詞\n興奮させる, わくわくさせる\nThe good news ___d everybody.\nその良い知らせに皆興奮した。\n\n感情をかき立てる, 呼び起こす, そそる ; うわさをあおる; 暴動を引き起こす\n\nを刺激する, 怒らせる;を駆り立てる";
        word85.hatuon = @"ɪksáɪt, ek-";
        word85.reibun = @"The good news excited everybody.";
        
        TestWord *word86 = [TestWord new];
        word86.name = @"extreme";
        word86.detail =  @"形容詞more ～; most ～\n極度の, 非常な; 最大の\n\n過激な, 激しい\n\nいちばん端の, 末端の\nThe capital is in the ___ south of the country.\n首都はその国の最南端にある。\n\n名詞 複～s/-z/\n極端, 極度\n\nかけ離れたもの; 極端な状態[行動]";
        word86.hatuon = @"ɪkstríːm, eks-";
        word86.reibun = @"The capital is in the extreme south of the country.";
        
        TestWord *word87 = [TestWord new];
        word87.name = @"fear";
        word87.detail =  @"名詞 複～s/-z/\n恐れ, 恐怖(感)\nThe thought of returning filled him with ___.\n戻る事を考えると彼は恐怖に包まれた。\n\n不安, 懸念; 心配\n\n恐れ, 可能性\n\n動詞～s/-z/; ～ed/-d/; ～ing/fɪ́ərɪŋ/\n\n他動詞\n~がこわい, 恐ろしい\n\n~するのをためらう\n\n~を心配する, 不安になる\n\n~なのではと案じる\n\n残念ながら~ではないかと思う\n\n自動詞\n心配する, 気遣う; 生命、安否を案じる, 危惧する";
        word87.hatuon = @"fɪər";
        word87.reibun = @"The thought of returning filled him with fear.";
        
        TestWord *word88 = [TestWord new];
        word88.name = @"fortunate";
        word88.detail =  @"形容詞more ～; most ～\n幸運な, 幸福な, 運に恵まれた ; 幸いなことに~である\nIt is ___ that the tanker did not leak.\n幸いな事にタンカーから漏れていなかった。\n\n幸運をもたらす, さい先のよい, 縁起のよい";
        word88.hatuon = @"fɔ́ːrtʃ(ə)nət";
        word88.reibun = @"It is fortunate that the tanker did not leak.";
        
        TestWord *word89 = [TestWord new];
        word89.name = @"happen";
        word89.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n自動詞\n偶然起こる\nThe accident ___ed at six o'clock.\nその事故は６時に起きた。\n\n結果として起こる, 生じる\n\nよくない事が起こる, ふりかかる\n\n偶然~する; たまたま~である";
        word89.hatuon = @"hǽp(ə)n";
        word89.reibun = @"The accident happened at six o'clock.";
        
        TestWord *word90 = [TestWord new];
        word90.name = @"length";
        word90.detail =  @"名詞 複～s/-s/\n長さ, 丈; 縦\n\n時間の長さ, 期間\nThe ___ of your talk must be at least 10 minutes.\nあなたの演説時間は少なくとも10分はなければならない。\n\n長さ, 全体の分量; 上演時間\n\n全長, 端から端まで\n\n~の長さの\n\n長さ, 端から端までの距離\n\n細長いものの1本";
        word90.hatuon = @"leŋ(k)θ";
        word90.reibun = @"The length of your talk must be at least 10 minutes.";
        
        TestWord *word91 = [TestWord new];
        word91.name = @"mistake";
        word91.detail =  @"名詞 複～s/-s/\n誤り, 間違い; 誤解, 失策; 愚行\nHis costly ___ resulted in severe loss.\n彼の重大なミスは大きな損失となった。\n\n言葉、数字の間違い, 誤り\n\n動詞～s/-s/; -took/-tʊ́k/; ～n/-téɪk(ə)n/; -taking\n他動詞\n~と誤解する, 間違える, 取り違える; ~かを誤解する\n\n~と間違える";
        word91.hatuon = @"mɪstéɪk";
        word91.reibun = @"His costly mistake resulted in severe loss.";
        
        TestWord *word92 = [TestWord new];
        word92.name = @"observe";
        word92.detail =  @"動詞～s/-z/; ～d/-d/; ___ing\n他動詞\n~に気付く, ~が見てわかる ;~しているのを目撃する, のに気付く\n\n~であることに気付く\n\n観察する, 観測する, 見守る, 監視する\nHe made a telescope through which he could ___ the stars.\n彼は星を観察出来る望遠鏡を作った。\n\n法律、契約、習慣を守る\n\n気付いたことを述べる, 陳述する";
        word92.hatuon = @"əbzə́ːrv";
        word92.reibun = @"He made a telescope through which he could observe the stars.";
        
        TestWord *word93 = [TestWord new];
        word93.name = @"opportunity";
        word93.detail =  @"名詞 複-ties/-z/\n 機会, チャンス\nYou must grasp this ___.\nあなたはこのチャンスをものにしなければならない。\n\n就職[出世]の機会[見込み]";
        word93.hatuon = @"ɑ̀pərtjúːnəti|ɔ̀p-";
        word93.reibun = @"You must grasp this opportunity.";
        
        TestWord *word94 = [TestWord new];
        word94.name = @"prize";
        word94.detail =  @"名詞 複～s/-ɪz/\n 賞, ほうび, 賞品, 景品, 賞金\nThe boys competed with each other for the ___.\nその男の子達は賞品を目当てにお互い競い合った。\n\n貴重[すてき]なもの; 努力するに値する物[人], 申し分のない人\n\n形容詞\n懸賞の, 賞として与えられる; 入賞の; 見事な; 模範的な; うってつけの\n\n動詞\n他動詞\n~が高く評価される, 重んじられる";
        word94.hatuon = @"praɪz";
        word94.reibun = @"The boys competed with each other for the prize.";
        
        TestWord *word95 = [TestWord new];
        word95.name = @"race";
        word95.detail =  @"名詞 複～s/-ɪz/\n競走, レース\nEvery morning he spent two hours training for the ___.\n彼はそのレースの為に毎朝2時間トレーニングした。\n\n競争, 戦い\n\n競馬, ドッグレース; 競馬場\n\n動詞～s/-ɪz/; ～d/-t/; racing\n\n自動詞\n競走する; 競争する\n\n急いで行く, 疾走する; ~が駆けめぐる; ~に急速に向かう\n\n~が速まる; ~が活発に働く\n\n他動詞\n~と競走する\n\n競走させる, 出走させる\n\n~を急いで運ぶ; ~を全速力で走らせる; 議案を急いで通過させる\n\n名詞 複～s/-ɪz/\n人種; 人種の\n\n民族, 種族;民族の\n\n類, 種族";
        word95.hatuon = @"reɪs";
        word95.reibun = @"Every morning he spent two hours training for the race.";
        
        TestWord *word96 = [TestWord new];
        word96.name = @"realize";
        word96.detail =  @"動詞～s/-ɪz/; ～d/-d/; -izing\n他動詞\nを認識する, 悟る; 知る; ~だと気づく\n\nを実現する, 達成する\nMy wishes have been ___d.\n私の願いが叶った。\n\n恐れていたことが起こる, 現実となる\n\n資産を売って現金にする; 利益を得る\n\n金額で売れる; 利益をもたらす";
        word96.hatuon = @"ríːəlàɪz|rɪ́əl-";
        word96.reibun = @"My wishes have been realized.";
        
        TestWord *word97 = [TestWord new];
        word97.name = @"respond";
        word97.detail =  @"動詞～s/-dz/; ～ed/-ɪd/; ～ing\n反応する, 応じる, 報いる\nHe tried to be amusing, but I didn't ___.\n彼は笑わせようとしたが、それに応えなかった。\n\n答える, 応答する\n\nよい反応を示す";
        word97.hatuon = @"rɪspɑ́nd|-spɔ́nd";
        word97.reibun = @"He tried to be amusing, but I didn't respond.";
        
        TestWord *word98 = [TestWord new];
        word98.name = @"risk";
        word98.detail =  @"名詞 複～s/-s/\n恐れ, 危険, リスク\nHe saved my life at the ___ of his own.\n彼は自分の危険を顧みずに私の命を救った。\n\n危険因子, 有害なもの\n\n被保険者[物]\n\n動詞\n他動詞\nを危険にさらす;を賭ける \n\nの危機に陥る; ~する恐れがある\n\n~をあえてする, 試みる; あえて~する";
        word98.hatuon = @"rɪsk";
        word98.reibun = @"He saved my life at the risk of his own.";
        
        TestWord *word99 = [TestWord new];
        word99.name = @"wonder";
        word99.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing/-d(ə)rɪŋ/\n他動詞\n~かしらと思う\n\n~していただけないものかと思う、~されないかと思う、~ではないかと思う\n\n~とは不思議だ[おかしい]と思う, ~ということに驚く\nDo you seriously ___ that she didn't help him?\n彼女が彼を助けなかった事を不思議に思いましたか？\n\n自動詞\n~について不思議に思う, 驚く\n\n~についておかしいと思う, 怪しむ, ~について安否が気になる\n\n~してはどうかと考える\n\n名詞 複～s/-z/\n驚き, 驚嘆, 驚異\n\n驚くべき[不思議な]~\n\n天才, 達人\n\n形容詞\n驚異的な, すばらしい; 効果のある";
        word99.hatuon = @"wʌ́ndər";
        word99.reibun = @"Do you seriously wonder that she didn't help him?";
        
        TestWord *word100 = [TestWord new];
        word100.name = @"yet";
        word100.detail =  @"副詞\nまだ, 今は[その時には]まだ\nHe hasn't done much ___.\n彼が終わらせたのはまだ多くない。\n\n今すぐには; まだしばらくは; あと~の間は\n\nまだ, 今でも, 引き続き今も; まだこれから\n\nまだ~していない\n\nさらに, その上\n\nなおいっそう, さらに \n\nこれまでで, 今までのところ \n\n今に, そのうちに, いつか\n\n接続詞\nけれども, それにもかかわらず, でもやはり";
        word100.hatuon = @"jet";
        word100.reibun = @"He hasn't done much yet.";
        
		words = [NSMutableArray arrayWithObjects:
                 word81, word82, word83, word84, word85,
                 word86, word87, word88, word89, word90, word91, word92, word93, word94, word95, word96, word97,
                 word98, word99, word100, nil];
    }
    
    if ([wordNo isEqualToString:@"16"]) {
        
        TestWord *word1 = [TestWord new];
        word1.name = @"academy";
        word1.detail = @"名詞 複-mies/-z/\n協会, 学士院, アカデミー\nHe is a student in an ___ of music.\n彼は音楽学院の学生だ。\n\n私立の中学校, 高等学校";
        word1.hatuon = @"əkǽdəmi";
        word1.reibun = @"He is a student in an academy of music.";
        
        TestWord *word2 = [TestWord new];
        word2.name = @"ancient";
        word2.detail = @"形容詞more ～; most ～\n古代の, 昔の\nThis stone axe is a relic of ___ times.\nこの石斧は古代の遺物だ。\n\n古い, 昔からの, 長い間続いてきた";
        word2.hatuon = @"éɪnʃ(ə)nt";
        word2.reibun = @"This stone axe is a relic of ancient times.";
        
        TestWord *word3 = [TestWord new];
        word3.name = @"board";
        word3.detail = @"名詞 複～s/-dz/\n板; 台; 盤; 黒板; 掲示板\n\n会議, 委員会; 官庁の部, 局;委員会の構成員, 役員\n\n板材, 板\n\n食事, 賄い; 食費\n\nボール紙, 厚紙\n\n劇場, 舞台\n\n動詞\n他動詞\n~に乗り込む, 搭乗する\nPassengers must ___ the ship by 6 p.m.\n乗客は午後6時までに乗船しなければならない。\n\n~に板を張る, ~を閉鎖する; ~を板で覆う\n\n自動詞\n~が搭乗中である";
        word3.hatuon = @"bɔːrd";
        word3.reibun = @"Passengers must board the ship by 6 p.m.";
        
        TestWord *word4 = [TestWord new];
        word4.name = @"century";
        word4.detail = @"名詞 複-ries/-z/\n~世紀\n\n100年間\nMany ___ies have passed since that time.\nその時から何百年もの月日が経った。";
        word4.hatuon = @"sén(t)ʃ(ə)ri";
        word4.reibun = @"Many centuries have passed since that time.";
        
        TestWord *word5 = [TestWord new];
        word5.name = @"clue";
        word5.detail = @"名詞 複～s/-z/\n手がかり, 糸口, きっかけ\nThere is no ___ to the identity of the thief.\n窃盗犯を特定する手がかりがない。\n\n解釈, 説明\n\n動詞\n他動詞\nに糸口[手がかり]を与える";
        word5.hatuon = @"kluː";
        word5.reibun = @"There is no clue to the identity of the thief.";
        
        TestWord *word6 = [TestWord new];
        word6.name = @"concert";
        word6.detail =  @"名詞 複～s/-ts/\nコンサート, 音楽会, 演奏会;コンサートの\nThe ___ will be given on Saturday.\nそのコンサートは土曜日に行われる。";
        word6.hatuon = @"kɑ́nsərt|kɔ́n-";
        word6.reibun = @"The concert will be given on Saturday.";
        
        TestWord *word7 = [TestWord new];
        word7.name = @"county";
        word7.detail = @"名詞 複-ties/-z/\n郡\n\n州\nThe soil in that ___ is very poor.\nその州の土壌はとてもやせている。\n\n郡の;州の\n\n郡民, 州民";
        word7.hatuon = @"káʊnti";
        word7.reibun =  @"The soil in that county is very poor.";
        
        TestWord *word8 = [TestWord new];
        word8.name = @"dictionary";
        word8.detail = @"名詞 複-ies/-z/\n辞書, 辞典, 字引\nHe is, as it were, a walking ___.\n彼はいわば生き字引だ。\n\n事典, 特殊辞典";
        word8.hatuon = @"dɪ́kʃənèri|-ʃ(ə)n(ə)ri";
        word8.reibun = @"He is, as it were, a walking dictionary.";
        
        TestWord *word9 = [TestWord new];
        word9.name = @"exist";
        word9.detail = @"動詞～s/-ts/; ～ed/-ɪd/; ～ing\n自動詞\n存在する, 実在する\n\n特定の状況に存在する, ある, いる\n\n生存する, 生きる; 生きながらえる, 暮らしていく\nMan cannot ___ without air.\n人は空気なしで生きられない。\n\n~が存続する";
        word9.hatuon = @"ɪɡzɪ́st";
        word9.reibun = @"Man cannot exist without air.";
        
        TestWord *word10 = [TestWord new];
        word10.name = @"flat";
        word10.detail = @"形容詞～ter; ～test\n平らな, 平坦な, 起伏のない\n\n平べったい, かかとの低い靴, 厚み[高さ]のない物; 浅い容器\n\nぴったりと身を付けて; ぴったり接して\n\n空気の抜けた, パンクした\nOur car had a ___ tire.\n私達の車のタイヤが一つパンクした。\n\n炭酸飲料が気の抜けた\n\n変化[活気]がない; おもしろくない, 退屈な\n\n単調な, 深みがない; 光沢がない\n\n固定[均一]の料金、価格\n\n副詞\n平らに; ばったりと\n\nきっかり\n\nまったく; きっぱり\n\n名詞\nパンクしたタイヤ\n\n湿地, 沼地, 浅瀬; 平地, 低地\n\n平面, 平たい面\n\n名詞 複～s/-ts/\n\nアパート, マンション, フラット";
        word10.hatuon = @"flæt";
        word10.reibun = @"Our car had a flat tire.";
        
        TestWord *word11 = [TestWord new];
        word11.name = @"gentleman";
        word11.detail =  @"名詞 複-men/-mən/\n紳士\n\n丁寧に男の方, 殿方; 男の人\n\nみなさん\n\n男子トイレ\n\n男性議員";
        word11.hatuon = @"dʒént(ə)lmən";
        word11.reibun = @"";
        
        TestWord *word12 = [TestWord new];
        word12.name = @"hidden";
        word12.detail =  @"形容詞\n隠された, 見つけにくい\nYou must be alert to the ___ danger.\n隠された危険に注意を怠るな。\n\n事実、感情が神秘な, あいまいな, 秘められた, ひそかな";
        word12.hatuon = @"hɪ́d(ə)n";
        word12.reibun = @"You must be alert to the hidden danger.";
        
        TestWord *word13 = [TestWord new];
        word13.name = @"maybe";
        word13.detail =  @"副詞\nもしかすると, ことによると; たぶん, おそらく\n___ it will work.\nこの方法は有効かもしれない。\n\nだいたい~くらい\n\nたぶんね, そうかもしれないね; そうですねえ\n\n~したらどうでしょう\n\n依頼、援助の申し出をしてできれば\n\nなるほど~だが\n\n時には, 場合によっては";
        word13.hatuon = @"méɪbi, -biː";
        word13.reibun = @"Maybe it will work.";
        
        TestWord *word14 = [TestWord new];
        word14.name = @"officer";
        word14.detail =  @"名詞 複～s/-z/\n将校, 士官\n\n公務員, 役人; 役員, 幹部\nThat ___ must be removed.\nその役人は免職されるべきだ。\n\n警官, 巡査、お巡りさん\n\n高級船員, 船長";
        word14.hatuon = @"ɔ́ːfəsər|ɔ́fɪ-";
        word14.reibun = @"That officer must be removed.";
        
        TestWord *word15 = [TestWord new];
        word15.name = @"original";
        word15.detail =  @"形容詞\n最初の, 本来の, 原始の\nI prefer your ___ plan to these.\nこれらの計画よりあなたの最初の計画が良いと思う。\n\nもとの, 原文の, 原語の, 原型の, 実物の\n\n新作の, 初公開の, 初演の\n\n名詞 複～s/-z/\n原物, 本物, 実物, オリジナル, 原文, 原画\n\n原語";
        word15.hatuon = @"ərɪ́dʒ(ə)n(ə)l";
        word15.reibun = @"I prefer your original plan to these.";
        
        TestWord *word16 = [TestWord new];
        word16.name = @"pound";
        word16.detail =  @"名詞 複～s/-dz/\nポンド\n\n1ポンド貨幣\n\n動詞～s/-dz/; ～ed/-ɪd/; ～ing\n\n他動詞\n~を強くたたく, どんどんと打つ\nHe ___ed the table angrily.\n彼は怒って机を強く叩いた。\n\n~をつき砕く; ~をすりつぶす; ~をペースト状にする\n\n自動詞\n 繰り返し強く打つ, どんどんとたたく\n\nどたどた歩く[走る] \n\n心臓がどきんどきん打つ; 太鼓がどんどんと音を立てる";
        word16.hatuon = @"paʊnd";
        word16.reibun = @"He pounded the table angrily.";
        
        TestWord *word17 = [TestWord new];
        word17.name = @"process";
        word17.detail =  @"名詞 複～es/-ɪz/\n過程, 事の進行, 時の経過\n\n化学的作用\n\n方法, 手順, 工程, 製法\nBuilding a car is a long ___.\n自動車1台の製造は幾多の工程がある。\n\n動詞\n他動詞\n加工処理する, 加工貯蔵する, 処理する\n\n文書、情報、取引を処理する, 手続きをする; 処置する\n\n形容詞\n加工処理された食品";
        word17.hatuon = @"prɑ́ses, -səs|prə́ʊses";
        word17.reibun = @"Building a car is a long process.";
        
        TestWord *word18 = [TestWord new];
        word18.name = @"publish";
        word18.detail =  @"動詞～es/-ɪz/; ～ed/-t/; ～ing\n他動詞\n~を出版する; ~を刊行する\nHer book was ___ed last year.\n彼女の本は去年出版された。\n\n~を掲載する\n\n文書で発表される, 公開される\n\n~ということを公表する";
        word18.hatuon = @"pʌ́blɪʃ";
        word18.reibun = @"Her book was published last year.";
        
        TestWord *word19 = [TestWord new];
        word19.name = @"theater";
        word19.detail =  @"名詞 複～s/-z/\n劇場\nThe ___ was packed with children.\nその劇場は子供でいっぱいだった。\n\n映画館\n\n演劇, 劇; 演劇作品\n\n劇の上演[出来映え], 上演効果; 演劇の執筆[製作]; 演劇界;劇場の観客\n\n戦場, 戦域; 事件の現場, 舞台";
        word19.hatuon = @"θíːətər|θɪ́ətə";
        word19.reibun = @"The theater was packed with children.";
        
        TestWord *word20 = [TestWord new];
        word20.name = @"wealth";
        word20.detail =  @"名詞\n富, 財産, 資産; 富裕, 裕福\nHe has gambled away all his ___.\n彼は賭博で全財産を失った。\n\n豊富な~, 多量[多数]の~\n\n豊富[貴重]な産物, 資源";
        word20.hatuon = @"welθ";
        word20.reibun = @"He has gambled away all his wealth.";
        
        
        words = [NSMutableArray arrayWithObjects:
                 word1, word2, word3, word4, word5, word6, word7, word8, word9, word10, word11, word12, word13,
                 word14, word15, word16, word17, word18, word19, word20, nil];
    }
    
    if ( [wordNo isEqualToString:@"17"]){
        TestWord *word21 = [TestWord new];
        word21.name = @"appreciate";
        word21.detail =  @"動詞～s/-ts/; ～d/-ɪd/; -ating\n他動詞\n~を正しく理解する; ~であることを正しく理解する\n\n~に感謝する, ~をありがたく思う; ~することをありがたく思う\nI deeply ___ your concern.\nあなたの心遣いに深く感謝します。\n\n~のよさを認める;評価する\n\n~を鑑賞する; 食べ物を味わう, 楽しむ";
        word21.hatuon = @"əpríːʃièɪt";
        word21.reibun = @"I deeply appreciate your concern.";
        
        TestWord *word22 = [TestWord new];
        word22.name = @"available";
        word22.detail =  @"形容詞\n利用可能な, 役立つ; 入手可能な, 求める[得る]ことができる\nDo you have a room ___?\n空き部屋はありますか？\n\n手がすいて話す[会う]ことができる, 体があいて\n\n交際相手のいない, 恋人募集中の; 口説きやすい";
        word22.hatuon = @"əvéɪləb(ə)l";
        word22.reibun = @"Do you have a room available?";
        
        TestWord *word23 = [TestWord new];
        word23.name = @"beat";
        word23.detail =  @"動詞～s/-ts/; ～; ～en/bíːt(ə)n/, ～; ～ing \n他動詞\n~を打つ, たたく, 連打する\n\n~に激しく当たる, たたきつけるように~\n\n~をたたく\n\n~をなぐりつける, 殴打する, なぐって~にする\n\n懲罰として~を~でぶつ, せっかんする; ぶって~にする\n\n~を強く混ぜる, 泡立てる\n\n~を踏み固める\n\n~をたたいて薄くする, 打延して~にする\n\n~をたたき出す\n\n相手を打ち破る; ~に打ち勝つ; ~に勝利する; ~を解決する; ~を上回る\nIf we don't prepare for the speech contest, they will ___ us.\n弁論大会の準備をしなければ、私達は彼らに負ける。\n\n~にまさる, ~より優れる, ~をしのぐ\n\n~を圧倒する, 困らせる, うんざりさせる\n\n自動詞\n打つ, たたく\n\n殴打する\n\n風、雨、波が激しく当たる, たたきつけるように~\n\n心臓、脈が打つ, 鼓動する\n\n泡立てるように混ぜる; ~が泡立てられる\n\n名詞 複～s/-ts/\n連打すること; 連打の音, 時計の音; 作動音\n\n心臓の鼓動; 脈拍\n\n拍子, リズム, ビート; 強拍音\n\n巡回地区, 持ち場; 取材場所, 持ち場\n\n形容詞\nへとへとに疲れ切って";
        word23.hatuon = @"biːt";
        word23.reibun = @"If we don't prepare for the speech contest, they will beat us.";
        
        TestWord *word24 = [TestWord new];
        word24.name = @"bright";
        word24.detail =  @"形容詞～er; ～est\n輝いている; 光っている; うららかな; 明るい\n\n頭のいい, 利口\n\n気の利いた, うまく行きそうな\n\n鮮やかな, 鮮明な, 目立つ\nYou look better in ___ colors like orange and red.\n橙色や赤色のような鮮色の服が似合う。\n\n快活な, はつらつとした; ~が生き生きとした, 輝いた ; 声が明瞭な\n\n~が輝かしい, 明るい, 有望な\n\n副詞\n明るく, こうこうと輝く";
        word24.hatuon = @"braɪt";
        word24.reibun = @"You look better in bright colors like orange and red.";
        
        TestWord *word25 = [TestWord new];
        word25.name = @"celebrate";
        word25.detail =  @"動詞～s/-ts/; ～d/-ɪd/; -brating\n他動詞\nを祝う, 祝賀する\nPeople in the city held a great party to ___ their victory.\nその都市の市民は盛大なパーティーで勝利を祝った。\n\n儀式、祭典を行う, 挙行する\n\nを世に知らせる, 称賛[賛美]する";
        word25.hatuon = @"séləbrèɪt";
        word25.reibun = @"People in the city held a great party to celebrate their victory.";
        
        TestWord *word26 = [TestWord new];
        word26.name = @"determine";
        word26.detail =  @"動詞～s/-z/; ～d/-d/; -mining\n他動詞\n~を特定する, 確定する; ~を測定する\n\n~ということを突き止める, 確認する\n\n~を決定する; ~を解決する\n\n~ということを決定する\nI must now ___ whether to meet him or not.\n彼と会うかどうか今決めなければならない。\n\n~を左右する, 決定する\n\n~かどうかに影響を与える\n\n~しようと決心する; ~ということを決意する\n\n自動詞\n決心する ; 決定[特定]する";
        word26.hatuon = @"dɪtə́ːrmɪn";
        word26.reibun = @"I must now determine whether to meet him or not.";
        
        TestWord *word27 = [TestWord new];
        word27.name = @"disappear";
        word27.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n自動詞\n見えなくなる, 視界から消える\nThe sun ___ed behind a cloud.\n太陽は雲の後方に消えた。\n\n消失する, 見当たらなくなる; 姿を消す, 失踪する; 消滅する, 存在しなくなる";
        word27.hatuon = @"dɪ̀səpɪ́ər";
        word27.reibun = @"The sun disappeared behind a cloud.";
        
        TestWord *word28 = [TestWord new];
        word28.name = @"else";
        word28.detail =  @"副詞\nそのほかの, 別の[に], それ以外の\nWould you like anything ___ to drink?\n何かお飲みになりますか？\n\n追加を示してそのほかに, さらに, その上";
        word28.hatuon = @"els";
        word28.reibun = @"Would you like anything else to drink?";
        
        TestWord *word29 = [TestWord new];
        word29.name = @"fair";
        word29.detail =  @"形容詞～er/ferer|feərə/; ～est/ferəst|feərɪst/\n~が妥当な, 正しい; ~が適正な\n\n~が公正な, 公平な, ~が差別をしない\nHe won the game ___ and square.\nその試合の彼の勝利は公平無私だ。\n\n規則に従った\n\nかなりの, 相当の\n\nまずまずの, 平均的な; 成績が可の\n\n副詞～er; ～est\n公正に, フェアに\n\n名詞 複～s/-z/\n品評会, 共進会";
        word29.hatuon = @"feər";
        word29.reibun = @"He won the game fair and square.";
        
        TestWord *word30 = [TestWord new];
        word30.name = @"flow";
        word30.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n自動詞\n~が一定の量で絶え間なく流れる; ~が循環する\nA free ___ of water came from the pipe.\nパイプから水が渾渾と流れ出た。\n\n~が絶え間なく動く, ぞろぞろ通る; ~が行き来する, 流れる\n\nアルコールがたくさんふるまわれる\n\n言葉、アイデアがなめらかに出る\n\n名詞 複～s/-z/\n~の流れ; 流出[流入]量\n\n~の動き, 行き来; ~の絶え間ない供給; 移動[供給]量\n\n言葉、考えが流れるように出てくること\n\n満ち潮, 上げ潮";
        word30.hatuon = @"floʊ";
        word30.reibun = @"A free flow of water came from the pipe.";
        
        TestWord *word31 = [TestWord new];
        word31.name = @"forward";
        word31.detail =  @"副詞\n前へ, 前の方へ, 先へ; 先に進んで, 発展して\n\n将来に向かって, 時間的に先に; ~を繰り上げて\n\n~がさし出されて; 外へ, 現れて\n\n形容詞\n前方の; ~の前部の; 前進の\nWe can see the ___ part of the ship.\n船の前方部が見える。\n\n将来の, 先を見越した;先物の取引、契約\n\n普通より早い; 進んだ; ~がはかどった; 植物が早生りの, 早咲きの; 子供が早熟な, ませた\n\n動詞\n他動詞\n~を転送する\n\n~を送る, 発送する";
        word31.hatuon = @"fɔ́ːrwərd";
        word31.reibun = @"We can see the forward part of the ship.";
        
        TestWord *word32 = [TestWord new];
        word32.name = @"hill";
        word32.detail =  @"名詞 複～s/-z/\n丘, 小山; 丘陵地帯\n\n坂, 斜面\n\n米国議会\n\n塚; 山状のもの";
        word32.hatuon = @"hɪl";
        word32.reibun = @"";
        
        TestWord *word33 = [TestWord new];
        word33.name = @"level";
        word33.detail =  @"名詞 複～s/-z/\n~の程度, 度合い, レベル\n___s of unemployment vary from region to region.\n失業率は地域によって様々だ。\n\n~の水準, レベル\n\n~をとらえる段階, 面; 観点, 見地\n\n~の階層, 地位, レベル; 特定の地位を占める人々\n\n地面、海面からの高さ; ある基準からの高さ, 水位; ある高さの水平面; 水平\n\n建物の階\n\n形容詞～er; ～est\n平らな, 水平な; 傾いていない; 起伏のない\nA football field should be ___.\nサッカー場は平らであるべきだ。\n\n同じ高さ[水準]の; 対等の, 同程度の; チームが同点の\n\n動詞～s/-z/; ～ed/-d/, ; ～ing\n\n他動詞\n~を平らにする; ~の表面をならす\n\n~を完全に破壊する; 打ち倒す\n\n~を平等にする;  ~を同じにする\n\n~を向ける; 非難、批判を向ける";
        word33.hatuon = @"lév(ə)l";
        word33.reibun = @"Levels of unemployment vary from region to region.     A football field should be level.";
        
        TestWord *word34 = [TestWord new];
        word34.name = @"lone";
        word34.detail =  @"形容詞\n単独の, 孤立した; 独りの, 孤独の, 寂しい; 人里離れた, 人跡まれな\nIn that cloudy sky only one ___ star can be seen.\nその曇った空にぽつんと光る一つの星が見える。\n\n独りで子育てをしている母、父";
        word34.hatuon = @"loʊn";
        word34.reibun = @"In that cloudy sky only one lone star can be seen.";
        
        TestWord *word35 = [TestWord new];
        word35.name = @"puddle";
        word35.detail =  @"名詞\n水たまり\nThe ___ evaporated rapidly in the sun.\nその水たまりは太陽の光ですぐに蒸発した。";
        word35.hatuon = @"pʌ́d(ə)l";
        word35.reibun = @"The puddle evaporated rapidly in the sun.";
        
        TestWord *word36 = [TestWord new];
        word36.name = @"response";
        word36.detail =  @"名詞 複～s/-ɪz/\n反応; 反響\nThe tax cuts produced a favourable ___ from the public.\n公衆は減税を歓迎した。\n\n 答え, 応答; 解答; アンケートの回答";
        word36.hatuon = @"rɪspɑ́ns|-spɔ́ns";
        word36.reibun = @"The tax cuts produced a favourable response from the public.";
        
        TestWord *word37 = [TestWord new];
        word37.name = @"season";
        word37.detail =  @"名詞 複～s/-z/\n四季の1つ, 季節\nWinter is the coldest ___ in a year.\n冬は一年で最も寒い季節だ。\n\n季節, 時節\n\n時期, シーズン, 季節; 旬\n\nぴったりの季節\n\n演劇が上演される一定期間, 公演、演劇のシリーズ; 映画、テレビのシリーズ物[番組]\n\n動詞\n食べ物に味付けする; 会話に添える";
        word37.hatuon = @"síːz(ə)n";
        word37.reibun = @"Winter is the coldest season in a year.";
        
        TestWord *word38 = [TestWord new];
        word38.name = @"solution";
        word38.detail =  @"名詞 複～s/-z/\n解決, 解決策[法, 案]\nThe ___ of the problem has just come to me.\nその問題の解決法を丁度思いついた。\n\n解答, 答え, 解 ; 問題を解くこと\n\n溶液";
        word38.hatuon = @"səlúːʃ(ə)n";
        word38.reibun = @"The solution of the problem has just come to me.";
        
        TestWord *word39 = [TestWord new];
        word39.name = @"waste";
        word39.detail =  @"動詞～s/-ts/; ～d/-ɪd/; ___ing\n他動詞\n ~をむだに使う, 浪費する; 機会をのがす\n\n善意、言葉が通じない, 理解[感謝]されない\n\n人の能力が 十分発揮されない, むだ遣いされる\n\n自動詞\nむだ遣いする, 浪費する\n\n名詞複～s/-ts/\nむだ遣い, 浪費, 空費; むだになるもの\nIt's only a ___ of time to speak to her.\n彼女と話すのは時間の無駄でしかない。\n\n廃物, くず, ごみ; 老廃物, 廃棄物; 排泄物\n\n形容詞\n荒れはてた, 不毛の; 耕してない\n\n不用の, 廃物の; くずの; 廃棄物用の";
        word39.hatuon = @"weɪst";
        word39.reibun = @"It's only a waste of time to speak to her.";
        
        TestWord *word40 = [TestWord new];
        word40.name = @"whether";
        word40.detail =  @"接続詞\n~かどうか; ~か~か\n\n~すべきかどうか\nI'm uncertain ___ to go or not.\n行くべきかどうか、はっきりとは分からない。\n\n~であろうとなかろうと; ~であろうと~であろうと";
        word40.hatuon = @"(h)wéðər";
        word40.reibun = @"I'm uncertain whether to go or not.";
        
		words = [NSMutableArray arrayWithObjects:
                 word21, word22, word23, word24, word25,
                 word26, word27, word28, word29, word30, word31, word32, word33, word34, word35, word36, word37,
                 word38, word39, word40, nil];
    }
    
    if ( [wordNo isEqualToString:@"18"]){
        TestWord *word41 = [TestWord new];
        word41.name = @"argue";
        word41.detail =  @"動詞～s/-z/; ～d/-d/; ___ing\n自動詞\n~のことで論争する; 言い争う, 口論する\n\n理由を挙げて~に賛成[反対]の主張をする, 論を述べる\n\n他動詞\n理由を挙げて~だと主張する, 論じる\n\n理由を挙げて~を論じる, 議論する\nThe experts ___ about which diet is best.\n専門家達は何の食べ物が一番良いかについて議論する。\n\n~を説得する ";
        word41.hatuon = @"ɑ́ːrɡjuː";
        word41.reibun = @"The experts argue about which diet is best.";
        
        TestWord *word42 = [TestWord new];
        word42.name = @"communicate";
        word42.detail =  @"動詞～s/-ts/; ～d/-ɪd/; -cating\n自動詞\n~で~と情報[意見]を交換する, 通信する, 連絡をとる\n\n自分の意図を伝達する\n\n~と意思の疎通をする, 気持ちを通い合わせる\nI like to ___ with my family.\n家族と接する事が好きだ。\n\n~がつながっている, 通じている\n\n~が伝わる, 伝達される\n\n他動詞\n~を伝える, 伝達する; ~が~に伝わる; ~だと伝える";
        word42.hatuon = @"kəmjúːnɪkèɪt";
        word42.reibun = @"I like to communicate with my family.";
        
        TestWord *word43 = [TestWord new];
        word43.name = @"crowd";
        word43.detail =  @"名詞～s/-dz/\n群衆, 人ごみ; 観衆, 聴衆\nA large ___ was waiting at the bus stop.\n大群衆がバス停で待っていた。\n\n多数の~\n\n仲間, グループ, 連中\n\n大衆, 民衆, 庶民\n\n動詞～s/-dz/; ～ed/-ɪd/; ～ing\n自動詞\n群がる ; 殺到する, 押し寄せる\n\n他動詞\nに群がる, 押し寄せる\n\nを詰め込む, 押し込む\n\n不快なほど人に接近する;にせっつく, うるさくせがむ, 干渉する";
        word43.hatuon = @"kraʊd";
        word43.reibun = @"A large crowd was waiting at the bus stop.";
        
        TestWord *word44 = [TestWord new];
        word44.name = @"depend";
        word44.detail =  @"動詞～s/-dz/; ～ed/-ɪd/; ～ing\n~次第である; ~かによる\n\n~に依存する, 頼る\n\n~するのに~頼る\n\n~を信用する, 当てにする\nHe is a man whom you can ___ on.\n彼はあなたが信用出来る人だ。\n\n~するのを当てにする";
        word44.hatuon = @"dɪpénd";
        word44.reibun = @"He is a man whom you can depend on.";
        
        TestWord *word45 = [TestWord new];
        word45.name = @"dish";
        word45.detail =  @"名詞 複～es/-ɪz/\n皿, 盛り皿\nThe careless waiter dropped the ___ onto the ground.\nそそっかしいウェイターは皿を地面に落とした。\n\n食器類\n\n皿に盛った料理; 1皿分の料理\n\n皿の形をした物; へこみ, くぼみ";
        word45.hatuon = @"dɪʃ";
        word45.reibun = @"The careless waiter dropped the dish onto the ground.";
        
        TestWord *word46 = [TestWord new];
        word46.name = @"empty";
        word46.detail =  @"形容詞-tier; -tiest\nからの, からっぽの; 人のいない, がらんとした; 空いている, 使っていない\nHis room is ___.\n彼の部屋は空っぽだ。\n\n~がない, 欠けている\n\n空虚な, 意味[内容, 誠意]のない; 口先だけの, 当てにならない\n\nむなしい, 無為な\n\n動詞-ties/-z/; -tied/-d/; ～ing\n他動詞\n~をからにする; 中の物をあける ; ~の中の物をあける\n\n中身を取り出して出す[あける]\n\n部屋、建物から人を立ち退かせる, 避難させる\n\n自動詞\nからになる; 場所から人がいなくなる\n\n川、群衆が流れる";
        word46.hatuon = @"ém(p)ti";
        word46.reibun = @"His room is empty.";
        
        TestWord *word47 = [TestWord new];
        word47.name = @"exact";
        word47.detail =  @"形容詞more ～; most ～\n正確な, 的確な, ぴったりの; まさにその\nWhat is the ___ size of the room?\nその部屋の正確な面積はいくつですか？\n\n~が厳密な, 精密な; 慎重な, きちょうめんな\n\n~が厳しい, 厳格な";
        word47.hatuon = @"ɪɡzǽkt";
        word47.reibun = @"What is the exact size of the room.";
        
        TestWord *word48 = [TestWord new];
        word48.name = @"fresh";
        word48.detail =  @"形容詞～er; ～est\n新しい, できたての; ありきたりではない, 使い古されていない; 新着の, 新規の; 追加の; 未使用の, 未知の\n\n記憶に新しい; 鮮明な, 生々しい\n\n新鮮な;冷凍[缶詰]されてない, 生の; 花が摘まれたばかりの; 淡水の, 真水の; 無塩の\n\n空気がすがすがしい; さわやかな~; 鮮やかな, 明るい色; 健康的な, 紅潮している\nOpen the window and let in some ___ air.\n窓を開けて新鮮な空気を入れる。\n\n元気な, 疲れていない\n\n新米の, 未熟な; うぶな; ~したばかりの\n\n失礼な, 生意気な;なれなれしい\n\n副詞\n新たに~した, ~したばかりの\n\n名詞\n最初の時期";
        word48.hatuon = @"freʃ";
        word48.reibun = @"Open the window and let in some fresh air.";
        
        TestWord *word49 = [TestWord new];
        word49.name = @"gather";
        word49.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing/ɡǽð(ə)rɪŋ/\n\n~を集める, かき[拾い]集める\n\n~を収集する, 集める\n\n~を推測する ; ~だと推測する\n\n~を増す\n\n~をふるい起こす, 集中する\n\n自動詞\n集まる, 群がる\n\n雲が次第に厚くなる; 暗やみが迫る\nClouds ___ before a thunderstorm.\n雷雨の前は雲が集まる。";
        word49.hatuon = @"ɡǽðər";
        word49.reibun = @"Clouds gather before a thunderstorm.";
        
        TestWord *word50 = [TestWord new];
        word50.name = @"indicate";
        word50.detail =  @"動詞～s/-ts/; ～d/-ɪd/; -cating\n他動詞\n~が~ということを示す, 指摘する\n\n~を使って指し示す; ~を表示する\nMy car's gas gauge ___d that there was little gas left.\n私の車のガスゲージはガスがほとんど無いことを表示した。\n\n~が~ということを暗に知らせる ,ほのめかす; 意味する\n\n~の徴候を示す, ~を表す, ~の兆しである";
        word50.hatuon = @"ɪ́ndɪkèɪt";
        word50.reibun = @"My car's gas gauge indicated that there was little gas left.";
        
        TestWord *word51 = [TestWord new];
        word51.name = @"item";
        word51.detail =  @"名詞 複～s/-z/\n項目, 品目, アイテム; 細目; 条項\nThe ___ of the contract still stands now.\nその契約条項はまだ有効だ。\n\n記事、ニュースの1項目, 短い記事";
        word51.hatuon = @"áɪtəm";
        word51.reibun = @"The item of the contract still stands now.";
        
        TestWord *word52 = [TestWord new];
        word52.name = @"offer";
        word52.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing/-f(ə)rɪŋ/\n他動詞\n~を申し出る; ~を差し出す; 志願する ; 身をささげる ; 名乗る\n\n進んで~しようと申し出る\n\n~に対して金額を提示する, オファーする\n\n忠告、情報を与える; 機会を提供する; 製品、サービスを提供する\nWe ___ a free service to customers.\n顧客に無料サービスを提供します。\n\n感謝、同情、謝罪を示す\n\n~を売り出す\n\n抵抗、暴力を試みる\n\n自動詞\n~を申し出る\n\n名詞複～s/-z/\n~をしようという申し出 ; プロポーズ\n\n取引希望価格, 付け値, オファー\n\n短期間の値引き, 割引";
        word52.hatuon = @"ɔ́ːfər|ɔ́fə";
        word52.reibun = @"We offer a free service to customers.";
        
        TestWord *word53 = [TestWord new];
        word53.name = @"price";
        word53.detail =  @"名詞 複～s/-ɪz/\n値段, 販売価格; 売り値; 物価 \nNo ___ is too high for winning their support.\n彼らの支持を得る為にどんな代価も惜しまない。\n\n代償, 犠牲\n\n懸賞金\n\n動詞\n他動詞\n~の値が付いている";
        word53.hatuon = @"praɪs";
        word53.reibun = @"No price is too high for winning their support.";
        
        TestWord *word54 = [TestWord new];
        word54.name = @"product";
        word54.detail =  @"名詞 複～s/-ts/\n製品, 生産物, 製造物, 作品; 保険の商品\nIf our ___ is properly marketed, it shall sell very well.\n私達の製品は適切に販売されれば、販路は拡大するだろう。\n\n~の成果, 産物, 所産, 結果";
        word54.hatuon = @"prɑ́dʌkt, -əkt|prɔ́d-";
        word54.reibun = @"If our product is properly marketed, it shall sell very well.";
        
        TestWord *word55 = [TestWord new];
        word55.name = @"property";
        word55.detail =  @"名詞 複-ties/-z/\n財産, 資産; 所有\n\n不動産; 土地, 建物\nHe has a large ___ in the county.\n彼はその州に広大な土地を持っている。\n\n特性, 属性, 特質\n\n~の所有権; 著作権";
        word55.hatuon = @"prɑ́pərti|prɔ́p-";
        word55.reibun = @"He has a large property in the county.";
        
        TestWord *word56 = [TestWord new];
        word56.name = @"purchase";
        word56.detail =  @"動詞～s/-ɪz/; ～d/-t/; -chasing\n他動詞\n大きな物、高額な物を買う, 購入する\nTickets must be ___d two weeks in advance.\nチケットは２週間前に購入しなければならない。\n\n勝利、自由を犠牲を払って獲得する, 手に入れる\n\n名詞 複～s/-ɪz/\n購入\n\n買った物, 購入品\n\nしっかりとつかむ[握る, 踏む]こと; 手[足]がかり";
        word56.hatuon = @"pə́ːrtʃəs";
        word56.reibun = @"Tickets must be purchased two weeks in advance.";
        
        TestWord *word57 = [TestWord new];
        word57.name = @"recommend";
        word57.detail =  @"動詞～s/-dz/; ～ed/-ɪd/; ～ing\n他動詞\n~すべきだと勧rめる\n\n~することを勧める\n\n~するように勧める\n\n~に推薦する, 推奨する ; ~を推薦する\nCan you ___ me some new books on this subject?\nこの学科の新しい本をいくつか薦められますか？\n\n~を魅力的にする, 気に入らせる\n\n自動詞\n~を勧めない.";
        word57.hatuon = @"rèkəménd";
        word57.reibun = @"Can you recommend me some new books on this subject?";
        
        TestWord *word58 = [TestWord new];
        word58.name = @"select";
        word58.detail =  @"動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n~を選ぶ, 選び出す\n\n~するように~を選ぶ\n\n~に~を選ぶ, 選出する\nThey ___ed him to their leader.\n彼らはリーダーに彼を選んだ。\n\n形容詞more ～; most ～\n特別に選ばれた, より抜きの, 極上の~\n\n上流階級限定の社交場、会, 高級な";
        word58.hatuon = @"səlékt";
        word58.reibun = @"They selected him to their leader.";
        
        TestWord *word59 = [TestWord new];
        word59.name = @"tool";
        word59.detail =  @"名詞 複～s/-z/\n道具, 工具; 工作機械の刃の部分\nDon't injure yourself with that ___.\nその道具でけがをするな。\n\n手段, 道具, 手立て\n\n手先, 道具のように使われる人";
        word59.hatuon = @"tuːl";
        word59.reibun = @"Don't injure yourself with that tool.";
        
        TestWord *word60 = [TestWord new];
        word60.name = @"treat";
        word60.detail =  @"動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n~を扱う, 待遇する\nDo not ___ me as if I were a child .\n子供のように扱わないでくれ。\n\n~を扱う, 取り上げる, 論じる\n\n~を治療する ; ~を治療する\n\n~を~だとみなす\n\n~におごる, 与える\n\n化学処理される\n\n名詞複～s/-ts/\n格別の楽しみ, 喜び; ごちそう, もてなし; うれしい出来事\n\nおごり, おごる番";
        word60.hatuon = @"triːt";
        word60.reibun = @"Do not treat me as if I were a child .";
        
		words = [NSMutableArray arrayWithObjects:
                 word41, word42, word43, word44, word45, word46, word47, word48, word49,
                 word50, word51, word52, word53, word54, word55, word56, word57, word58, word59, word60, nil];
    }
    
    if ( [wordNo isEqualToString:@"19"]){
        TestWord *word61 = [TestWord new];
        word61.name = @"alive";
        word61.detail =  @"形容詞more ～; most ～\n生きて, 生存して\n\n現存する, この世での\n\n生き生きとした, 活発な\n\n~が絶えないで\n\nたくさんいて, 群れて; にぎやかで, 活気があって\nThe city was all ___ when he arrived.\n彼が着いた時その都市は活気に溢れていた。";
        word61.hatuon = @"əláɪv";
        word61.reibun = @"The city was all alive when he arrived.";
        
        TestWord *word62 = [TestWord new];
        word62.name = @"bone";
        word62.detail =  @"名詞 複～s/-z/\n骨\n\n骨格, 体つき; 骨子, 要点, 骨組み\n\n遺骨, 死体\n\n骨状のもの, 骨の役目をするもの\n\n副詞\nまったく, すっかり";
        word62.hatuon = @"boʊn";
        word62.reibun = @"";
        
        TestWord *word63 = [TestWord new];
        word63.name = @"bother";
        word63.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing/-ð(ə)rɪŋ/\n他動詞\n~を悩ませる, 困らせる;~ということで困る;~することを苦にする\nI've no time to ___ with such things.\nそのような事で悩む暇無い。\n\n~をじゃまする ; ~にうるさくせがむ, 面倒をかける\n\n痛みを与える\n\n自動詞\nわざわざする ; 手をわずらわす\n\nくよくよ悩む, 心配する, 苦にする\n\n名詞複～s/-z/\n面倒, 骨折り ; 騒ぎ\n\nやっかいな~, 悩みの種";
        word63.hatuon = @"bɑ́ðər|bɔ́ðə";
        word63.reibun = @"I've no time to bother with such things.";
        
        TestWord *word64 = [TestWord new];
        word64.name = @"captain";
        word64.detail =  @"名詞 複～s/-z/\n船長, 艦長; 機長\n\nキャプテン, 主将; 工場の現地主任, 学級の級長\n\n集団の長; 指導者, 指揮者\n\n陸軍大尉 ; 海軍大佐; 空軍[海兵隊]大尉";
        word64.hatuon = @"kǽpt(ə)n|-tɪn";
        word64.reibun = @"";
        
        TestWord *word65 = [TestWord new];
        word65.name = @"conclusion";
        word65.detail =  @"名詞 複～s/-z/\n推論による結論, 決定, 判定\nYour information is inaccurate and your ___ is therefore wrong.\nあなたの情報は不正確なので結論は間違っている。\n\n~の終わりの部分, 結末, 結び; 裁判、交渉の決着; 終わること\n\n~の締結, 取り決め";
        word65.hatuon = @"kənklúːʒ(ə)n";
        word65.reibun = @"Your information is inaccurate and your conclusion is therefore wrong.";
        
        TestWord *word66 = [TestWord new];
        word66.name = @"doubt";
        word66.detail =  @"名詞 複～s/-ts/\n疑い, 疑念, 疑惑, 疑義\nThere is no ___ that we will be successful.\n私達が成功する事に疑いは無い。\n\n動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n~を疑う, ~は本当だろうかと思う; ~ということを疑う\n\n事がありそうにないと思う;~ではないと思う\n\nを信用しない";
        word66.hatuon = @"daʊt";
        word66.reibun = @"There is no doubt that we will be successful.";
        
        TestWord *word67 = [TestWord new];
        word67.name = @"explore";
        word67.detail =  @"動詞～s/-z/; ～d/-d/; ___ing/-plɔ́ːrɪŋ/\n他動詞\n~を探検する, 探査する; ~を調査する\nThe experts are ___ing every part of the island.\n専門家はその島の隅々まで調査した。\n\n~を探究する, 検討する, 探る; ~かを調べる\n\n自動詞\n~を求めて探検する, 踏査する";
        word67.hatuon = @"ɪksplɔ́ːr, eks-";
        word67.reibun = @"The experts are exploring every part of the island.";
        
        TestWord *word68 = [TestWord new];
        word68.name = @"foreign";
        word68.detail =  @"形容詞\n外国の, 他国の; 外国から[行き]の; 外国産の; 外国人の\nIt's not easy to master a ___ language.\n外国語の習得は簡単な事ではない。\n\n外交の, 対外的な";
        word68.hatuon = @"fɔ́ːr(ə)n, fɑ́r-|fɔ́r-";
        word68.reibun = @"It's not easy to master a foreign language.";
        
        TestWord *word69 = [TestWord new];
        word69.name = @"glad";
        word69.detail =  @"形容詞～der; ～dest\n~ということがうれしい ; うれしく思う\nI'm ___ to hear he's feeling better.\n彼の体の具合が良くなっていると聞いて嬉しい。\n\n喜んで~する\n\nうれしい, 喜ばしい表情、知らせ";
        word69.hatuon = @"ɡlæd";
        word69.reibun = @"I'm glad to hear he's feeling better.";
        
        TestWord *word70 = [TestWord new];
        word70.name = @"however";
        word70.detail =  @"副詞\nしかしながら, けれども; 一方では\nHis first response was to say no. Later, ___, he changed his mind.\n最初彼は拒絶したが、その後考えを変えた。\n\nどんなに~であっても\n\nどのくらい~かわからない数[量]\n\nどのようであっても, いずれにしても\n\nいったいどうやって\n\n接続詞\nどのように~しても";
        word70.hatuon = @"haʊévər";
        word70.reibun = @"His first response was to say no. Later, however, he changed his mind.";
        
        TestWord *word71 = [TestWord new];
        word71.name = @"injustice";
        word71.detail =  @"名詞 複～s/-ɪz/\n権利の侵害, 不公平; 不正, 非道\nNo one dared to speak out against the ___.\n誰もその不正に対して反対を唱えなかった。\n\n不正行為; 不当な扱い";
        word71.hatuon = @"ɪndʒʌ́stɪs";
        word71.reibun = @"No one dared to speak out against the injustice.";
        
        TestWord *word72 = [TestWord new];
        word72.name = @"international";
        word72.detail =  @"形容詞\n国際的な, 国家間の, 国際上の\nThe country violated the ___ agreement.\nその国は国際協定に違反した。";
        word72.hatuon = @"ɪ̀ntərnǽʃ(ə)n(ə)l";
        word72.reibun = @"The country violated the international agreement.";
        
        TestWord *word73 = [TestWord new];
        word73.name = @"lawyer";
        word73.detail =  @"名詞 複～s/-z/\n法律家, 弁護士; 法律通";
        word73.hatuon = @"lɔ́ːjər, lɔ́ɪər";
        word73.reibun = @"";
        
        TestWord *word74 = [TestWord new];
        word74.name = @"mention";
        word74.detail =  @"動詞～s/-z/; ～ed; ～ing\n他動詞\n~に軽くふれる; ~を挙げる, ~の名を挙げる; ~について言及する\nHe made no ___ of having met her.\n彼は彼女に会った事があるのを口にしなかった。\n\n~すると言う; ~だと述べる, 言う\n\n称賛[非難]される; ~の候補者にされる\n\n言うこと; 言及すること; 名を挙げること";
        word74.hatuon = @"ménʃ(ə)n";
        word74.reibun = @"He made no mention of having met her.";
        
        TestWord *word75 = [TestWord new];
        word75.name = @"policy";
        word75.detail =  @"名詞 複-cies/-z/\n政策, 方針, 施策, 方策\nThis latest incident may be the lever needed to change government ___.\n最近起きたこの事件は政府の政策を変える手立てとなる可能性がある。\n\n信条, 主義, やり方; 知恵\n\n保険証券, 保険証書";
        word75.hatuon = @"pɑ́ləsi|pɔ́l-";
        word75.reibun = @"This latest incident may be the lever needed to change government policy.";
        
        TestWord *word76 = [TestWord new];
        word76.name = @"social";
        word76.detail =  @"形容詞\n社会の, 社会に関する, 社会的な\nHer research is centred on the ___ effects of unemployment.\n彼女の研究課題は失業の社会的な影響についてだ。\n\n社会的階級[地位]に関する\n\n社交の, 懇親の活動、会; 社交上の\n\n社交的な, 人付き合いのよい";
        word76.hatuon = @"sóʊʃ(ə)l";
        word76.reibun = @"Her research is centred on the social effects of unemployment.";
        
        TestWord *word77 = [TestWord new];
        word77.name = @"speech";
        word77.detail =  @"名詞 複～es/-ɪz/\n演説, 講演; スピーチ ; 演説、スピーチのせりふ, 言葉\nThe mayor made a ___ at the opening.\n市長は開幕式に演説を行った。\n\n話す力, 言語能力\n\n話すこと, 発言\n\n話し方, 話しぶり\n\n話し言葉; 特定の地域や人々の話す言葉, 方言; 国語";
        word77.hatuon = @"spiːtʃ";
        word77.reibun = @"The mayor made a speech at the opening.";
        
        TestWord *word78 = [TestWord new];
        word78.name = @"staff";
        word78.detail =  @"名詞 複～s/-s/\n職員, 従業員, 社員, スタッフ\n\n動詞～s/-s/; ～ed/-t/; ～ing\n他動詞\n職場、会社が 職員[スタッフ]を配置されている ; ~のスタッフを務める";
        word78.hatuon = @"stæf|stɑːf";
        word78.reibun = @"";
        
        TestWord *word79 = [TestWord new];
        word79.name = @"toward";
        word79.detail =  @"前置詞\n~の方へ, ~に向かって; ~の方に向いて, ~に面して\nThe bus follows the road ___ Tokyo.\nバスは東京へ向かう道路に沿って運行する。\n\n~のために\n\n~に対して\n\n(時間)~の直前に, ~の近くに, ~のころに\n\n~の近くに";
        word79.hatuon = @"tɔːrd|təwɔ́ːd";
        word79.reibun = @"The bus follows the road toward Tokyo.";
        
        TestWord *word80 = [TestWord new];
        word80.name = @"wood";
        word80.detail =  @"名詞 複～s/-dz/\n木材, 材料としての木; 木製の\n\n森; 林\n\nまき, 薪";
        word80.hatuon = @"wʊd";
        word80.reibun = @"";
		
        words = [NSMutableArray arrayWithObjects:
                 word61,
                 word62, word63, word64, word65, word66, word67, word68, word69, word70, word71, word72, word73,
                 word74, word75, word76, word77, word78, word79, word80,  nil];
    }
    
    if ( [wordNo isEqualToString:@"20"]){
        TestWord *word81 = [TestWord new];
        word81.name = @"achieve";
        word81.detail =  @"動詞～s/-z/; ～d/-d/; ___ing\n他動詞\n地位、成功を獲得する, 得る, 受ける; よい結果を得る, 生み出す, もたらす\n\n~を達成する, やり遂げる\nWork hard, and you will ___ your goal.\n頑張れば自分の目標を達成出来るだろう。\n\n自動詞\n成功をおさめる, 目的を達成する";
        word81.hatuon = @"ətʃíːv";
        word81.reibun = @"Work hard, and you will achieve your goal.";
        
        TestWord *word82 = [TestWord new];
        word82.name = @"advise";
        word82.detail =  @"動詞～s/-ɪz/; ～d/-d/; ___ing\n他動詞\nくわしい人が~するよう忠告する[強く勧める]\nHe can ___ on how to learn English well.\n彼は英語を上手に学習する方法をアドバイスすることが出来る。\n\n~ということを忠告する\n\n~しないよう警告する, 戒める; ~をしないよう忠告する\n\n~について専門的助言をする\n\n~を勧める\n\n自動詞\n忠告[助言]する\n\n相談する, 助言を求める\n\n通知する";
        word82.hatuon = @"ədváɪz";
        word82.reibun = @"He can advise on how to learn English well.";
        
        TestWord *word83 = [TestWord new];
        word83.name = @"already";
        word83.detail =  @"副詞\nもう, すでに\nI've ___ paid my membership dues.\n既に会費を払っている。\n\nもう; 驚いてそんなに早く\n\nもういいかげん";
        word83.hatuon = @"ɔː(l)rédi";
        word83.reibun = @"I've already paid my membership dues.";
        
        TestWord *word84 = [TestWord new];
        word84.name = @"basic";
        word84.detail =  @"形容詞more ～; most ～\n重要な, 基本の, 基礎になる構造、活動、原則; 必要な; 不可欠の\nFood, clothing and shelter are all ___ necessities of life.\n衣食住は生活の基本必需品だ。\n\n初歩的な, 基本的な\n\n簡素な, 必要最小限の; 最低限の価格、収入\n\nだれもが持つ感情、権利\n\n名詞\n重要な[基本的な]事実, 基本原理, 初歩";
        word84.hatuon = @"béɪsɪk";
        word84.reibun = @"Food, clothing and shelter are all basic necessities of life.";
        
        TestWord *word85 = [TestWord new];
        word85.name = @"bit";
        word85.detail =  @"名詞 複～s/-ts/\n(程度の点で)ちょっと, 少し, 少々\n\n時間、距離の点で少し\n\n少しの~, 少量[一口, 一切れ, 一片]の~; 1つの~\nHe assembled the model aircraft ___ by ___.\n彼は飛行機の模型を少しずつ組み立てた。\n\n小さい部分, 小片; 物語、映画の一部分, 一場面; 劇、映画の端役";
        word85.hatuon = @"bɪt";
        word85.reibun = @"He assembled the model aircraft bit by bit.";
        
        TestWord *word86 = [TestWord new];
        word86.name = @"consider";
        word86.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\n~をよく考える, 熟慮[検討]する; ~かをよく考える\nPlease take time to ___ the problem.\nよくその問題を考えてください。\n\n~を~と考える, 思う, 見なす ; ~だと考える; ~を~したものと考える\n\n気持ちを思いやる, ~に配慮する; ~を考慮する, 斟酌する; ~ということを考慮する\n\n~を議論する; ~を検討する\n\n自動詞\nよく考える, 熟慮する, 考えてみる; 考慮する";
        word86.hatuon = @"kənsɪ́dər";
        word86.reibun = @"Please take time to consider the problem.";
        
        TestWord *word87 = [TestWord new];
        word87.name = @"destroy";
        word87.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\n~を破壊する, 壊す; ~を滅ぼす\nIf the tree falls that way, it will ___ the house.\nもしその木があちらに倒れたら家が潰れてしまう。\n\n~を破滅させる; ~を台なしにする; ~を打ち砕く, くじく\n\n~が殺される, 処分される\n\n~を破棄する, 破り捨てる";
        word87.hatuon = @"dɪstrɔ́ɪ";
        word87.reibun = @"If the tree falls that way, it will destroy the house.";
        
        TestWord *word88 = [TestWord new];
        word88.name = @"entertain";
        word88.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\nおもしろがらせる, 楽しませる\n\nもてなす, 接待する, 歓待する ; 招待してもてなす\nI like to ___ friends with music at home.\n家では音楽で人をもてなすのが好きだ。\n\n~をいだく, 持つ; 提案を考慮する ";
        word88.hatuon = @"èntərtéɪn";
        word88.reibun = @"I like to entertain friends with music at home.";
        
        TestWord *word89 = [TestWord new];
        word89.name = @"extra";
        word89.detail =  @"形容詞\n追加の, 余分の, 特別の, 臨時の\n\n余分に料金がいる\nGuests at this hotel can use the gym at no ___ cost.\nこのホテルの宿泊者は追加料金無しでジムを利用する事が出来ます。\n\n特別上等の, 格別の\n\n副詞\n余分に, 追加で, 割り増しで\n\n格別に, いつもより\n\n名詞\nオプション製品[サービス]; 追加料金\n\n余分なもの, 予備\n\nエキストラ\n\n臨時雇いの人\n\n接頭辞\n外側の; 範囲外の; ~を越えた; その上に";
        word89.hatuon = @"ékstrə";
        word89.reibun = @"Guests at this hotel can use the gym at no extra cost.";
        
        TestWord *word90 = [TestWord new];
        word90.name = @"goal";
        word90.detail =  @"名詞 複～s/-z/\n目標, 目的\nwe lose sight of the ___\n目標を見失った。\n\nゴール; ゴールに入った得点\n\nレースのフィニッシュライン\n\n目的地, 行き先";
        word90.hatuon = @"ɡoʊl";
        word90.reibun = @"we lose sight of the goal";
        
        TestWord *word91 = [TestWord new];
        word91.name = @"lie";
        word91.detail =  @"動詞～s/-z/; ～d/-d/; lying\n自動詞\nうそをつく\nI promise never to ___ to you from now on.\n今後あなたに二度と嘘をつかない事を誓う。\n\n欺く, 間違った印象を与える\n\n他動詞\n~をだまして~に陥れる, ~にうそをついて~させる ; だまして金を巻き上げる\n\n名詞 複～s/-z/\nうそ, 虚偽";
        word91.hatuon = @"laɪ";
        word91.reibun = @"I promise never to lie to you from now on.";
        
        TestWord *word92 = [TestWord new];
        word92.name = @"meat";
        word92.detail =  @"名詞 複～s/-ts/\n食用の肉; 骨の周りの身; 肉付き\n\n木の実、卵、貝カニの身; 果肉\n\n要点, 骨子, 内容";
        word92.hatuon = @"miːt";
        word92.reibun = @"";
        
        TestWord *word93 = [TestWord new];
        word93.name = @"opinion";
        word93.detail =  @"名詞 複～s/-z/\n意見, 考え, 見解, 持論\nI can't agree with your ___ in this respect.\nこの点はあなたの意見に賛成出来ない。\n\n~についての~な評価\n\n世論, 世間の考え\n\n専門家の判断, 所見, 鑑定";
        word93.hatuon = @"əpɪ́njən";
        word93.reibun = @"I can't agree with your opinion in this respect.";
        
        TestWord *word94 = [TestWord new];
        word94.name = @"real";
        word94.detail =  @"形容詞more ～; most ～\n実在する; 現実の, 実際の\n\n本当の, 真の; 本物の\nChildren believe that these characters are ___.\n子供達はそのキャラクターが本物だと信じている。\n\nまったくの, すごい\n\nその名に値する, 真の意味での\n\n最も重要な\n\n心からの, 本気の\n\n実質の賃金、収入\n\n情景、描写が真に迫った, リアルな";
        word94.hatuon = @"ríː(ə)l|rɪ́əl";
        word94.reibun = @"Children believe that these characters are real.";
        
        TestWord *word95 = [TestWord new];
        word95.name = @"reflect";
        word95.detail =  @"動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n~を反射する; 音を反響する\nThe sunlight was ___ed in the water.\n日光は水面で反射した。\n\n~を反映する, 表す, 示す; ~であるかを反映する\n\n~ということを熟考する, よく考える\n\n~が鏡に映る, 映し出される\n\n~を結果としてもたらす, 招く\n\n自動詞\n~が反射する; 音が反響する\n\n熟考する\n\n~が影響を及ぼす, 印象[評判]をもたらす";
        word95.hatuon = @"rɪflékt";
        word95.reibun = @"The sunlight was reflected in the water.";
        
        TestWord *word96 = [TestWord new];
        word96.name = @"regard";
        word96.detail =  @"動詞～s/-dz/; ～ed/-ɪd/; ～ing\n他動詞\n~とみなす, 考える\nI ___ reading as a form of recreation.\n読書は気晴らしの一つだと考えている。\n\n~を考える, 捉える ; ~を評価する, ~を尊敬する\n\n名詞 複～s/-dz/\n敬意, 尊敬; 好意; 評価\n\n配慮, 思いやり; 考慮, 注意\n\n手紙、伝言のよろしくというあいさつ";
        word96.hatuon = @"rɪɡɑ́ːrd";
        word96.reibun = @"I regard reading as a form of recreation.";
        
        TestWord *word97 = [TestWord new];
        word97.name = @"serve";
        word97.detail =  @"動詞～s/-z/; ～d/-d/; ___ing\n他動詞\n飲食物を出す, 配る\nThe waiter is ___ing another customer.\nそのウェイターは他の客に対応している。\n\n料理が~人分である\n\n目的、必要、利益にかなう, 機能を果たす; 役に立つ, 助ける; 満足させる\n\n~のために働く, ~に勤務する; ~に仕える; 使用人として~に奉公する\n\n期間、任期を務める\n\n客の世話をする, ~に応対する; ~を売る\n\n商品、サービスを~に提供する\n\n正式文書を渡す; 召喚状を渡す\n\n自動詞\n役立つ, 用をなす, 間に合う\n\n勤務する, 務める, 働く, 仕事をする\n\n使用人として奉公する\n\n飲食物を出す, 給仕する; ~のままで出す";
        word97.hatuon = @"sə́ːrv";
        word97.reibun = @"The waiter is serving another customer.";
        
        TestWord *word98 = [TestWord new];
        word98.name = @"vegetable";
        word98.detail =  @"名詞 複～s/-z/\n野菜; 温野菜\n\n植物, 草木\n\n形容詞\n野菜の; 植物性の";
        word98.hatuon = @"védʒ(ə)təb(ə)l";
        word98.reibun = @"";
        
        TestWord *word99 = [TestWord new];
        word99.name = @"war";
        word99.detail =  @"名詞 複～s/-z/\n戦争, 紛争; 戦時\nThe army was disbanded when the ___ came to an end.\nその軍隊は戦争が終わった時に解散した。\n\n長期的な闘い, 争い\n\n権力、支配をめぐる争い, 戦争\n\n形容詞\n戦争の; 戦争に用いる; 戦争で生じた";
        word99.hatuon = @"wɔːr";
        word99.reibun = @"The army was disbanded when the war came to an end.";
        
        TestWord *word100 = [TestWord new];
        word100.name = @"worth";
        word100.detail =  @"前置詞\nある金額の価値がある, 値打ちがある; 金に換算して~に相当する\nThe movie is definitely ___ seeing.\nその映画は本当に見る価値がある。\n\n~の価値がある, ~だけのことはある\n\n~する価値がある\n\n~するのは価値がある, それだけのことがあるから~すべきである\n\n名詞\nある金額相当の物\n\nある期間分の食料, ある期間かかる仕事\n\n価値, 重要性";
        word100.hatuon = @"wəːrθ";
        word100.reibun = @"The movie is definitely worth seeing.";
		
        words = [NSMutableArray arrayWithObjects:word81, word82, word83, word84, word85,
                 word86, word87, word88, word89, word90, word91, word92, word93, word94, word95, word96, word97,
                 word98, word99, word100, nil];
    }
    
    if ([wordNo isEqualToString:@"21"]) {
        
        TestWord *word1 = [TestWord new];
        word1.name = @"appear";
        word1.detail = @"動詞～s/-z/; ～ed/-d/; ～ing\n自動詞\n~に見える, ~の模様である ; ~するように見える, ~する模様である\n\n~と思われる\n\n~に現れる, 見える; ~に出現する; ~に姿を現す, 来る\nThe boy suddenly ___ed from under the bed.	\n少年はベッドの下から突然現れた。\n\n~に出演する, 出場する; 登場する\n\n出頭する, 出廷する\n\n~に載る\n\n出版される, ~に出回る, 並ぶ";
        word1.hatuon = @"əpɪ́ər";
        word1.reibun = @"The boy suddenly appeared from under the bed.";
        
        TestWord *word2 = [TestWord new];
        word2.name = @"base";
        word2.detail = @"名詞 複～s/-ɪz/\n基底, 基部, 土台, 台, ふもと, 付け根\n\n基礎, 根拠, 根底, 下地\nMany languages have Latin as their ___.\n言語の多くはラテン語が基礎となっている。\n\n基盤, 母体; 支持者層\n\n底; 最下層; 下塗り\n\nベース, 主成分\n\n起点, 本拠地, 中心地\n\n基地\n\n塁, ベース\n\n動詞～s/-ɪz/; ～d/-t/; basing\n\n~を拠点とする; ~に配置される\n\n~の基礎[根拠]を~に置く, ~をもとに~を構築する";
        word2.hatuon = @"beɪs";
        word2.reibun = @"Many languages have Latin as their base.";
        
        TestWord *word3 = [TestWord new];
        word3.name = @"brain";
        word3.detail = @"名詞 複～s/-z/\n脳, 脳髄\nThe drug may cause permanent ___ damage.\nその薬は永久的な脳の障害を引き起こす可能性がある。\n\n知能, 頭脳\n\n頭がいい人, 秀才, ブレーン\n\n最も頭のよい人; 知的指導者";
        word3.hatuon = @"breɪn";
        word3.reibun = @"The drug may cause permanent brain damage.";
        
        TestWord *word4 = [TestWord new];
        word4.name = @"career";
        word4.detail = @"名詞 複～s/-z/\n職業; 仕事\nHis early ___ was not a great success.\n彼が職に就いた頃はあまり成功しなかった。\n\n経歴, 履歴, 職歴\n\n成功, 出世\n\n全速力, 疾走\n\n専門職の; 職業に関する; 生涯を通じての, 通算の";
        word4.hatuon = @"kərɪ́ər";
        word4.reibun = @"His early career was not a great success.";
        
        TestWord *word5 = [TestWord new];
        word5.name = @"clerk";
        word5.detail = @"名詞 複～s/-s/\n事務員, 職員, 係\n\nフロント係\n\n店員\nThe ___ held out a dress for Martha to try on.\n店員はマーサが試着するドレスを取り出した。";
        word5.hatuon = @"kləːrk|klɑːk";
        word5.reibun = @"The clerk held out a dress for Martha to try on.";
        
        TestWord *word6 = [TestWord new];
        word6.name = @"effort";
        word6.detail =  @"名詞 複～s/-ts/\n努力, 奮闘, がんばり\nAll my ___s were fruitless.\n私の全ての努力は水の泡となった。\n\n骨折り仕事, 苦労, 労力; しんどい仕事である\n\n活動, 作業, 仕事\n\n努力の成果, 労作, 汗と涙の結晶";
        word6.hatuon = @"éfərt";
        word6.reibun = @"All my efforts were fruitless.";
        
        TestWord *word7 = [TestWord new];
        word7.name = @"enter";
        word7.detail = @"動詞～s/-z/: ～ed/-d/: ～ing\n他動詞\n~に入る\nPlease do not ___ before knocking on the door.\n入る前にノックをしてください。\n\n異物が~に入り込む\n\n~を差し込む, 差し入れる, 打ち込む\n\n~に入学する; ~に加入する\n\n~を入学させる\n\n~に就く, ~の道に進む\n\n~に加わる, 参加する; ~を始める\n\n~に参加する, ~の申し込みをする\n\n~を参加させる\n\n~を記入する, ~を記載する; ~を登録する\n\n~を入力する\n\n心、頭に浮かぶ, 湧き出す, 入り込む\n\n特定の時期, 段階に入る\n\n人生に現れる; ~に関与する\n\nネットワークシステムに入る, ~を立ち上げる, ~にログインする\n\n自動詞\n入る, 入ってくる\n\n入学する; 参加する\n\n登場する, 現れる";
        word7.hatuon = @"éntər";
        word7.reibun = @"Please do not enter before knocking on the door.";
        
        TestWord *word8 = [TestWord new];
        word8.name = @"excellent";
        word8.detail = @"形容詞\n非常に優れた, 優秀な, すばらしい\nShe would have made an ___ teacher.\n彼女は素晴らしい教師になれただろうに。\n\n大変結構です, よろしい";
        word8.hatuon = @"éks(ə)lənt";
        word8.reibun =  @"She would have made an excellent teacher.";
        
        TestWord *word9 = [TestWord new];
        word9.name = @"hero";
        word9.detail = @"名詞 複～es/-z/\n英雄, ヒーロー\n\n男性の主人公\n\nあこがれの対象";
        word9.hatuon = @"híːroʊ, hɪ́r-|hɪ́ər-";
        word9.reibun = @"";
        
        TestWord *word10 = [TestWord new];
        word10.name = @"hurry";
        word10.detail = @"動詞-ries/-z/; -ried/-d/; ～ing\n自動詞\n急ぐ; あわてる\n\n急いで[至急, あわてて]~する\nDon't let anyone ___ you into making a decision.\n誰からの催促であろうと急いで決定してはならない。\n\n急いで行く[移動する]\n\n他動詞\n~を急がせる; ~を急いで行かせる; ~を急がせて~する\n\n~を急いで行かせる; ~を急いで連れて[持って]行く[来る], 運ぶ; ~を急いで処理する\n\n~を急いでやる, ~をあわてて作る\n\n名詞\n急ぐ必要, 急ぐ理由\n\n急ぎ; あわてる[あせる]こと";
        word10.hatuon = @"hə́ːri|hʌ́ri";
        word10.reibun = @"Don't let anyone hurry you into making a decision.";
        
        TestWord *word11 = [TestWord new];
        word11.name = @"inform";
        word11.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\n通知する, 知らせる, 伝える, 報告する; ~を知らせる; ~ということを知らせる\nI wasn't ___ed of the decision until it was too late.\n私がその決定を知らされた時には既に手遅れだった。\n\nに影響を与える, ~を特徴[性格]づける ; ~で満たす; ~で元気づける";
        word11.hatuon = @"ɪnfɔ́ːrm";
        word11.reibun = @"I wasn't informed of the decision until it was too late.";
        
        TestWord *word12 = [TestWord new];
        word12.name = @"later";
        word12.detail =  @"副詞\n後で; 以後, 後ほど\nI'll speak with her ___.\n後で彼女と話します。\n\n後[終わり]の方で\n\n~の後で\n\n形容詞\n後の; 最近の; 後にある";
        word12.hatuon = @"léɪtər";
        word12.reibun = @"I'll speak with her later.";
        
        TestWord *word13 = [TestWord new];
        word13.name = @"leave";
        word13.detail =  @"動詞～s/-z/; left/left/; leaving\n他動詞\n~を去る, 離れる, たつ\n\n~を後にする, 出て行く; ~のもとを去る; ~と別れる, ~を見捨てる\n\n~をやめる, 退職する; ~を卒業[退学]する\n\n~を置き忘れる\n\n~を残して行く, 置き去りにする; ~を預ける\nYou can ___ it with us for safe keeping for no more than a month, or abandon it.\n一ヶ月以内であればそれを保管出来ます。もしくは放棄してください。\n\n~を残す, 置いて行く\n\n~にしておく, 放っておく\n\n~に~させておく\n\n~を残しておく, 作って[取って]おく\n\n~に残す, もたらす\n\n~が残っている, ある; ~が残されている\n\n~をやらない, 後回しにする, 放っておく\n\n~を任せておく, させておく ; ~を託す, ゆだねる, 任せる\n\n~を残して死ぬ; ~を~にして死ぬ \n\n~に多くを頼る, 依存する\n\n自動詞\n~に向かって去る, 出発する; ~から出発する \n\nやめる, 脱退する, 退職[辞職]する; 卒業[退学]する\n\n名詞 複～s/-z/\n休暇, 休暇許可, 賜暇";
        word13.hatuon = @"liːv";
        word13.reibun = @"You can leave it with us for safe keeping for no more than a month, or abandon it.";
        
        TestWord *word14 = [TestWord new];
        word14.name = @"locate";
        word14.detail =  @"動詞～s/-ts/; ～d/-ɪd/; ___ing\n他動詞\n~を見つける, 捜し出す, ~を突き止める\n\n~を置く, 設ける\nThey decided to ___ a new school in the suburbs.\n彼らは郊外に学校を新設する事を決定した。\n\nある, 位置する";
        word14.hatuon = @"lóʊkeɪt";
        word14.reibun = @"They decided to locate a new school in the suburbs.";
        
        TestWord *word15 = [TestWord new];
        word15.name = @"nurse";
        word15.detail =  @"名詞 複～s/-ɪz/\n看護師, 看護婦; ~看護師\n\n動詞～s/-ɪz/; ～d/-t/; ___ing\n他動詞\n~を看護する, 看病[介護]する\nWe'll have to put the baby to ___.\n子供の面倒を誰かに見てもらわなければならない。\n\n~をいやす, いたわる\n\n~を大切に育てる, はぐくむ; ~を栽培する";
        word15.hatuon = @"nəːrs";
        word15.reibun = @"We'll have to put the baby to nurse.";
        
        TestWord *word16 = [TestWord new];
        word16.name = @"operation";
        word16.detail =  @"名詞 複～s/-z/\n手術\n\n活動; 事業, 業務; 運営, 営業; 展開; 捜査活動\n\n作動, 稼働; 動作; 操作; 工程; 働き\nThe ___ of this machine is simple.\nこの機械の操作は簡単だ。\n\n軍事行動[作戦]\n\n開始, 施行; 有効, 作用, 影響\n\n操作, 取引";
        word16.hatuon = @"ɑ̀pəréɪʃ(ə)n|ɔ̀p-";
        word16.reibun = @"The operation of this machine is simple.";
        
        TestWord *word17 = [TestWord new];
        word17.name = @"pain";
        word17.detail =  @"名詞 複～s/-z/\n痛み, 苦痛\nHe has a ___ in the knee.\n彼は膝が痛い。\n\n苦しみ, 苦痛, 悩み, 苦悩\n\n骨折り, 苦労, 努力\n\nやっかいな~\n\n~を悲しくさせる, つらくさせる";
        word17.hatuon = @"peɪn";
        word17.reibun = @"He has a pain in the knee.";
        
        TestWord *word18 = [TestWord new];
        word18.name = @"refuse";
        word18.detail =  @"動詞～s/-ɪz/; ～d/-d/; ___ing\n他動詞\n~するのを断る, ~しようとしない\nI ___ to answer that question.\nその質問に答えるのを断る。\n\nを断る, 辞退する, 拒否する; ~を拒む; ~の求婚を断る\n\n~を与える[認める]のを拒む";
        word18.hatuon = @"rɪfjúːz";
        word18.reibun = @"I refuse to answer that question.";
        
        TestWord *word19 = [TestWord new];
        word19.name = @"though";
        word19.detail =  @"接続詞\n~にもかかわらず, ~だが, ~だけれども\nI don't know him well ___ I've known him for a long time.\n彼と知り合って長いが、彼の事はあまり分からない。\n\nもっとも~だが, でも, とは言うものの\n\n~だが\n\n副詞\nでも, ~だけど ";
        word19.hatuon = @"ðoʊ";
        word19.reibun = @"I don't know him well though I've known him for a long time.";
        
        TestWord *word20 = [TestWord new];
        word20.name = @"various";
        word20.detail =  @"形容詞\nさまざまな, いろいろな, 種々の\nHe decided to leave school for ___ reasons .\n彼は種々の理由で退学を決めた。\n\nいくつかの; 多くの\n\n多彩な, 多様な, 多方面の\n\n代名詞\nいくつか, 数人";
        word20.hatuon = @"véəriəs";
        word20.reibun = @"He decided to leave school for various reasons .";
        
        
        words = [NSMutableArray arrayWithObjects:
                 word1, word2, word3, word4, word5, word6, word7, word8, word9, word10, word11, word12, word13,
                 word14, word15, word16, word17, word18, word19, word20, nil];
    }
    
    if ( [wordNo isEqualToString:@"22"]){
        TestWord *word21 = [TestWord new];
        word21.name = @"actual";
        word21.detail =  @"形容詞\n実際の, 現実の, 実在の, 事実上の\nThis is his ___ experience.\nこれは彼が現実に経験した事だ。\n\n名詞\n実績, 実際の数字";
        word21.hatuon = @"ǽktʃu(ə)l";
        word21.reibun = @"This is his actual experience.";
        
        TestWord *word22 = [TestWord new];
        word22.name = @"amaze";
        word22.detail =  @"動詞～s/-ɪz/; ～d/-d/; ___ing\n~をびっくりさせる, 仰天させる\nI was ___d to find her there.\n彼女がそこにいることに驚いた。\n\n~ということが~を驚かす";
        word22.hatuon = @"əméɪz";
        word22.reibun = @"I was amazed to find her there.";
        
        TestWord *word23 = [TestWord new];
        word23.name = @"charge";
        word23.detail =  @"動詞～s/-ɪz/; ～d/-d/; ___ing\n他動詞\n~を請求する\n\n~の代金を求める; ~を~の代価として請求する\n\n~を勘定に付けておく\n\nをカードのつけで買う; ~をクレジットカードで買う\n\n税を課す\n\n~を告発する\n\n~を責める, とがめる ; ~であると~を非難する\n\n~を充電する\n\n~に物を積む; ~を詰める; 水、空気を~で満たす, 飽和させる; 感情でみなぎらせる\n\n~に~するように命じる\n\n自動詞\n料金を請求する\nHow much do you ___ per unit?\n一つおいくらですか？\n\n突進する; 駆け回る\n\n名詞 複～s/-ɪz/\n料金, 使用料; 請求金額; 出費 ; クレジット, つけ; 負担, 課税金\nThe ___s for electricity and gas will be increased next year.\n電気代とガス代は来年値上がりする。\n\n責任, 義務; 世話, 看護; 監督, 管理\n\n告発, 告訴; 嫌疑\n\n非難\n\n攻撃, 進撃\n\n充電, 荷電; 電荷\n\n装薬; 弾薬筒; 砲弾; 力の蓄積, 迫力";
        word23.hatuon = @"tʃɑːrdʒ";
        word23.reibun = @"How much do you charge per unit.     The charges for electricity and gas will be increased next year.";
        
        TestWord *word24 = [TestWord new];
        word24.name = @"comfort";
        word24.detail =  @"名詞 複～s/-ts/\n快適さ, 心地よさ, 安楽, 気楽\nThe dress is carefully styled for maximum ___.\nその服は最大限の快適さの為に入念に設計された。\n\n慰め, 心のやすらぎ, 安心感\n\n慰めとなる事[物, 人]; 安心を与える\n\n日常生活を楽に[快適に]してくれる物, 便利な品\n\n動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\nを慰める, 元気づける; ~をなだめる";
        word24.hatuon = @"kʌ́mfərt";
        word24.reibun = @"The dress is carefully styled for maximum comfort.";
        
        TestWord *word25 = [TestWord new];
        word25.name = @"contact";
        word25.detail =  @"名詞 複～s/-ts/\n連絡, 交渉; 出会い; 親密な交際, 親交, 付き合い\nI finally made ___ with her in Paris.\nパリでやっと彼女と連絡が取れた。\n\n接触, 触れること\n\n縁故, つて, コネ; 仲介役, 橋渡しとなる人\n\n動詞\n他動詞\n~と連絡をとる";
        word25.hatuon = @"kɑ́ntækt|kɔ́n-";
        word25.reibun = @"I finally made contact with her in Paris.";
        
        TestWord *word26 = [TestWord new];
        word26.name = @"customer";
        word26.detail =  @"名詞 複～s/-z/\n客, 顧客, 取引先\nThat shopkeeper cheats his ___s.	\nその店主は客を騙す。";
        word26.hatuon = @"kʌ́stəmər";
        word26.reibun = @"That shopkeeper cheats his customers.";
        
        TestWord *word27 = [TestWord new];
        word27.name = @"deliver";
        word27.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\n~を配達する, 届ける; ~を伝える; ~を送り届ける\nNobody will ___ the message.\n誰もそのメッセージを送らないだろう。\n\n~を果たす, 実行する; ~を達成する; ~を提供する\n\n出産する\n\n~を下す; 警告を与える\n\n自動詞\n配達する, 届ける";
        word27.hatuon = @"dɪlɪ́vər";
        word27.reibun = @"Nobody will deliver the message.";
        
        TestWord *word28 = [TestWord new];
        word28.name = @"earn";
        word28.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\n~を得る, 稼ぐ, もうける\nHe has ___ed a lot of money in this month.\n彼は今月沢山のお金を稼いでいる。\n\n利益、利子を生む, もたらす\n\n名声、評判を得る, 獲得する\n\n自動詞\n金を稼ぐ, 生計を立てる";
        word28.hatuon = @"əːrn";
        word28.reibun = @"He has earned a lot of money in this month.";
        
        TestWord *word29 = [TestWord new];
        word29.name = @"gate";
        word29.detail =  @"名詞 複～s/-ts/\n門, 通用門, 出入口; 扉; 道, 手段\nThe ___ is too narrow for a car.\nその門は車が通るには狭すぎる。\n\n搭乗口, ゲート\n\n解雇, 拒絶";
        word29.hatuon = @"ɡeɪt";
        word29.reibun = @"The gate is too narrow for a car.";
        
        TestWord *word30 = [TestWord new];
        word30.name = @"include";
        word30.detail =  @"動詞～s/-dz/; ～d/-ɪd/; ___ing\n他動詞\nを含む, 含んでいる; ~することを含む\nIs service ___d in the blil?\n勘定書にサービス料は含まれていますか？\n\n~を含める, 入れる ";
        word30.hatuon = @"ɪnklúːd";
        word30.reibun = @"Is service included in the blil?";
        
        TestWord *word31 = [TestWord new];
        word31.name = @"manage";
        word31.detail =  @"動詞～s/-ɪz/; ～d/-d/; ___ing\n他動詞\nどうにか~する; ものの見事に~する; ~をなし遂げる, やってのける; 表情、言葉を無理に見せる[発する]\n\n~にうまく対処する; 時間、金の都合をつける\n\n~をうまく使う, 活用する\n\n~を運営する, 経営する; ~を管理する; ~を監督[指揮]する; ~のマネージャーをする; ~をきれいにしておく\nHe ___d the company when his father was away.\n父が離れた時、彼がその会社を経営した。\n\n~をうまく処理する; ~を使いこなす; ~をうまく扱う, あやつる\n\n自動詞\nなんとかできる, どうにかする\n\nどうにか暮らしていく\n\n経営する, 管理する; 監督を務める";
        word31.hatuon = @"mǽnɪdʒ";
        word31.reibun = @"He managed the company when his father was away.";
        
        TestWord *word32 = [TestWord new];
        word32.name = @"mystery";
        word32.detail =  @"名詞 複-ies/-z/\nなぞ, 不可解な物[事]; なぞの\nWhy he went there is a ___ to me.\n彼がなぜそこに行ったのか私には謎だ。\n\nなぞ, 不可解[不思議]さ\n\nミステリー作品, 推理もの; ミステリー[推理もの]の";
        word32.hatuon = @"mɪ́st(ə)ri";
        word32.reibun = @"Why he went there is a mystery to me.";
        
        TestWord *word33 = [TestWord new];
        word33.name = @"occur";
        word33.detail =  @"動詞～s/-z/; ～red/-d/; ～ring\n自動詞\n起こる, 発生する, 生じる\nA connection error might ___.\n接続エラーが起きるかもしれない。\n\n存在する, 見られる\n\n考えが浮かぶ; ~という考えが思い浮かぶ";
        word33.hatuon = @"əkə́ːr";
        word33.reibun = @"A connection error might occur.";
        
        TestWord *word34 = [TestWord new];
        word34.name = @"opposite";
        word34.detail =  @"形容詞\n正反対の, 逆の\nShe hurried away in the ___ direction.\n彼女は急いで反対方向に立ち去った。\n\n反対側の; 向き合った; 向かいの\n\n名詞 複～s zɪts\n正反対の人[物, 事]; 反意語\n\n前置詞\n~の向かい側に, ~に向き合って\n\n~の相手役で";
        word34.hatuon = @"ɑ́pəzɪt, -sɪt|ɔ́pəzɪt, -sɪt";
        word34.reibun = @"She hurried away in the opposite direction.";
        
        TestWord *word35 = [TestWord new];
        word35.name = @"plate";
        word35.detail =  @"名詞 複～s/-ts/\n皿, 取り皿\nHe put the apples on a round ___.\n彼は丸いお皿にリンゴを置いた。\n\n板, 金属板; 表示板, 看板, 表札, ナンバープレート\n\n地球表面のプレート, 殻板\n\n金[銀]めっきをした板; 金[銀]食器\n\n動詞\n他動詞\nめっきを施される";
        word35.hatuon = @"pleɪt";
        word35.reibun = @"He put the apples on a round plate.";
        
        TestWord *word36 = [TestWord new];
        word36.name = @"receive";
        word36.detail =  @"動詞～s/-z/; ～d/-d/; ___ing\n他動詞\n~を受け取る, 受領する\n\n支持、注目を集める; 教育、待遇を受ける\n\n手紙、電話を受け取る, 情報を受ける\nI was on vacation last week and didn't ___ your e-mail.\n先週は休暇中でメールを受け取っていなかった。\n\nけが、損害をこうむる; 重みを支える\n\n治療を受ける\n\n受け入れられる, 迎えられる; 考えがみなされる\n\nを迎え入れる\n\nを受信する\n\n~が無線で聞こえる";
        word36.hatuon = @"rɪsíːv";
        word36.reibun = @"I was on vacation last week and didn't receive your e-mail.";
        
        TestWord *word37 = [TestWord new];
        word37.name = @"reward";
        word37.detail =  @"名詞 複～s/-dz/\nほうび, 報酬, 報奨, 報い\nYou have received a just ___.\nあなたは当然の報酬を受け取っている。\n\n謝礼金, 懸賞金\n\n動詞\n他動詞\n~に報酬を与える, 謝礼する, 償う";
        word37.hatuon = @"rɪwɔ́ːrd";
        word37.reibun = @"You have received a just reward.";
        
        TestWord *word38 = [TestWord new];
        word38.name = @"set";
        word38.detail =  @"動詞～s/-ts/; ～; ～ting\n他動詞\n置く, 並べる, 立てかける\n\n埋め込まれている\n\n位置している\n\n~を配置する; ~を配属する\n\n~に~させる; ~し始める, ~しようと努める\n\n食卓の用意をする\n\n~を作る, ~を打ち立てる, 確立する; ~を示す\n\n~を合わせる; ~を設定する\n\n~が設定される\n\n日時、価格、目標を決める; 規則、基準、条件、制限を定める\nHow do we ___ the enrollment criteria?\n入学基準はどう設定しますか？\n\n~を考える\n\n~を集中させる; ~を向ける\n\n骨を接ぐ, 整骨する, 固定する\n\n髪を整える, セットする\n\n~を課す, 制限を設ける; ~するよう自分に目標を課す\n\n課題を出す; 問題を書く; ~を指定する\n\n価値を置く; ~を見積もる, 評価する\n\n火をつける\n\n自動詞\n~が固まる; ~が固着する, 染みつく\n\n太陽、月が沈む\n\n名詞 複～s/-ts/\nひとそろいの~, ~のセット, ~一式\nThese ___s of machines are out of date.\nこの機械一式は時代遅れだ。\n\nひとそろい, ひと組\n\nヘッドホン装置\n\n撮影現場\n\n大道具, 舞台装置, セット\n\n髪のセット\n\n形容詞\nあらかじめ決められた, 定められた; 規定どおりの\n\n~に反対しようと; ~を心に決めている\n\n不変の, 固定した; 決意の固い; 頑固な, 変える意志を持たない\n\n用意ができている\n\n~しそうである\n\n~が固まって";
        word38.hatuon = @"set";
        word38.reibun = @"How do we set the enrollment criteria.     These sets of machines are out of date.";
        
        TestWord *word39 = [TestWord new];
        word39.name = @"steal";
        word39.detail =  @"動詞～s/-z/; ___ole/stoʊl/; ___olen/stóʊl(ə)n/; ～ing\n盗む; 盗用する\nHe was sent into prison for ___ing.\n彼は窃盗で監獄に送られた。\n\nこっそり盗み見、キスをする; ~をこっそり動かす\nHe ___ole a glance at the pretty girl across the table.\n彼はテーブルの向こうにいるかわいい女の子を一目盗み見た。";
        word39.hatuon = @"stiːl";
        word39.reibun = @"He was sent into prison for stealing.     He stole a glance at the pretty girl across the table.";
        
        TestWord *word40 = [TestWord new];
        word40.name = @"thief";
        word40.detail =  @"名詞 複___ves/θiːvz/\n泥棒, こそどろ\nThe ___ was confined in a prison.\n泥棒は監獄に拘禁された。";
        word40.hatuon = @"θiːf";
        word40.reibun = @"The thief was confined in a prison.";
		
        words = [NSMutableArray arrayWithObjects:
                 word21, word22, word23, word24, word25,
                 word26, word27, word28, word29, word30, word31, word32, word33, word34, word35, word36, word37,
                 word38, word39, word40, nil];
    }
    
    if ( [wordNo isEqualToString:@"23"]){
        TestWord *word41 = [TestWord new];
        word41.name = @"advance";
        word41.detail =  @"名詞 複～s/-ɪz/\n発展, 進歩, 進展, 革新; 発展した~\nThere have been great ___ in medicine in the past decade.\n過去十年間で医学は大きな進歩を遂げた。\n\n前進; 進軍\n\n前払い金, 前貸し, 前渡し\n\n値上がり\n\n形容詞\n事前の, 前もっての\n\n前売り切符, 先行販売、購入\n\n動詞～s/-ɪz/; ～d/-t/; advancing\n他動詞\n~を促進する, 推進する, 利益、経済を増進させる\n\n自動詞\n前進する, 進む, 迫る\n\n進軍する, 進撃する\n\n終わりの方まで進む, 進行する\n\n昇進する";
        word41.hatuon = @"ədvǽns|-vɑ́ːns";
        word41.reibun = @"There have been great advance in medicine in the past decade.";
        
        TestWord *word42 = [TestWord new];
        word42.name = @"athlete";
        word42.detail =  @"名詞 複～s/-ts/\n運動[スポーツ]選手\nThe ___ is suffering from muscular strain.\nそのスポーツ選手は筋肉の緊張に苦しんでいる。\n\nスポーツマン, 運動の得意な人";
        word42.hatuon = @"ǽθliːt";
        word42.reibun = @"The athlete is suffering from muscular strain.";
        
        TestWord *word43 = [TestWord new];
        word43.name = @"average";
        word43.detail =  @"形容詞\n平均の\nThe ___ age of the boys in this class is fifteen.\nこのクラスの少年の平均年齢は15歳です。\n\n平均的な, 並みの, 標準的な, まあまあの; たいしたことのない\n\n名詞 複～s/-ɪz/\n平均(値), アベレージ \n\n標準, 並み\n\n動詞\n他動詞\n平均して~をする, 平均すると~になる\n\n自動詞\n平均して~になる, 結局~という平均的な線落ち着く; 平均すればほぼ同じ(量)になる";
        word43.hatuon = @"ǽv(ə)rɪdʒ";
        word43.reibun = @"The average age of the boys in this class is fifteen.";
        
        TestWord *word44 = [TestWord new];
        word44.name = @"behavior";
        word44.detail =  @"名詞\nふるまい, 行動, 行儀, 挙動; 態度; 習性, 行動\nHis strange ___ made the police suspicious.\n彼のおかしな行動で警察官に疑われた。";
        word44.hatuon = @"bɪhéɪvjər";
        word44.reibun = @"His strange behavior made the police suspicious.";
        
        TestWord *word45 = [TestWord new];
        word45.name = @"behind";
        word45.detail =  @"前置詞\nの後ろに, 背後に, 向こうに\n\n~よりも劣って, 遅れをとって; ~にリードされて\nYou'll lag ___ if you don't study harder.\nもっと勉強しないと遅れをとるだろう。\n\nの背後[背景]で, ~の責任を負って\n\n~を支持[支援]して, ~の後ろ盾となって\n\n~にとっては過去のもので\n\n~という実績をもっている\n\n感情、特質が表現、外見に隠れて, ~の裏[下]に\n\n副詞\n後ろに, 背後に\n\n劣って, 遅れをとって; 支払いが滞って; リードされて; ~だけ遅れて\n\n出来事の後に残って";
        word45.hatuon = @"bɪháɪnd";
        word45.reibun = @"You'll lag behind if you don't study harder.";
        
        TestWord *word46 = [TestWord new];
        word46.name = @"course";
        word46.detail =  @"名詞 複～s/-ɪz/\n進路, 進む方向\n\n進行, 成り行き, 経過\n\n方針, 道, 方向\n\nコース, 課程, 連続講座\nShe took a ___ in philosophy.\n彼女は哲学の授業をとった。\n\nコース料理の1品, 1皿\n\nコース, 走路\n\n動詞\n自動詞\n涙、血液が勢いよく流れる";
        word46.hatuon = @"kɔːrs";
        word46.reibun = @"She took a course in philosophy.";
        
        TestWord *word47 = [TestWord new];
        word47.name = @"lower";
        word47.detail =  @"形容詞\n低い方の, 下部の\n\n下級の, 下層の; 下位の, 下等の\nHe belongs to the ___ middle class.\n彼は下層中流階級に属する。\n\n下流の; 南部の\n\nより少ない\n\n動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\n~を下ろす; ~を下に向ける; ~の位置を低くする; 身を沈める\n\n~を下げる, 落とす, 低下させる, 安くする\n\n自動詞\n~が下がる, 落ちる, 低下する, 下落する, 安くなる, 弱まる; 減る";
        word47.hatuon = @"lóʊər";
        word47.reibun = @"He belongs to the lower middle class.";
        
        TestWord *word48 = [TestWord new];
        word48.name = @"match";
        word48.detail =  @"名詞 複～es/-ɪz/\n試合, 競技, 勝負\nThe cricket ___ is being sponsored by a cigarette company.\nそのクリケットの試合はタバコ会社がスポンサーを務めている。\n\n好敵手, 競争相手; 対等の相手\n\n釣り合った~; 似合うもの; 一致\n\nそっくりな~\n\n動詞～es/-ɪz/; ～ed/-t/; ～ing\n他動詞\n~に合う, 調和する\n\n~と一致する; ~と合う; ~と同じである\n\n~を組み合わせる, 引き合わせる, 適合させる\n\n~に匹敵する, ~と対等である\n\n~に見合う; ~に適したものにする\n\n~と同額を支払う\n\n自動詞\n調和する, 似合う\n\n合う; ~が一致する";
        word48.hatuon = @"mætʃ";
        word48.reibun = @"The cricket match is being sponsored by a cigarette company.";
        
        TestWord *word49 = [TestWord new];
        word49.name = @"member";
        word49.detail =  @"名詞 複～s/-z/\nメンバー, 会員, 部員, 社員; ~に加盟している\nHe declared himself a ___ of their party.\n彼はその政党の一員であると言明した。\n\n一員; 同類の一種, 同じ仲間の1つ";
        word49.hatuon = @"mémbər";
        word49.reibun = @"He declared himself a member of their party.";
        
        TestWord *word50 = [TestWord new];
        word50.name = @"mental";
        word50.detail =  @"形容詞\n知能の, 知力の, 知的な\n\n精神の, 心の\nWe should pay more attention to our ___ health.\n私達はもっと精神上の健康に注意を払うべきだ。\n\n頭の中の, そらでする; 観念的な\n\n精神病の";
        word50.hatuon = @"mént(ə)l";
        word50.reibun = @"We should pay more attention to our mental health.";
        
        TestWord *word51 = [TestWord new];
        word51.name = @"passenger";
        word51.detail =  @"名詞 複～s/-z/\n乗客, 旅客; 乗客用の; 助手席の\nThe mysterious woman ___ vanished.\nその謎めいた乗客の女性は突然姿を消した。";
        word51.hatuon = @"pǽsɪn(d)ʒər";
        word51.reibun = @"The mysterious woman passenger vanished.";
        
        TestWord *word52 = [TestWord new];
        word52.name = @"personality";
        word52.detail =  @"名詞 複-ties/-z/\n人格, 人柄, 性格; 個性, 人間的魅力\nHis ___ comes through in his writing.\n彼の個性を体現した文章。\n\n個性のある人; 名士, 有名人";
        word52.hatuon = @"pə̀ːrsənǽləti";
        word52.reibun = @"His personality comes through in his writing.";
        
        TestWord *word53 = [TestWord new];
        word53.name = @"poem";
        word53.detail =  @"名詞 複～s/-z/\n詩, 詩歌";
        word53.hatuon = @"póʊəm";
        word53.reibun = @"";
        
        TestWord *word54 = [TestWord new];
        word54.name = @"pole";
        word54.detail =  @"名詞 複～s/-z/\n棒, 柱, さお; 電柱\nHe had put up a basket on a ___ in the back yard.\n彼は裏庭の柱にバスケットゴールのネットを取り付けた。";
        word54.hatuon = @"poʊl";
        word54.reibun = @"He had put up a basket on a pole in the back yard.";
        
        TestWord *word55 = [TestWord new];
        word55.name = @"remove";
        word55.detail =  @"動詞～s/-z/; ～d/-d/; ___ing\n他動詞\n取り去る, 移動する, 撤去する\n\n~を取り除く, 除去する; しみ、汚れを落とす\nHe ___d the mud from his shoes.\n彼は靴の泥を落とした。\n\n~から降ろす, 解雇する, 解任する\n\n名詞\n距離, 隔たり, 程度";
        word55.hatuon = @"rɪmúːv";
        word55.reibun = @"He removed the mud from his shoes.";
        
        TestWord *word56 = [TestWord new];
        word56.name = @"safety";
        word56.detail =  @"名詞 複-ties/-z/\n安全, 無事\n\n安全性, 保全; 安全確保の, 事故防止の\nThe ___ of the ship is the captain's responsibility.\nその船の安全確保は船長の責任だ。\n\n安全な場所";
        word56.hatuon = @"séɪfti";
        word56.reibun = @"The safety of the ship is the captain's responsibility.";
        
        TestWord *word57 = [TestWord new];
        word57.name = @"shoot";
        word57.detail =  @"動詞～s/-ts/; ___ot/ʃɑt|ʃɔt/; ～ing\n他動詞\n~を撃つ, 撃って傷つける, 撃ち殺す\nHe ___ot the bird with his gun.\n彼は銃で鳥を撃ち落とす。\n\n~を撃つ; ~を発射[発砲]する, ~を射る;~を発射する\n\n~をすばやく動かす,~を突き出す; ~を打ち上げる\n\n質問、視線を向ける\n\n~の写真をとる; 撮影する\n\nシュートする\n\n~をほうり出す[投げる] ; 機会を捨てる\n\n自動詞\n撃つ, 射撃する; 発射する\n\n狩猟をする; 銃猟をする\n\n飛び出す; 突き進む; 噴き出す\n\n痛みが急激に鋭く襲う \n\n子供が短期間でぐんぐん伸びる[育つ], 大きくなる; 物価が急に上がる[増加する]; 芽が出る\n\n名詞\n新芽; 若葉; 若枝\n\n撮影";
        word57.hatuon = @"ʃuːt";
        word57.reibun = @"He shot the bird with his gun.";
        
        TestWord *word58 = [TestWord new];
        word58.name = @"sound";
        word58.detail =  @"名詞 複～s/-dz/\n音, 音響; 物音; 音波\nI caught a curious ___ in the neighboring room.\n隣の部屋から変な音が聞こえた。\n\n音声;音量\n\nサウンド\n\n印象, 調子, 響き\n\n動詞～s/-dz/; ～ed/-ɪd/; ～ing\n自動詞\n~に聞こえる, 響く\n\n鳴る, 響く\n\n~を鳴らす, ~の音を立てる\n\n~を音で知らせる; 警告を発する\n\n発音される";
        word58.hatuon = @"saʊnd";
        word58.reibun = @"I caught a curious sound in the neighboring room.";
        
        TestWord *word59 = [TestWord new];
        word59.name = @"swim";
        word59.detail =  @"動詞～s/-z/; ___am/swæm/; ___um; ～ming\n自動詞\n泳ぐ, 水泳する\nLet's go ___ming.\n泳ぎに行こう。\n\nつかっている ; あふれている\n\nくらくらする; ぐるぐる回って見える\n\nなめらかに動く\n\n他動詞\n~で泳ぐ; 競泳に参加する\n\n~を泳ぐ, 泳ぎ渡る\n\n名詞 複～s/-z/\nひと泳ぎ, 水泳; 泳ぐ時間";
        word59.hatuon = @"swɪm";
        word59.reibun = @"Let's go swimming.";
        
        TestWord *word60 = [TestWord new];
        word60.name = @"web";
        word60.detail =  @"名詞 複～s/-z/\n情報通信網, ウェブ\n\n複雑に交錯した~; 絡み合った~\n\nクモの巣; クモの巣状のもの\nA spider weaves a ___ to catch prey.\nクモは捕食の為にクモの巣を張った。";
        word60.hatuon = @"web";
        word60.reibun = @"A spider weaves a web to catch prey.";
		
        words = [NSMutableArray arrayWithObjects:
                 word41, word42, word43, word44, word45, word46, word47, word48, word49,
                 word50, word51, word52, word53, word54, word55, word56, word57, word58, word59, word60, nil];
    }
    
    if ( [wordNo isEqualToString:@"24"]){
        TestWord *word61 = [TestWord new];
        word61.name = @"block";
        word61.detail =  @"名詞 複～s/-s/\nかたまり; 角材; ブロック\n\n街区, ブロック\n\n大型ビル, 建物\n\n一区画, 一部分; ひとまとまり, ひと区切り\n\n流れを止めているもの, 障害物; 一時的に思考が停止した状態\nThere is a ___ in the pipe and the water can not flow away.\nパイプの中に何かが詰まっていて水が流れない。\n\n動詞～s/-s/; ～ed/-t/; ～ing\n他動詞\n~をせき止める, ふさぐ, 遮断する, ~の流れを止める\n\n~を阻止する; ~が~するのを阻む\n\n~をさえぎる";
        word61.hatuon = @"blɑk|blɔk";
        word61.reibun = @"There is a block in the pipe and the water can not flow away.";
        
        TestWord *word62 = [TestWord new];
        word62.name = @"cheer";
        word62.detail =  @"名詞 複～s/-z/\n歓呼, 喝采, 万歳; 声援\nThe audience gave a great ___ when he scored.\n観客は彼が得点した時に大きな歓声をあげた。\n\n励まし, 慰め\n\n動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\n~を励ます, 元気づける, 慰める ; ~を明るくする\n\n自動詞\n喜ぶ, 元気づく\n\n 歓呼する, 声援を送る, 喝采する";
        word62.hatuon = @"tʃɪər";
        word62.reibun = @"The audience gave a great cheer when he scored.";
        
        TestWord *word63 = [TestWord new];
        word63.name = @"complex";
        word63.detail =  @"形容詞more ～; most ～\n複雑な, 複雑で理解しづらい, 込み入った\nIt was a ___ problem.\nこれは複雑な問題だった。\n\n複合的な, 多くの部分から成る\n\n名詞 複～es/-ɪz/\n複合[大型]ビル; ビル群\n\nコンプレックス; 固定観念, 強迫観念 ";
        word63.hatuon = @"kɑ̀mpléks|kɔ́mpleks";
        word63.reibun = @"It was a complex problem.";
        
        TestWord *word64 = [TestWord new];
        word64.name = @"critic";
        word64.detail =  @"名詞 複～s/-s/\n批評家, 評論家\nHave you read the article written by that famous ___?\nあの有名な評論家が書いた記事は読んだ事がありますか？\n\n批判[酷評]する人, あら探しをする人";
        word64.hatuon = @"krɪ́tɪk";
        word64.reibun = @"Have you read the article written by that famous critic?";
        
        TestWord *word65 = [TestWord new];
        word65.name = @"event";
        word65.detail =  @"名詞 複～s/-ts/\n出来事, 事件\nNext day the newspapers reported the ___.\n翌日新聞はその事件を報道した。\n\n行事, 催し物, イベント\n\n種目, 競技, 試合";
        word65.hatuon = @"ɪvént";
        word65.reibun = @"Next day the newspapers reported the event.";
        
        TestWord *word66 = [TestWord new];
        word66.name = @"exercise";
        word66.detail =  @"名詞\n運動, 体を動かすこと; 体操\nI suggest you go on a diet and take more ___.\n節食してもっと運動する事を勧めます。\n\n練習, 訓練, けいこ; 練習問題, 練習曲, 課題; 習作\n\n行為, 活動\n\n動詞～s/-ɪz/; ～d/-d/; -cising\n自動詞\n運動をする, 練習をする\n\n他動詞\n~を鍛える; ~を運動させる";
        word66.hatuon = @"éksərsàɪz";
        word66.reibun = @"I suggest you go on a diet and take more exercise.";
        
        TestWord *word67 = [TestWord new];
        word67.name = @"fit";
        word67.detail =  @"動詞～s/-ts/; ～ted/-ɪd/ ～ting\n他動詞\nぴったり合う, 適合する\n\n取り付ける, 備え付ける\n\nはめこむ, 差し込む\n\n一致する, 適合する, ふさわしい\n\n仮縫いをしてもらう\n\n自動詞\nぴったり合う, 調和する; 収まる\n\n合う, なじむ\n\n形容詞～ter; ～test\n適した, ぴったりの\nThe room is a ___ place for study.\nその部屋は勉強に適している。\n\n適任の, ふさわしい\n\n準備ができて\n\n体調がよい, 健康な, 丈夫な";
        word67.hatuon = @"fɪt";
        word67.reibun = @"The room is a fit place for study.";
        
        TestWord *word68 = [TestWord new];
        word68.name = @"friendship";
        word68.detail =  @"名詞 複～s/-s/\n友人関係, 友達付き合い\n\n友情, 親睦\nReal ___ is more valuable than money.\n本物の友情は金銭より大切だ。\n\n友好関係";
        word68.hatuon = @"frén(d)ʃɪ̀p";
        word68.reibun = @"Real friendship is more valuable than money.";
        
        TestWord *word69 = [TestWord new];
        word69.name = @"guide";
        word69.detail =  @"名詞 複～s/-dz/\n案内人, ガイド\nI know the place well, so let me be your ___.\nその場所をよく知っているから案内するよ。\n\n指導者, 助言者\n\n案内書, 指導[手引き, 入門]書; 観光ガイドブック\n\n指針, 指導方針, 判断基準, 目安 ; 道しるべ, 道標\n\n動詞～s/-dz/; ～d/-ɪd/; ___ing\n他動詞\n~を案内する, 導く; ~を連れていく, 誘導する, 動かす\n\n~を指導する\n\n~に影響を及ぼす, 指針を示す";
        word69.hatuon = @"ɡaɪd";
        word69.reibun = @"I know the place well, so let me be your guide.";
        
        TestWord *word70 = [TestWord new];
        word70.name = @"lack";
        word70.detail =  @"副詞\n名詞 複～s/-s/\n不足, 欠乏; 十分ないこと\nHer decision seems to show a ___ of political judgement.\n彼女の決定はどうやら政治的判断力の不足を露呈したようだ。\n\n動詞～s/-s/; ～ed/-t/; ～ing\n他動詞\n~を欠いている\n\n自動詞\n不足している";
        word70.hatuon = @"læk";
        word70.reibun = @"Her decision seems to show a lack of political judgement.";
        
        TestWord *word71 = [TestWord new];
        word71.name = @"passage";
        word71.detail =  @"名詞 複～s/-ɪz/\n通路, 通り道; 出入口, ホール\nWe discovered a secret ___ behind the wall.\n壁の後ろに秘密通路を発見した。\n\n通行許可; 抜け道, 行く手\n\n一節; 一句; 引用部\n\n通過, 可決\n\n発展, 成長, 進歩\n\n体内で気体、液体が通る管";
        word71.hatuon = @"pǽsɪdʒ";
        word71.reibun = @"We discovered a secret passage behind the wall.";
        
        TestWord *word72 = [TestWord new];
        word72.name = @"perform";
        word72.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\n~を上演する, ~を演奏する, ~を演じる\n\n仕事、手術、実験を行う, 機能、義務を果たす, 儀式を行う\nThey always ___ their duties faithfully.\n彼らはいつも忠実に職務を全うする。\n\n自動詞\n上演する, 演奏する\n\nうまくいく, 調子よく機能する";
        word72.hatuon = @"pərfɔ́ːrm";
        word72.reibun = @"They always perform their duties faithfully.";
        
        TestWord *word73 = [TestWord new];
        word73.name = @"pressure";
        word73.detail =  @"名詞 複～s/-z/\n圧力, 強制\n\n重圧, 重荷\nThe ___ of work was too great for him.\n彼にその仕事のプレッシャーは大き過ぎた。\n\n切迫, 窮迫, 切迫\n\n圧迫 ; 圧縮, 圧搾\n\n動詞\n他動詞\n圧力をかける, 強要する";
        word73.hatuon = @"préʃər";
        word73.reibun = @"The pressure of work was too great for him.";
        
        TestWord *word74 = [TestWord new];
        word74.name = @"probable";
        word74.detail =  @"形容詞more ～; most ～\n十分ありそうな, 起こりそうな, 有望な\nIt is ___ to finish the job before dark.\n恐らく暗くなる前にその仕事を終わらせる事が出来る。";
        word74.hatuon = @"prɑ́bəb(ə)l|prɔ́b-";
        word74.reibun = @"It is probable to finish the job before dark.";
        
        TestWord *word75 = [TestWord new];
        word75.name = @"public";
        word75.detail =  @"形容詞\n民衆の, 大衆の, 庶民の\n\n公の, 公衆の, 公共の; 公立の\nThe town has ___ library and ___ gardens.\nその町は公共の図書館と公園がある。\n\n公的な, 政府の, 官公庁の, 公務員の\n\n広く知られた, 公然の, 有名な\n\n人目につく, 人の多い\n\n名詞\n大衆, 庶民, 一般の人々\n\n人々, ~層; ファン, 愛読者";
        word75.hatuon = @"pʌ́blɪk";
        word75.reibun = @"The town has public library and public gardens.";
        
        TestWord *word76 = [TestWord new];
        word76.name = @"strike";
        word76.detail =  @"動詞～s/-s/; struck/strʌk/; striking\n他動詞\n~をぶつける; 当てる; ~にぶつかる, 当たる\n\nマッチをすって火をつける\n\n雷が~に落ちる, ~を打つ\n\n病気、災難が~を襲う\n\n時刻を打つ, 鳴らす\n\n~の心に浮かぶ\n\n~の心を打つ, ~を驚かせる, ~に感銘を与える\n\n~であると思わせる; 目に付く\n\n~を表明する\n\n驚いて~になる; 非常に驚く\n\n~を掘り当てる, ~に偶然行き当たる\n\n釣り合いをとる\n\n取引をする\n\n光が~に当たる\n\nポーズをとる\n\n~をたたむ, 降ろす\n\n自動詞\nストライキをする\n\n雷が落ちる\n\n突然襲いかかる, 打撃を与える\n\n~が突然襲う, 起こる\n\n打つ, たたく\n\n名詞複～s/-s/\nストライキ, 同盟罷業\nThe ___ has delivered a heavy blow to the management.\nそのストライキは経営者側に大きな打撃を与えた。\n\n攻撃\n\n石油を掘り当てること";
        word76.hatuon = @"straɪk";
        word76.reibun = @"The strike has delivered a heavy blow to the management.";
        
        TestWord *word77 = [TestWord new];
        word77.name = @"support";
        word77.detail =  @"動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n支持する, 支援[後援]する\nWill you use your influence to prevail upon them to ___ the suggestion?\nあなたの影響力でその提案を支持するように彼らを説得してくれませんか？\n\n支える; 倒れないでいる \n\n~を扶養する; 資金面で団体、催しを援助[支援]する\n\n~を精神的に支える, 元気づける\n\n~を養う, はぐくむ\n\n~をサポートする\n\n~を支持[立証]する, ~の根拠を与える\n\n~のファンである, ~を応援する.\n\n名詞 複～s/-ts/\n支持, 支援, 後援\n\n精神的な支え; 経済的な援助, 支援\n\n 裏付け, 根拠\n\n支え, 支柱, 土台\n\nサポート";
        word77.hatuon = @"səpɔ́ːrt";
        word77.reibun = @"Will you use your influence to prevail upon them to support the suggestion?";
        
        TestWord *word78 = [TestWord new];
        word78.name = @"task";
        word78.detail =  @"名詞 複～s/-s/\n仕事, 任務, 課業, 作業\nIt's a laborious ___.\nそれは困難な仕事だ。";
        word78.hatuon = @"tæsk|tɑːsk";
        word78.reibun = @"It's a laborious task.";
        
        TestWord *word79 = [TestWord new];
        word79.name = @"term";
        word79.detail =  @"名詞 複～s/-z/\n専門用語, 術語; 言い方, 言葉遣い; ~を表す言葉\n\n学期; 夏秋春の3期\nAre there any exams at the end of this ___?\n当学期末にテストはありますか？\n\n任期, 在職期間\n\n刑期\n\nローン契約の期間; 契約の満期; 開廷期間; 出産予定日, 臨月\n\n条件, 条項; 価格\n\n間柄, 関係; ~な関係にある\n\n動詞\n他動詞\n~と呼ばれる, 称される";
        word79.hatuon = @"təːrm";
        word79.reibun = @"Are there any exams at the end of this term?";
        
        TestWord *word80 = [TestWord new];
        word80.name = @"unite";
        word80.detail =  @"動詞～s/-ts/; ～d/-ɪd/; ___ing\n他動詞\n結合させる, 統合する\n\n団結させる, 結束させる\nWe must ___ as many people as possible.\nできるだけ多くの人が団結しなければならない。\n\n併せ持つ";
        word80.hatuon = @"junáɪt";
        word80.reibun = @"We must unite as many people as possible.";
		
        words = [NSMutableArray arrayWithObjects:
                 word61,
                 word62, word63, word64, word65, word66, word67, word68, word69, word70, word71, word72, word73,
                 word74, word75, word76, word77, word78, word79, word80,nil];
    }
    
    if ( [wordNo isEqualToString:@"25"]){
        TestWord *word81 = [TestWord new];
        word81.name = @"associate";
        word81.detail =  @"動詞～s/-ts/; ～d/-ɪd/; -ating\n他動詞\n~を連想する; ~と結び付けて考える, ~を連想する\nI always ___ her with roses.\n彼女と言えばいつも薔薇を思い出す。\n\n~と連合する, ~の仲間になる;~を支持する\n\n自動詞\n~と付き合う, 交際する; ~と提携する\n\n名詞/-ʃiət/複～s/-ts/\n\n仲間, 同僚; 提携者; 組合員\n\n形容詞/-ʃiət/\n準~, 副~";
        word81.hatuon = @"əsóʊʃièɪt";
        word81.reibun = @"I always associate her with roses.";
        
        TestWord *word82 = [TestWord new];
        word82.name = @"environment";
        word82.detail =  @"名詞 複～s/-ts/\n自然環境; 環境\n\n社会的な環境, 周囲の事情[状況]\nShe is not used to the new ___.\n彼女は新しい環境に慣れていない。";
        word82.hatuon = @"ɪnváɪ(ə)r(ə)nmənt";
        word82.reibun = @"She is not used to the new environment.";
        
        TestWord *word83 = [TestWord new];
        word83.name = @"factory";
        word83.detail =  @"名詞 複-ries/-z/\n工場, 製造所; 工場の\nI got a job in a textile ___.\n織物工場に仕事を見つけた。";
        word83.hatuon = @"fǽkt(ə)ri";
        word83.reibun = @"I got a job in a textile factory.";
        
        TestWord *word84 = [TestWord new];
        word84.name = @"feature";
        word84.detail =  @"名詞 複～s/-z/\n特徴, 特色, 目立つ所[部分]\nWet weather is a ___ of life in this area.\n湿っぽい天気はこの地域での生活の特徴の一つだ。\n\n特集記事, 読み物; 連載; 特別[特集]番組; 目玉商品\n\n顔の一部, 造作; 顔かたち, 目鼻だち, 容貌\n\n動詞～s/-z/; ～d/-d/; -turing/-tʃ(ə)rɪŋ/\n他動詞\n~を取り上げる, 呼び物にする, 記事[ニュース]にする, 特集する; ~を主[出]演させる";
        word84.hatuon = @"fíːtʃər";
        word84.reibun = @"Wet weather is a feature of life in this area.";
        
        TestWord *word85 = [TestWord new];
        word85.name = @"instance";
        word85.detail =  @"名詞 複～s/-ɪz/\n例, 実例, 例証; 特定の場合\nThis is only one ___ out of many.\nこれは数多くある実例の一つに過ぎない。";
        word85.hatuon = @"ɪ́nst(ə)ns";
        word85.reibun = @"This is only one instance out of many.";
        
        TestWord *word86 = [TestWord new];
        word86.name = @"involve";
        word86.detail =  @"動詞～s/-z/; ～d/-d/; ___ing\n他動詞\n~を含む, 伴う; ~を必要とする; ~に関連する; ~することを含む\nA letter of credit will ___ unnecessary extra charges.\n信用状に必要のない追加料金が含まれる。\n\n巻き込む, かかわらせる; ~に影響する\n\n参加させる, 携わらせる; 参加する, 携わる\n\n熱中する, 夢中になる";
        word86.hatuon = @"ɪnvɑ́lv|-vɔ́lv";
        word86.reibun = @"A letter of credit will involve unnecessary extra charges.";
        
        TestWord *word87 = [TestWord new];
        word87.name = @"medicine";
        word87.detail =  @"名詞 複～s/-z/\n薬, 医薬品, 薬剤\nI have a stomachache. May I have some ___?\n腹痛がします。薬を処方してくれませんか？\n\n医学, 医術; 内科; 医療";
        word87.hatuon = @"méds(ə)n, médɪ-";
        word87.reibun = @"I have a stomachache. May I have some medicine?";
        
        TestWord *word88 = [TestWord new];
        word88.name = @"mix";
        word88.detail =  @"動詞～es/-ɪz/; ～ed/-t/; ～ing\n他動詞\n~を混ぜる, 混合する, 混ぜ合わせる, かき混ぜる; 材料を混ぜ入れる\nYou can't ___ oil with water.\nオイルと水は混ぜられない。\n\n結び付ける, 組み合わせる; ~を仲間にする, 一緒にする\n\n混ぜて作る, 調合する\n\n混ぜて作ってやる, 調合してやる\n\n自動詞\n混ざる; 混合する\n\nつきあう; 出会って話す; 交際する, 仲良くやる; 参加する\n\n交じり合わない, 両立しない; 打ち解けない\n\n異種交配される\n\n名詞\n混合物, 混成, 組み合わせ; 混合比; 混乱\n\n混ぜること";
        word88.hatuon = @"mɪks";
        word88.reibun = @"You can't mix oil with water.";
        
        TestWord *word89 = [TestWord new];
        word89.name = @"organize";
        word89.detail =  @"動詞～s/-ɪz/; ～d/-d/; -izing\n他動詞\n準備する; ~を手配する, 催す\nHe was going to ___ everything properly.\n彼は全て適切に準備する予定だった。\n\n整理する, 系統立てる, まとめ上げる\n\n組織する, 編成する\n\n組織化を図る, 団結する; 心構えをする, 準備する";
        word89.hatuon = @"ɔ́ːrɡənàɪz";
        word89.reibun = @"He was going to organize everything properly.";
        
        TestWord *word90 = [TestWord new];
        word90.name = @"period";
        word90.detail =  @"名詞 複～s/-dz/\n期間, 時期; ~期間\nChildhood is a ___ of rapid growth.\n幼年期は成長が早い時期だ。\n\n発達時期[段階, 過程]/ 病気の潜伏期\n\n時代\n\n月経期間[周期]\n\n時間, 時限\n\n終止符, ピリオド\n\n終わり";
        word90.hatuon = @"píəriəd";
        word90.reibun = @"Childhood is a period of rapid growth.";
        
        TestWord *word91 = [TestWord new];
        word91.name = @"populate";
        word91.detail =  @"動詞\n他動詞\n住む, 棲息する; 登場人物が現れる\nThe cave is ___d by wolves.\nその洞窟には狼が棲息している。\n\n入植させる, 住まわせる";
        word91.hatuon = @"pɑ́pjəlèɪt|pɔ́pju-";
        word91.reibun = @"The cave is populated by wolves.";
        
        TestWord *word92 = [TestWord new];
        word92.name = @"produce";
        word92.detail =  @"動詞～s/-ɪz/; ～d/-t/; -ducing\n他動詞\n~を産み出す, ~を産出する, 生産する; ~を輩出する\nIt is certain that we shall ___ this kind of engine.\nこの種のエンジンを生産する事は確実だ。\n\n~をもたらす, ~を引き起こす\n\n~を取り出す; ~を提出する, 示す\n\n~を製造する; 映画を制作する; ~を演出する, プロデュースする, 上演する, 放送する; ~を出版する\n\n名詞/próʊdjuːs|prɔ́d-/\n生産物, 農産物, 青果物; 生産高";
        word92.hatuon = @"prədjúːs";
        word92.reibun = @"It is certain that we shall produce this kind of engine.";
        
        TestWord *word93 = [TestWord new];
        word93.name = @"range";
        word93.detail =  @"名詞 複～s/-ɪz/\n広範囲の~, 多種多様な~\n\n範囲, 幅\nThe houses are sold out within this price ___.\nその家はこの価格帯で売れた。\n\n権限、責任の及ぶ領域, 範囲\n\n種類, 品ぞろえ\n\n視力[聴力]の範囲\n\n射程距離\n\n航続距離\n\n動詞～s/-ɪz/; ～d/-d/; ranging\n自動詞\n価格、温度、程度が~に及ぶ\n\n感情、行動が~に及ぶ \n\n話、著作が~にわたる, 及ぶ";
        word93.hatuon = @"reɪn(d)ʒ";
        word93.reibun = @"The houses are sold out within this price range.";
        
        TestWord *word94 = [TestWord new];
        word94.name = @"recognize";
        word94.detail =  @"動詞～s/-ɪz/; ～d/-d/; -nizing\n他動詞\nわかる, ~を認識[判別, 識別]する\nCan you ___ her from this picture?\nこの写真から彼女が分かりますか？\n\n認める, 承認[認可]する\n\n評価される; 価値を認められる\n\n~を認める";
        word94.hatuon = @"rékəɡnàɪz";
        word94.reibun = @"Can you recognize her from this picture?";
        
        TestWord *word95 = [TestWord new];
        word95.name = @"regular";
        word95.detail =  @"形容詞more ～; most ～\n規則的な, 一定の, 均等な; 規則正しく便通[月経]がある\n\n定期的な, 定例の\nHe made a ___ visit to his parents.\n彼は定期的に両親を訪れる。\n\n常連の, よく~する; よく起こる; 頻繁な\n\n通常どおりの, いつもの\n\n均整のとれた; 等辺[等面]の, 正~形[体]の\n\n標準[レギュラー]サイズの\n\n並みの, 普通の\n\n感じのいい\n\nまぎれもない, まったくの\n\n名詞\n常連客";
        word95.hatuon = @"réɡjələr";
        word95.reibun = @"He made a regular visit to his parents.";
        
        TestWord *word96 = [TestWord new];
        word96.name = @"sign";
        word96.detail =  @"名詞 複～s/-z/\n表れ, しるし; 前兆, 兆し; 気配, 痕跡, 形跡\nThere are ___s of political unrest in the country.\nその国は政治不安の兆しが見られる。\n\n標識, 標示, 看板\n\n合図, 身ぶり; 信号, 暗号\n\n記号, 符号\n\n動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\n署名する, サインする\n\n~と署名する\n\n~と選手[労働]契約を結ぶ\n\n~ということを身ぶりで示す\n\n手話で表現する\n\n自動詞\n契約する, 調印する\n\n~するように合図する";
        word96.hatuon = @"saɪn";
        word96.reibun = @"There are signs of political unrest in the country.";
        
        TestWord *word97 = [TestWord new];
        word97.name = @"tip";
        word97.detail =  @"名詞 複～s/-s/\n先, 先端; 先端に付いているもの\n\n動詞～s; ～ped; ～ping\n他動詞\n先端が覆われる,先に付けられる\n\n名詞 複～s/-s/\nチップ, 祝儀, 心付け\nHe charged me 2000 yen for ___.\n彼はチップとして私に2000円請求した。\n\n秘訣, 助言\n\n秘密情報, 内報, 密告\n\n動詞～s; ～ped; ～ping\n他動詞\nチップをやる\n\n情報を伝える, 内報する; ~を予想する\n\n自動詞\nチップをやる";
        word97.hatuon = @"tɪp";
        word97.reibun = @"He charged me 2000 yen for tip.";
        
        TestWord *word98 = [TestWord new];
        word98.name = @"tradition";
        word98.detail =  @"名詞 複～s/-z/\n伝統, 慣習; しきたり, 長年のやり方[考え方]; 伝統的様式[流儀]\nThey decided to break with ___.\n彼らは慣習を打破する事を決めた。\n\n伝承, 言い伝え, 伝説";
        word98.hatuon = @"trədɪ́ʃ(ə)n";
        word98.reibun = @"They decided to break with tradition.";
        
        TestWord *word99 = [TestWord new];
        word99.name = @"trash";
        word99.detail =  @"名詞\nごみ, くず, がらくた\nPlease take the ___ to the garbage can.\nゴミはゴミ箱に入れてください。\n\n動詞\n壊す, むちゃくちゃにする";
        word99.hatuon = @"træʃ";
        word99.reibun = @"Please take the trash to the garbage can.";
        
        TestWord *word100 = [TestWord new];
        word100.name = @"wide";
        word100.detail =  @"形容詞～r; ～st\n幅が広い\n\n幅が~ある, ~の幅の\n\n広い, 広範な, 多岐に及ぶ; 広大な\nA ___ stretch of land spreaded in front of us.\n私達の目の前に広大な土地が広がっていた。\n\n大きい, かけ離れた\n\n幅広い, 片寄りのない; 一般的な, 大まかな \n\nゆったりとした, だぶだぶの\n\n~が大きく開いた\n\n大きくそれた, まるで見当違いの\n\n副詞～r; ～st\n広く, 広範にわたって\n\n完全に; 大きく, いっぱいに\n\nそれて, 外れて\n\n~中に, いたるところに, 全体にわたる";
        word100.hatuon = @"waɪd";
        word100.reibun = @"A wide stretch of land spreaded in front of us.";
		
        words = [NSMutableArray arrayWithObjects:
                 word81, word82, word83, word84, word85,
                 word86, word87, word88, word89, word90, word91, word92, word93, word94, word95, word96, word97,
                 word98, word99, word100, nil];
    }
    
    if ([wordNo isEqualToString:@"26"]) {
        
        TestWord *word1 = [TestWord new];
        word1.name = @"advice";
        word1.detail = @"名詞 複～s/-ɪz/\n忠告, 助言, アドバイス, 勧告\nHe disregarded his doctor's ___.\n彼は医者の忠告を無視した。\n\n通知書, 案内状; 情報, 報告";
        word1.hatuon = @"ədváɪs";
        word1.reibun = @"He disregarded his doctor's advice.";
        
        TestWord *word2 = [TestWord new];
        word2.name = @"along";
        word2.detail = @"前置詞\n~に沿って, ~づたいに, 端から端へ~をずっと\nWe walked ___ the road.\n私達はその道に沿って歩いた。\n\n~に沿って行ったところに; ~の途中に\n\n~に沿ってずっと\n\n方針、やり方に従って, 沿って\n\n副詞\n先へ, 前方へ, どんどん; 人から人へ\n\n連れて; 携えて\n\n(時間が)進んで; はかどって, 順調で\n\n沿って; ~の後ろについて";
        word2.hatuon = @"əlɔ́ːŋ|əlɔ́ŋ";
        word2.reibun = @"We walked along the road.";
        
        TestWord *word3 = [TestWord new];
        word3.name = @"attention";
        word3.detail = @"名詞 複～s/-z/\n注意; 関心; 興味\nShe soon becomes the centre of ___.\n彼女はもうすぐ注目の的となる。\n\n注目, 気付くこと\n\n配慮, 考慮; 手入れ, 修理; 治療; 世話\n\n気をつけの姿勢\n\n~宛";
        word3.hatuon = @"əténʃ(ə)n";
        word3.reibun = @"She soon becomes the centre of attention.";
        
        TestWord *word4 = [TestWord new];
        word4.name = @"attract";
        word4.detail = @"動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n興味、注意を引きつける, 呼び寄せる; 資金、援助を得る, 集める\nThe flower show ___ed large crowds this year.\n今年そのフラワーショーは多くの観衆を引きつけた。\n\n向けさせる, 誘導する";
        word4.hatuon = @"ətrǽkt";
        word4.reibun = @"The flower show attracted large crowds this year.";
        
        TestWord *word5 = [TestWord new];
        word5.name = @"climb";
        word5.detail = @"動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\n登る; ~を上る\nWe go to ___ mountains every Sunday.\n私達は毎週日曜日に山登りに行く。\n\n~を歩む, 昇進する; ~の上位に行く\n\n自動詞\n登る, よじ登る; 下りる\n\n移動する\n\nのぼる, 上昇する\n\n登り坂になる\n\nはい上がる, 巻き上がる\n\n~が上昇する\n\n昇進する, 達する; 出世する\n\n名詞\n登ること, 登山; 登る所, 斜面; 登る距離";
        word5.hatuon = @"klaɪm";
        word5.reibun = @"We go to climb mountains every Sunday.";
        
        TestWord *word6 = [TestWord new];
        word6.name = @"drop";
        word6.detail =  @"動詞～s/-s/; ～ped/-t/; ～ping\n他動詞\n落とす, 落下させる; 入れる; 視線を下げる, ふせる; ~を降ろす; 液体をしたたらせる, 滴下する\n\n体の一部を下げる\n\nなぐり倒す; 鳥を撃ち落とす; ~を殺す; 下の順位に~を落とす; ~を倒れさせる\n\n~を減らす, 下げる; スピードを落とす; 声を下げる, 落とす; 金を失う; 試合を落とす\n\nやめる, 停止する, 断念する; 訴訟を取り下げる; ~をやめる; ~との関係を絶つ, やめる; ~の履修をやめる\n\n使う予定の物を使わない; ~を没にする\n\n話、話題をやめる\n\n除外する, 除く, 排除する; ~を解雇する\n\n省略する, 省く\n\n車で連れて行き~でおろす; を返す, 返却する\n\n~を書く, 送る\n\n自動詞\n突然落ちる, 落下する; 花が散る; 液体がぽたぽた落ちる, したたる\nHe ___ped off from his bike.\n彼は自転車で転倒した。\n\nどさっと腰をおろす; 体の位置を下げる; 倒れる, ぐったりする; 死ぬ; 頭がうなだれる\n\n急に下がる, 斜面になる\n\n減少する, 下がる; 声が落ちる, 下がる\nIn the winter the temperature often ___s below freezing.\n冬は気温がよく氷点下に下がる。\n\n成績が落ちる, 後退する, 下がる\n\n話が停止する, 終わる; とだえる\n\n立ち寄る, 訪問する\n\nゆっくり移動する, 遅れる\n\n~に陥る; ~になっていく\n\n言葉がふと漏れる\n\n名詞複～s/-s/\n滴, 粒; 1粒の~\n\n少量の~\n\n減少, 落下, 下落, 低下 ; 急斜面\n\n垂直, 落下距離, 落差; 墜落, 落下\n\n雨粒状のもの; ドロップ, あめ玉; ペンダント, イヤリング, 飾り玉\n\n点眼[点鼻, 点耳]薬";
        word6.hatuon = @"drɑp|drɔp";
        word6.reibun = @"He dropped off from his bike,     In the winter the temperature often drops below freezing.";
        
        TestWord *word7 = [TestWord new];
        word7.name = @"final";
        word7.detail = @"形容詞\n最終の, 最後の; 最終結果の\nWe are all satisfied with the ___ result.\n私達は皆、最終結果に満足している。\n\n~が最終的な, 決定的な\n\n名詞 複～s/-z/\n\n決勝戦,決勝トーナメント";
        word7.hatuon = @"fáɪn(ə)l";
        word7.reibun = @"We are all satisfied with the final result.";
        
        TestWord *word8 = [TestWord new];
        word8.name = @"further";
        word8.detail = @"副詞\nさらに, もっと; よりいっそう\nOur object is to ___ strengthen friendly relations between the two countries.\n私達の目標は二国間の友好関係を一層強固にする事だ。\n\nさらに遠く\n\nさらに進んで; さらに昔に\n\n形容詞\nさらなる, それ以上の; さらに進んだ\n\nさらに遠い; 遠い方の";
        word8.hatuon = @"fə́ːrðər";
        word8.reibun = @"Our object is to further strengthen friendly relations between the two countries.";
        
        TestWord *word98 = [TestWord new];
        word98.name = @"imply";
        word98.detail =  @"動詞___ies/-z/; ___ied/-d/; ～ing\n他動詞\n~をそれとなく示す, 暗に意味する, ほのめかす; ~だとそれとなく示す\nWhat do you want to ___?\n何を暗示したいのですか？\n\n~を意味する; ~という結論になる\n\n当然必要とする, 必ず伴う[含む]";
        word98.hatuon = @"ɪmpláɪ";
        word98.reibun = @"What do you want to imply.";
        
        TestWord *word9 = [TestWord new];
        word9.name = @"maintain";
        word9.detail = @"動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\n保つ, 続ける, 持続させる\n\n保つ, 維持する\nThey also help us to ___ the machinery.\n彼らはその機械の維持管理も手伝ってくれます。\n\n整備する\n\n主張する\n\n~を扶養する, 経済的に支える; 生命を維持する\n\n~を支持する, 擁護する, 守る";
        word9.hatuon = @"meɪntéɪn, men-, mən-";
        word9.reibun = @"They also help us to maintain the machinery.";
        
        TestWord *word10 = [TestWord new];
        word10.name = @"neither";
        word10.detail = @"副詞\n~も~も~しない, ~でも~でもない\n\nも~しない\n\n形容詞\nどちらの~も~しない\n\n代名詞\nどちらも~しない\nHe tasted both cakes and said that ___ was delicious.\n彼は両方のケーキを試食したがどちらも美味しくないと言った。\n\nどちらの~も~しない";
        word10.hatuon = @"níːðər, náɪ-|náɪ-, níː-";
        word10.reibun = @"He tasted both cakes and said that neither was delicious.";
        
        TestWord *word11 = [TestWord new];
        word11.name = @"otherwise";
        word11.detail =  @"副詞\nさもないと, もしそうでなければ\nSeize the chance, ___ you'll regret it.\nチャンスは掴みなさい。そうでないと後悔しますよ。\n\nほかの点では, そのことを除けば, それ以外は\n\n形容詞\nそうでない, 別の, 違った";
        word11.hatuon = @"ʌ́ðərwàɪz";
        word11.reibun = @"Seize the chance, otherwise you'll regret it.";
        
        TestWord *word12 = [TestWord new];
        word12.name = @"physical";
        word12.detail =  @"形容詞\n体の, 身体の, 肉体の\nFor them, getting rid of heavy ___ labour is a big thing.\n彼らにとって、重労働から解放される事は大きな出来事だ。\n\n物質の, 現実の, 物理的な\n\n物理学の; 物理的な; 自然科学の; 自然法則の\n\n名詞\n健康診断";
        word12.hatuon = @"fɪ́zɪk(ə)l";
        word12.reibun = @"For them, getting rid of heavy physical labour is a big thing.";
        
        TestWord *word13 = [TestWord new];
        word13.name = @"prove";
        word13.detail =  @"動詞～s/-z/; ～d/-d/; ___ing\n他動詞\n証明する, 立証する\nThere wasn't enough evidence to ___ him guilty.\n彼が有罪である事を証明するには証拠が不十分だった。\n\n~ということを証明する\n\n~であることを示す\n\n~であることを示す, 証明する ; 有能であることを示す, 本領を発揮する\n\n自動詞\n~であるとわかる, 判明する";
        word13.hatuon = @"pruːv";
        word13.reibun = @"There wasn't enough evidence to prove him guilty.";
        
        TestWord *word14 = [TestWord new];
        word14.name = @"react";
        word14.detail =  @"動詞～s/-ts/; ～ed/-ɪd/; ～ing\n自動詞\n反応する, 対応する\nHow did they ___ to your suggestion?\nあなたの提案に対して彼らはどう反応しましたか？\n\n化学反応を起こす\n\n容態が悪くなる\n\n反抗する, 反発する\n\nはね返ってくる, 影響する";
        word14.hatuon = @"riǽkt";
        word14.reibun = @"How did they react to your suggestion.";
        
        TestWord *word15 = [TestWord new];
        word15.name = @"ride";
        word15.detail =  @"動詞～s/-dz/; rode/roʊd/; ___den/rɪ́d(ə)n/; ___ing\n他動詞\n乗る, 乗って走る, 乗って行く, 乗って進む\nI can ___ a bicycle, and I can drive a car, but I can not ___ a horse.\n自転車に乗れるし、車も運転出来るけど乗馬は出来ない。\n\n自動詞\n乗馬をする; 乗る, 乗って走る, 乗って行く\n\n~なように乗馬する; ~な乗り心地である\n\n馬乗りになる\n\n名詞 複～s/-dz/\n乗ること; 乗り物による旅行, 移動; 乗り物で行く時間[距離]";
        word15.hatuon = @"raɪd";
        word15.reibun = @"I can ride a bicycle, and I can drive a car, but I can not ride a horse.";
        
        TestWord *word16 = [TestWord new];
        word16.name = @"situated";
        word16.detail =  @"形容詞\n位置している, ある; 位置[所在地]が~である\nThe school is ___ just outside the town.\nその学校は町の外に位置している。\n\n~の境遇[立場]に置かれた";
        word16.hatuon = @"sɪ́tʃuèɪtɪd";
        word16.reibun = @"The school is situated just outside the town.";
        
        TestWord *word17 = [TestWord new];
        word17.name = @"society";
        word17.detail =  @"名詞 複-ties/-z/\n社会, 世間, 世間の人々\nThis event had a pernicious influence on ___.\nこの出来事は社会に有害な影響を与えた、\n\n社会階層; ~界\n\n協会, 団体, 組合, クラブ\n\n上流社会, 社交界; 上流社会の, 社交界の";
        word17.hatuon = @"səsá(ɪ)əti";
        word17.reibun = @"This event had a pernicious influence on society.";
        
        TestWord *word18 = [TestWord new];
        word18.name = @"standard";
        word18.detail =  @"名詞 複～s/-dz/\n基準, 水準, 標準\nThere is no absolute ___ for beauty.\n美に絶対の標準はない。\n\n尺度\n\n規範\n\n基本単位, 原器; 規格\n\n形容詞\n一般的な, 通例の\n\n標準的な, 通常の; 標準の, 基準となる\n\n権威ある, 一流の; 定評のある";
        word18.hatuon = @"stǽndərd";
        word18.reibun = @"There is no absolute standard for beauty.";
        
        TestWord *word19 = [TestWord new];
        word19.name = @"suggest";
        word19.detail =  @"動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n提案する, 持ちかける; ~することを提案する; ~してはどうかと提案[提言]する, 言い出す; ~かについて解決策[妙案]を述べる\nI ___ed going for a walk.\n散歩に行こうと持ちかけた。\n\n推薦する ; ~を勧める; ~かを教える\n\n暗示[示唆]する; ~ということを暗示する\n\n~をそれとなく言う, ほのめかす\n\n~を連想させる, 思い起こさせる";
        word19.hatuon = @"səɡdʒést|sədʒést";
        word19.reibun = @"I suggested going for a walk.";
        
        
        words = [NSMutableArray arrayWithObjects:
                 word1, word2, word3, word4, word5, word6, word7, word8, word98, word9, word10, word11, word12, word13,
                 word14, word15, word16, word17, word18, word19,  nil];
    }
    
    if ( [wordNo isEqualToString:@"27"]){
        TestWord *word20 = [TestWord new];
        word20.name = @"actually";
        word20.detail =  @"副詞\n実際には, 本当に, 現実に\n\n実際は, 本当は\n\n実は, 実を言うと\nHe seems to be doing nothing, but ___ he is just biding his time.\n彼は何もしていないように見えるが、実は好機を待っている。";
        word20.hatuon = @"ǽktʃu(ə)li";
        word20.reibun = @"He seems to be doing nothing, but actually he is just biding his time.";
        
        TestWord *word21 = [TestWord new];
        word21.name = @"bite";
        word21.detail =  @"動詞～s/-ts/; ___t/bɪt/; ___tten/bɪ́t(ə)n/; ___ting\n他動詞\nかむ, ~にかみつく, ~をかみちぎる\n\n~を刺す; ~をはさむ\n\n寒さがにしみる; 霜が~をいためる; 酸が金属を腐食する\n\n自動詞\n食いつく; かみつく; かみ切る\n\n名詞 複～s/-ts/\nかむこと, かじること; 魚釣りのあたり\n\nかみ傷, 刺し傷\nHe was taken to the hospital to be treated for snake ___.\n彼は蛇に噛まれたのを治療する為に病院へ搬送された。\n\n少量;ひと口, ひとかじり";
        word21.hatuon = @"baɪt";
        word21.reibun = @"He was taken to the hospital to be treated for snake bite.";
        
        TestWord *word22 = [TestWord new];
        word22.name = @"coast";
        word22.detail =  @"名詞 複～s/-ts/\n沿岸, 海岸; 沿岸地帯\nWe spent a week exploring the ___.\n私達は一週間かけて海岸を探検した。\n\n動詞\n自動詞\n惰力で進む, 惰力運転する; 滑走する, すべり降りる\n\n順調に進む; 楽に乗り越える; 漫然と過ごす";
        word22.hatuon = @"koʊst";
        word22.reibun = @"We spent a week exploring the coast.";
        
        TestWord *word23 = [TestWord new];
        word23.name = @"deal";
        word23.detail =  @"名詞\n量, 程度\n\n動詞～s/-z/; ___t/delt/; ～ing\n他動詞\n分配する, 分ける;~を配る\n\n名詞 複～s/-z/\n取引, 契約, 取決め\nAfter weeks of negotiating, they're finalizing the ___ today.\n数週間の交渉を経て、彼らは本日取引を終える。\n\n扱い, 処遇\n\n配る番; 配られたカード; 配ること";
        word23.hatuon = @"diːl";
        word23.reibun = @"After weeks of negotiating, they're finalizing the deal today.";
        
        TestWord *word24 = [TestWord new];
        word24.name = @"desert";
        word24.detail =  @"名詞 複～s/-ts/\n砂漠, 荒野; 砂漠地帯\nTwo thirds of the country is dry or ___.\nその国の３分の二は乾燥地帯或いは砂漠である。\n\n不毛の地[時期, 時代]\n\n動詞 /dɪzə́ːrt/～s/-ts/; ～ed/-ɪd/; ～ing\n\n他動詞\n捨てる, 見捨てる; 放棄する\n\n去る\n\nやめる; 離党する";
        word24.hatuon = @"dézərt";
        word24.reibun = @"Two thirds of the country is dry or desert.";
        
        TestWord *word25 = [TestWord new];
        word25.name = @"earthquake";
        word25.detail =  @"名詞 複～s/-s/\n地震\nThere has been a dreadful ___ in Iran.\nイランで一度恐ろしい地震が起きた。";
        word25.hatuon = @"ə́ːrθkwèɪk";
        word25.reibun = @"There has been a dreadful earthquake in Iran.";
        
        TestWord *word26 = [TestWord new];
        word26.name = @"effective";
        word26.detail =  @"形容詞more ～; most ～\n効果的な, 有効な;効き目のある;有能な, 性能のよい\nAdvertising is often the most ___ method of promotion.\n広告はしばしば販売促進の最も効果的な方法となる。\n\n印象的な, 心に残る\n\n事実上の, 実際の; 実動の";
        word26.hatuon = @"ɪféktɪv";
        word26.reibun = @"Advertising is often the most effective method of promotion.";
        
        TestWord *word27 = [TestWord new];
        word27.name = @"examine";
        word27.detail =  @"動詞～s/-z/; ～d/-d/; -ining\n他動詞\n~を調べる, 調査[検査]する; ~を検討[吟味]する; ~かどうかを調べる, 検討する\n___ the account well before you pay it.\n支払いの前に勘定書をよく確認しなさい。\n\n診察[検診]する";
        word27.hatuon = @"ɪɡzǽmɪn";
        word27.reibun = @"Examine the account well before you pay it.";
        
        TestWord *word28 = [TestWord new];
        word28.name = @"false";
        word28.detail =  @"形容詞more ～; most ～/～r; ～st\n間違った, 事実に反する\n\n誤りに基づいた; 誤解による\n\n偽った, 偽造の\n\n人工[人造]の\nLucy had a pair of ___ eyelashes today.\n今日ルーシーは付けまつ毛を付けた。\n\n不誠実な";
        word28.hatuon = @"fɔːls";
        word28.reibun = @"Lucy had a pair of false eyelashes today.";
        
        TestWord *word29 = [TestWord new];
        word29.name = @"gift";
        word29.detail =  @"名詞 複～s/-ts/\n贈り物, 寄贈品; 寄付金\nHe gave me a necklace as an anniversary ___.\n彼は記念品としてネックレスをくれた。\n\n才能, 天賦の才";
        word29.hatuon = @"ɡɪft";
        word29.reibun = @"He gave me a necklace as an anniversary gift.";
        
        TestWord *word30 = [TestWord new];
        word30.name = @"hunger";
        word30.detail =  @"名詞 複～s/-z/\n飢え, 飢餓, ひもじさ\nI had experienced the pangs of ___.\nかつて空腹痛を経験した。\n\n空腹感\n\n熱望, あこがれ, 渇望";
        word30.hatuon = @"hʌ́ŋɡər";
        word30.reibun = @"I had experienced the pangs of hunger.";
        
        TestWord *word31 = [TestWord new];
        word31.name = @"imagine";
        word31.detail =  @"動詞～s/-z/; ～d/-d/; -ining\n他動詞\n想像する, 心に描く; ~するのを想像する; ~であると想像する\nIt is hard to ___ the scale of the universe.\n宇宙の規模を想像は想像しがたい。\n\n~を真実と思い込む[決め込む, 考える]; ~と思い込む; ~であると思い込む\n\n自動詞\n想像する; 推測する, 思う";
        word31.hatuon = @"ɪmǽdʒɪn";
        word31.reibun = @"It is hard to imagine the scale of the universe.";
        
        TestWord *word32 = [TestWord new];
        word32.name = @"journey";
        word32.detail =  @"名詞 複～s/-z/\n旅行, 旅\n\n行程, 旅程\n\n旅路, 道のり ; 推移, 進展\nIt was a long ___, but we eventually arrived.\n長い道のりであったが、私達はついに辿り着いた。";
        word32.hatuon = @"dʒə́ːrni";
        word32.reibun = @"It was a long journey, but we eventually arrived.";
        
        TestWord *word33 = [TestWord new];
        word33.name = @"puzzle";
        word33.detail =  @"動詞～s/-z/; ～d/-d/; -zling\n他動詞\n困らせる, 当惑させる\n\n頭を悩ます\n\n自動詞\n頭を悩ます, 考え込む\n\n名詞 複～s/-z/\n理解できない~, 難問, なぞ\nWill you help me to solve this ___?\nこの難問を解くのを手伝ってくれませんか？\n\nパズル";
        word33.hatuon = @"pʌ́z(ə)l";
        word33.reibun = @"Will you help me to solve this puzzle?";
        
        TestWord *word34 = [TestWord new];
        word34.name = @"quite";
        word34.detail =  @"副詞\n割に, 比較的, まあまあ, ~のほう;割に~な\n\n非常に, かなり, 思いのほか, 相当\nHe was ___ young.\n彼はかなり若かった。\n\nまったく, すっかり, 完全に, 本当に; まったく~な~\n\nまったく~というわけではない, 必ずしも~ではない\n\n~というわけではない\n\nかなりの~; そこそこの~\n\n並はずれて; 大変な~, 本当に\n\n相当多くの~";
        word34.hatuon = @"kwaɪt";
        word34.reibun = @"He was quite young.";
        
        TestWord *word35 = [TestWord new];
        word35.name = @"rather";
        word35.detail =  @"副詞\n~よりもむしろ~, ~というよりは~\n\nむしろ~したい, ~した方がいい\nI would ___ stay at home.\n(むしろ)家にいた方がいい。\n\nむしろ~だといいのに\n\nかなり, 相当; やや, いくぶん, 思ったより\n\nもっと正しくは; それどころか";
        word35.hatuon = @"rǽðər|rɑ́ːðə";
        word35.reibun = @"I would rather stay at home.";
        
        TestWord *word36 = [TestWord new];
        word36.name = @"specific";
        word36.detail =  @"形容詞more ～; most ～\n特定の, 一定の\n\n明確な, はっきりとした, 具体的な\nHe gave us very ___ instructions.\n彼は私達に具体的な指示を与えた。\n\n 特有の, 固有の, 独特な\n\n~に特定[特有]の, ~に限定された\n\n名詞\n詳細部分, 細部";
        word36.hatuon = @"spəsɪ́fɪk";
        word36.reibun = @"He gave us very specific instructions.";
        
        TestWord *word37 = [TestWord new];
        word37.name = @"tour";
        word37.detail =  @"名詞 複～s/-z/\n旅行, 周遊[観光]旅行\nThey're going on a world ___.\n彼らは世界を旅行している。\n\nツアー, 巡業; 遠征;視察旅行\n\n見学\n\n海外勤務期間\n\n動詞\n他動詞\nツアーに出る, 遠征[巡業]に行く\n\n旅行する, 周遊する; 見学する";
        word37.hatuon = @"tʊər";
        word37.reibun = @"They're going on a world tour.";
        
        TestWord *word38 = [TestWord new];
        word38.name = @"trip";
        word38.detail =  @"名詞 複～s/-s/\n旅行; 外出, 行ってくること, 往復; 移動\nThey planned to make a wedding ___ to Paris.\n彼らは新婚旅行でパリに行く計画を立てた。\n\n幻覚経験[症状], トリップ; 熱中, こだわりの気持ち, 妄想\n\n失言, 失敗, へま\n\n動詞～s/-s/; ～ped/-t/; ～ping\n自動詞\nつまずく, つまずいて転ぶ\n\n間違いをする, 失敗する ; 言い間違いをする\n\n他動詞\n失敗をさせる, 言い間違いをさせる;揚げ足をとる";
        word38.hatuon = @"trɪp";
        word38.reibun = @"They planned to make a wedding trip to Paris.";
        
        TestWord *word39 = [TestWord new];
        word39.name = @"value";
        word39.detail =  @"名詞 複～s/-z/\n価値, 価格, 値段\n\n通貨の交換価値\n\n対価, 見返り\n\n価値, 値打ち; 有用性, 重要性\nNo one knows the ___ of health until he loses it.\n彼が健康を失うまで誰もその重要性を知らなかった。\n\n価値観, 価値体系\n\n特徴, 性質\n\n動詞～s/-z/; ～d/-d/; -uing\n他動詞\n尊重する, 重んじる;評価する\n\n値をつけられる";
        word39.hatuon = @"vǽljuː";
        word39.reibun = @"No one knows the value of health until he loses it.";
        
        words = [NSMutableArray arrayWithObjects:
                 word20, word21, word22, word23, word24, word25,
                 word26, word27, word28, word29, word30, word31, word32, word33, word34, word35, word36, word37,
                 word38, word39, nil];
    }
    
    if ( [wordNo isEqualToString:@"28"]){
        TestWord *word40 = [TestWord new];
        word40.name = @"band";
        word40.detail =  @"名詞 複～s/dz/\n輪, 帯, 縛るもの; リボン\n\nしま模様, 筋\n\n税金、収入の範囲\n\n動詞\n他動詞\n~をひもで縛る\n\n名詞 複～s/-dz/\nバンド, 楽団, 楽隊; 吹奏楽隊\nThey are a teenager ___ made up of four boys.\n彼らは四人の少年で結成された少年バンドだ。\n\n一団, 部隊; 一味";
        word40.hatuon = @"bænd";
        word40.reibun = @"They are a teenager band made up of four boys.";
        
        TestWord *word41 = [TestWord new];
        word41.name = @"barely";
        word41.detail =  @"副詞\nかろうじて, やっと; ほとんど~ない\nHe is so weak that he can ___ stand up.\n彼はほとんど立てないほど虚弱だ。\n\nちょうど, せいぜい\n\n乏しく\n\nまもなく, ~するとすぐに";
        word41.hatuon = @"béərli";
        word41.reibun = @"He is so weak that he can barely stand up.";
        
        TestWord *word42 = [TestWord new];
        word42.name = @"boring";
        word42.detail =  @"形容詞more ～; most ～\n退屈な, うんざりするような\nIt is ___ to listen to the same story.\n同じ話を聞くのはうんざりする。";
        word42.hatuon = @"bɔ́ːrɪŋ";
        word42.reibun = @"It is boring to listen to the same story.";
        
        TestWord *word43 = [TestWord new];
        word43.name = @"cancel";
        word43.detail =  @"動詞～s/-z/; ～ed/-d/ ～ing\n他動詞\n取り消す, 中止する; 無効にする;運休にする\nThe match had to be ___led due to the bad weather.\n悪天候の為その試合を中止にせざるを得なかった。\n\n帳消しにする, 埋め合わせる, 償う\n\n自動詞\n取り消す; 無効にする";
        word43.hatuon = @"kǽns(ə)l";
        word43.reibun = @"The match had to be cancelled due to the bad weather.";
        
        TestWord *word44 = [TestWord new];
        word44.name = @"driveway";
        word44.detail =  @"名詞 複～s\n私設車道\nI saw him drive out the ___.\n彼が(私設)車道から出るのを見た。";
        word44.hatuon = @"draɪvweɪ";
        word44.reibun = @"I saw him drive out the driveway.";
        
        TestWord *word45 = [TestWord new];
        word45.name = @"garbage";
        word45.detail =  @"名詞\nごみ\nPlease throw the ___ away.\nそのゴミを捨ててください。\n\n誤ったデータ, 不要データ";
        word45.hatuon = @"ɡɑ́ːrbɪdʒ";
        word45.reibun = @"Please throw the garbage away.";
        
        TestWord *word46 = [TestWord new];
        word46.name = @"instrument";
        word46.detail =  @"名詞 複～s/-ts/\n器具, 器械, 精密機器; 凶器\nThis ___ monitors the patient's heartbeats.\nこの機器は患者の動悸を監視する。\n\n手段, 施策; 媒介者, 手先; 機関";
        word46.hatuon = @"ɪ́nstrəmənt";
        word46.reibun = @"This instrument monitors the patient's heartbeats.";
        
        TestWord *word47 = [TestWord new];
        word47.name = @"list";
        word47.detail =  @"名詞 複～s/-ts/\nリスト, 一覧表, 表; 名簿; 目録; 明細書\nHe wrote down his name on the ___.\n彼の名前をリストに書いた。\n\n動詞～s/-ts/; ～ed/-ɪd/; ～ing\n\n他動詞\n~を一覧表[リスト]にする, 表[名簿]に載せる;~を列挙する, 挙げる; リストアップする\n\n~の一覧表を載せる;~をリストの中に掲載する\n\n~を公表する";
        word47.hatuon = @"lɪst";
        word47.reibun = @"He wrote down his name on the list.";
        
        TestWord *word48 = [TestWord new];
        word48.name = @"magic";
        word48.detail =  @"名詞\n魔法, 魔術, 呪術\nSome people still believe in ___.\n一部の人はまだ魔法を信じている。\n\n魔力, 不思議な力; 特別な能力[魅力]\n\n奇術, 手品\n\n形容詞more ～; most ～\n魔法の, 魔術の; 魔法のような\n\n奇術の\n\n不思議な力[魅力]のある";
        word48.hatuon = @"mǽdʒɪk";
        word48.reibun = @"Some people still believe in magic.";
        
        TestWord *word49 = [TestWord new];
        word49.name = @"message";
        word49.detail =  @"名詞 複～s/-ɪz/\n伝言, ことづけ, メッセージ\nThere is an important ___ for you from your brother.\nあなたの兄弟から重要なメッセージがあります。\n\nねらい, 意図; 教訓, メッセージ";
        word49.hatuon = @"mésɪdʒ";
        word49.reibun = @"There is an important message for you from your brother.";
        
        TestWord *word50 = [TestWord new];
        word50.name = @"notice";
        word50.detail =  @"動詞～s/-ɪz/; ～d/-t/; -ticing\n他動詞\n気づく, わかる\nHe walked so fast that he didn't ___ his wife.\n彼は歩くのがとても速かったので彼の奥さんに気付かなかった。\n\n~しているのに気づく\n\n自動詞\n気づく; 注目[注意]する\n\n名詞 複～s/-ɪz/\n通告, 警告, 予告, 届け出; 解雇[退去, 解約, 退職]通知書\n\n掲示文, 張り紙; 看板, 掲示板\n\n告知記事, 広告; お知らせ, 連絡\n\n注目, 注意; 関心, 好意\n\n短評, 寸評, コメント";
        word50.hatuon = @"nóʊtəs";
        word50.reibun = @"He walked so fast that he didn't notice his wife.";
        
        TestWord *word51 = [TestWord new];
        word51.name = @"own";
        word51.detail =  @"形容詞\n自分自身の, 自前の, 個人の\n\n独特の, 特有の\nThe writer has his ___ brand of humour.\nその作家は彼独特のユーモアがある。\n\n独自の, 自分でできる; 自分が原因の\n\n自分のもの; 自分独特のもの; 愛する者[家族]\n\n動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\n~を所有している, 保有する";
        word51.hatuon = @"oʊn";
        word51.reibun = @"The writer has his own brand of humour.";
        
        TestWord *word52 = [TestWord new];
        word52.name = @"predict";
        word52.detail =  @"動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n予測する, 予言する; ~ということを予測する\nIt is impossible to ___ what will happen.\n未来を予測するのは不可能だ。";
        word52.hatuon = @"prɪdɪ́kt";
        word52.reibun = @"It is impossible to predict what will happen.";
        
        TestWord *word53 = [TestWord new];
        word53.name = @"professor";
        word53.detail =  @"名詞 複～s/-z/\n教授\nThe ___ invited his students to his home for conversation.\n教授は生徒を自宅に招いて会談した。\n\n~教授, ~先生";
        word53.hatuon = @"prəfésər";
        word53.reibun = @"The professor invited his students to his home for conversation.";
        
        TestWord *word54 = [TestWord new];
        word54.name = @"rush";
        word54.detail =  @"動詞～es/-ɪz/; ～ed/-t/; ～ing\n大急ぎで行く, 突進する\nI really hate to ___ off like this.\nこのように急いで出かけるのが大嫌いだ。\n\n急いで~する; あわててする\n\n勢いよく流れる\n\n他動詞\n急いで送る\n\nせきたてる;急いで~をさせる\n\nあわてて行う, 急いでする;急いで通過させる\n\n名詞 複～es/-ɪz/\n勢いよく流れる[吹く]こと;急いで動くこと\n\n急ぐこと; 忙しさ, あわただしさ\n\n忙しい時間, 混雑時間, ラッシュアワー\n\n殺到, 需要の激増\n\n感情の激発; 快感";
        word54.hatuon = @"rʌʃ";
        word54.reibun = @"I really hate to rush off like this.";
        
        TestWord *word55 = [TestWord new];
        word55.name = @"schedule";
        word55.detail =  @"名詞 複～s/-z/\nスケジュール, 予定, 計画\nI'll work out the ___.\n私が予定を組みます。\n\n時刻表, 時間表\n\n一覧表, 目録; 別表\n\n動詞～s/-z/; ～d/-d/; -uling\n他動詞\n予定されている\n\n~する予定である";
        word55.hatuon = @"skédʒuːl|ʃédjuːl, skédjuːl";
        word55.reibun = @"I'll work out the schedule.";
        
        TestWord *word56 = [TestWord new];
        word56.name = @"share";
        word56.detail =  @"名詞 複～s/-z/\n割り当て, 仕事の分担 ; 役割, 貢献\n\n分け前, 取り分\n\n分担所有[経営], 共有権;株式; 株券\n\n市場占有率, シェア\n\n動詞～s/-z/; ～d/-d/; ___ing/ʃéərɪŋ/\n他動詞\n一緒に使用する, 共有する\nChildren should be taught to ___ their toys.\n玩具を共有するように子供を教育するべきだ。\n\n分配する, 均等に分ける\n\n分けてやる, 使わせる\n\n共にする, 分かち合う ; 共同負担する;意見を話す\n\n自動詞\n分け合う, 共同分担[負担]する; 参加する; 分け前にあずかる";
        word56.hatuon = @"ʃeər";
        word56.reibun = @"Children should be taught to share their toys.";
        
        TestWord *word57 = [TestWord new];
        word57.name = @"stage";
        word57.detail =  @"名詞 複～s/-ɪz/\n段階, 時期, 局面\n\n舞台, ステージ\nHe quitted the ___ of politics.\n彼は政治の舞台を退いた。\n\n演劇; 俳優業; 演劇界\n\n舞台, 場所\n\n動詞～s/-ɪz/; ～d/-d/; ___ing\n上演する; 主催[開催]する\n\nストライキ、抗議集会を企画する; ~をやってのける";
        word57.hatuon = @"steɪdʒ";
        word57.reibun = @"He quitted the stage of politics.";
        
        TestWord *word58 = [TestWord new];
        word58.name = @"storm";
        word58.detail =  @"名詞 複～s/-z/\nあらし, 暴風雨; 暴風\nIn the ___ I took shelter under the tree.\nあらしの時、木の下に避難した。\n\n非難、怒りの激発;あらしのような~\n\n騒ぎ, 動揺\n\n動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\n~を急襲する, ~に攻め込む, 押し入る\n\n自動詞\n激怒して~; 突進する\n\n急速に良くなる, 急に好成績をとる";
        word58.hatuon = @"stɔːrm";
        word58.reibun = @"In the storm I took shelter under the tree.";
        
        TestWord *word59 = [TestWord new];
        word59.name = @"within";
        word59.detail =  @"前置詞\n~以内に, ~もたたないうちに; ~の間に\nI'll be coming ___ an hour.\n1時間以内に着きます。\n\n~の内側に; ~の内部に; ~に囲まれて; ~の範囲内に\n\n内部で\n\n範囲内で; 限度内で; 権力の及ぶ中で\n\n副詞\n店内で";
        word59.hatuon = @"wɪðɪ́n";
        word59.reibun = @"I'll be coming within an hour.";
        
        words = [NSMutableArray arrayWithObjects:
                 word40, word41, word42, word43, word44, word45, word46, word47, word48, word49,
                 word50, word51, word52, word53, word54, word55, word56, word57, word58, word59, nil];
    }
    
    if ( [wordNo isEqualToString:@"29"]){
        TestWord *word60 = [TestWord new];
        word60.name = @"advertise";
        word60.detail =  @"動詞～s/-ɪz/; ～d/-d/; -tising\n他動詞\n宣伝する, 広告する\nWe decided to ___ our new product.\n新しい製品を宣伝する事に決めた。\n\n~ということを宣伝[広告, 告知]する\n\n公にする\n\n自動詞\n広告を出す, 宣伝する";
        word60.hatuon = @"ǽdvərtàɪz";
        word60.reibun = @"We decided to advertise our new product.";
		
        TestWord *word61 = [TestWord new];
        word61.name = @"assign";
        word61.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\n~に割り当てる, ~を~に課す; ~を~に配分する\nAll the students are ___ed to suitable jobs.\n全ての学生に適した仕事を割り当てる。\n\n任命される, 派遣される\n\n指定する, 決める";
        word61.hatuon = @"əsáɪn";
        word61.reibun = @"All the students are assigned to suitable jobs.";
        
        TestWord *word62 = [TestWord new];
        word62.name = @"audience";
        word62.detail =  @"名詞 複～s/-ɪz/\n聴衆, 観客, 観衆, 聞き手\nThe ___ was no less than five thousand.\n観客が5千人もいた。\n\n視聴者; 読者; 支持者, 信奉者\n\n公式[正式]会見,謁見";
        word62.hatuon = @"ɔ́ːdiəns";
        word62.reibun = @"The audience was no less than five thousand.";
        
        TestWord *word63 = [TestWord new];
        word63.name = @"breakfast";
        word63.detail =  @"名詞\n朝食\nHe seldom eats ___.\n彼は朝食を滅多に食べない。";
        word63.hatuon = @"brékfəst";
        word63.reibun = @"He seldom eats breakfast.";
        
        TestWord *word64 = [TestWord new];
        word64.name = @"competition";
        word64.detail =  @"名詞 複～s/-z/\n競争, 競合, 争い, 張り合い\nEveryone in modern society faces keen ___s.\n現代社会は皆激しい競争に直面する。\n\n競争相手, ライバル, 競争者; 競合製品[商品]\n\n試合, 競技会;コンクール, コンテスト; コンペ ";
        word64.hatuon = @"kɑ̀mpətɪ́ʃ(ə)n|kɔ̀m-";
        word64.reibun = @"Everyone in modern society faces keen competitions.";
        
        TestWord *word65 = [TestWord new];
        word65.name = @"cool";
        word65.detail =  @"形容詞～er; ～est\n涼しい, 涼しそうな; 冷えた, 冷めた\nA ___ breeze blew from the lake.\n涼しい微風が湖から吹く。\n\n落ち着いた, 冷静な\n\nかっこいい, 粋な, すごい; 気分が最高の\n\n冷たい, 冷淡な, 熱意のない; 少し距離を置いた\n\n厚かましい, ずうずうしい\n\n問題ない, 大丈夫な, 結構な\n\n動詞～s/-z/; ～ed/-d/; ～ing\n自動詞\n冷える, 冷める\n\n怒り、情熱がおさまる; 冷める\n\n他動詞\n冷やす, ~を涼しくする\n\n~を静める, ~を落ち着かせる\n\n副詞\n落ち着いて\n\n名詞\n涼しさ\n\n平静さ, 落ち着き";
        word65.hatuon = @"kuːl";
        word65.reibun = @"A cool breeze blew from the lake.";
        
        TestWord *word66 = [TestWord new];
        word66.name = @"gain";
        word66.detail =  @"動詞～s/-z/; ～ed/-d/; ～ing\n他動詞\n手に入れる, 獲得する;身につける; 達成する; 獲得する\nNo pain, no ___.\n苦労なくして利益なし。\n\n利益を得る\n\n~を得させる\n\n増す\n\n得る\n\n時間をかせぐ, 作る; 時間が進む\n\n自動詞\n身につける, 増す; 価値が上がる; 株が騰貴する\n\n得をする\n\n名詞 複～s/-z/\n増加, 得ること\n\n利点, 強み, 進歩\n\n利益; 収益金, 報酬";
        word66.hatuon = @"ɡeɪn";
        word66.reibun = @"No pain, no gain.";
        
        TestWord *word67 = [TestWord new];
        word67.name = @"importance";
        word67.detail =  @"名詞\n重要性, 重要なこと\nHe emphasized the ___ of careful driving.\n彼は安全運転の重要性を強調した。\n\n重要な地位, 有力\n\n尊大さ";
        word67.hatuon = @"ɪmpɔ́ːrt(ə)ns";
        word67.reibun = @"He emphasized the importance of careful driving.";
        
        TestWord *word68 = [TestWord new];
        word68.name = @"knowledge";
        word68.detail =  @"名詞\n知識; 知っている, 知識がある\nHe is poor in money, but rich in ___.\n彼は貧しいが、知識は豊かである。\n\n知る[知っている]こと, 認識, 理解\n\n知識, 学識, 学問";
        word68.hatuon = @"nɑ́lɪdʒ|nɔ́l-";
        word68.reibun = @"He is poor in money, but rich in knowledge.";
        
        TestWord *word69 = [TestWord new];
        word69.name = @"major";
        word69.detail =  @"形容詞\nより大きな, 大きい方の; 大部分の, 過半数[多数]の\n\n主要な; 偉大な; 重大な, 深刻な; 命にかかわる\nPopular education is one of our ___ objectives.\n社会教育は私達の主要な目標の一つだ。\n\nものすごい, すばらしい, 大変な\n\n専攻の\n\n名詞 複～s/-z/\n専攻科目; 専攻学生\n\n動詞～s/-z/; ～ed/-d/; ～ing\n自動詞\n専攻する";
        word69.hatuon = @"méɪdʒər";
        word69.reibun = @"Popular education is one of our major objectives.";
        
        TestWord *word70 = [TestWord new];
        word70.name = @"mean";
        word70.detail =  @"動詞～s/-z/; ___t/ment/; ～ing\n他動詞\n~を意味する, 表す\nWhat does this word ___?\nこの単語はどういう意味ですか？\n\n~によって~を言うつもりである; ~を~のつもりで言う; ~のことを言う\n\n~をさして言う\n\n~するつもりである, ~しようと思う; に~させるつもりである; ~というつもりである\n\n~に当てられる, 向けられる; 職業に向いている; ~することになっている, ~だとされている\n\n~ということになる, ~の前兆である; ~する結果になる, ~するということに等しい\n\n~にとって~の意味[重要性]をもつ\n\n~を起こす気である;~を抱く[加える]意図がある\n\n形容詞～er; ～est\n意地の悪い, 卑劣な ; ~するとは~は意地が悪い";
        word70.hatuon = @"miːn";
        word70.reibun = @"What does this word mean.";
        
        TestWord *word71 = [TestWord new];
        word71.name = @"prefer";
        word71.detail =  @"動詞～s/-z/; ～red/-d/; ～ring\n他動詞\n好む, 選ぶ; ~より~を好む\n\n~する方を好む, ~する方がよい\nI would ___ to stay home rather than go out on such a rainy day.\nこういう雨の日は外出するより家にいた方がいい。\n\n~に~してほしいと思う; ~が~であるのを好む, ~に~であってほしいと思う\n\n~だと良いと思う\n\n";
        word71.hatuon = @"prɪfə́ːr";
        word71.reibun = @"I would prefer to stay home rather than go out on such a rainy day.";
        
        TestWord *word72 = [TestWord new];
        word72.name = @"president";
        word72.detail =  @"名詞 複～s/-ts/\n大統領, 総統\n\n会長, 総裁, 議長;長官;学長, 総長\nThe ___ has just come to see me.\n先ほど学長が私に会いに来た。";
        word72.hatuon = @"prézɪd(ə)nt";
        word72.reibun = @"The president has just come to see me.";
        
        TestWord *word73 = [TestWord new];
        word73.name = @"progress";
        word73.detail =  @"名詞 複～es/-ɪz/\n進歩, 発展, 上達, 向上\nThe student is showing rapid ___ in his studies.\nその学生の学業の進歩は著しい。\n\n進展, 進捗, 進み具合; 成り行き; 進行, 前進\n\n動詞\n～es/-ɪz/; ～ed/-t/; ～ing\n自動詞\n進歩する, 発展[上達, 向上]する\n\n進展する, はかどる; 快方に向かう; 経過する\n\n前進する\n\n移る";
        word73.hatuon = @"prɑ́ɡrəs|prə́ʊɡres";
        word73.reibun = @"The student is showing rapid progress in his studies.";
        
        TestWord *word74 = [TestWord new];
        word74.name = @"respect";
        word74.detail =  @"名詞 複～s/-ts/\n尊敬, 敬意\n\n尊重, 重視; 配慮, 考慮\n\n注意\n\n点, 箇所, 事項\n\n動詞～s/-ts/; ～ed/-ɪd/; ～ing\n他動詞\n敬う, 尊敬する\nI ___ him as a writer and as a man.\n彼を作家として、また一個人としても尊敬する。\n\n尊重する, 重んじる; 遵守する";
        word74.hatuon = @"rɪspékt";
        word74.reibun = @"I respect him as a writer and as a man.";
        
        TestWord *word75 = [TestWord new];
        word75.name = @"rich";
        word75.detail =  @"形容詞～er; ～est\n裕福な, 金持ちの, 富んでいる\n\n裕福な人々, 金持ち\n\n豊富な, 豊かな;  富んで, 恵まれて\nHe has gained ___ experience in these years.\n彼はここ数年で豊富な経験を得た。\n\n豊かな, 多彩な, 興味深い;満ちて\n\n香り豊かな; 濃い, 鮮やかな; 濃厚な, 深みのある\n\nこってりした, しつこい\n\n肥えた\n\n高価な, 豪華な, ぜいたくな";
        word75.hatuon = @"rɪtʃ";
        word75.reibun = @"He has gained rich experience in these years.";
        
        TestWord *word76 = [TestWord new];
        word76.name = @"skill";
        word76.detail =  @"名詞 複～s/-z/\n卓越した技術, 腕前\nThe crisis put his courage and ___ to the test.\nその危機で彼の勇気と手腕が試される。\n\n熟練した能力, 知識";
        word76.hatuon = @"skɪl";
        word76.reibun = @"The crisis put his courage and skill to the test.";
        
        TestWord *word77 = [TestWord new];
        word77.name = @"somehow";
        word77.detail =  @"副詞\nなんとかして, どうにかして\nWe must make up for the lost time ___.\n私達はなんとかして失った時間を埋め合わせなければならない。\n\nどういうわけか, なんとなく";
        word77.hatuon = @"sʌ́mhàʊ";
        word77.reibun = @"We must make up for the lost time somehow.";
        
        TestWord *word78 = [TestWord new];
        word78.name = @"strength";
        word78.detail =  @"名詞 複～s\n力, 体力\n\n強度, 耐久力\n\n強さ, 意志のかたいこと; 感情、信念、関係の強い[深い]こと\n\n政治的、経済的な力, 戦力, 兵力; 兵数, 艦数, チームの人数\nTheir company's economic ___ is phenomenal.\n彼らの会社の実力は驚異的だ。\n\n濃度; 効力\n\n強味, 長所";
        word78.hatuon = @"streŋθ";
        word78.reibun = @"Their company's economic strength is phenomenal.";
        
        TestWord *word79 = [TestWord new];
        word79.name = @"vote";
        word79.detail =  @"名詞 複～s/-ts/\n投票, 票\n\n投票用紙, 票\n\n投票方法\n\n投票による採決, 票決\n\n投票[採決]の結果\n\n投票数; 得票数; 票田\n\n投票権;選挙権, 参政権\n\n決議\n\n動詞～s/-ts/; ～d/-ɪd/; ___ing\n自動詞\n投票をする;投票を行う\nI didn't ___ in the last election.	\n前回の選挙で投票しなかった。\n\n他動詞\n~を票決する;投票で決める\n\n~に投票する; ~の票を入れる\n\n~に選ぶ; ~を~であるとみなす";
        word79.hatuon = @"voʊt";
        word79.reibun = @"I didn't vote in the last election.";
        
        words = [NSMutableArray arrayWithObjects:
                 word60, word61,
                 word62, word63, word64, word65, word66, word67, word68, word69, word70, word71, word72, word73,
                 word74, word75, word76, word77, word78, word79, nil];
    }
    
    if ( [wordNo isEqualToString:@"30"]){
        TestWord *word80 = [TestWord new];
        word80.name = @"above";
        word80.detail =  @"前置詞\n~の上に, ~の真上に, ~の上方に, ~より高く ; ~を見下ろす位置にある;~より北に\nThe sun rose ___ the horizon.\n太陽が地平線上に昇った。\n\n~を超えて, ~より上で, ~以上で\n\n~より優先して, 重視して\n\n~より上の\n\n他の音より大きく[高く], よく通って\n\n~より上流に\n\n副詞\n上に, 真上に, 高い所に\n\n~より上で\n\n形容詞\n上述の, 上記の";
        word80.hatuon = @"əbʌ́v";
        word80.reibun = @"The sun rose above the horizon.";
		
        TestWord *word81 = [TestWord new];
        word81.name = @"ahead";
        word81.detail =  @"副詞\n前方に, 行く手に; 先頭に立って; 目の前の\n\n先に; 事前に, あらかじめ\nI think the work can be completed ___ of time.\n予定より早くその仕事は終わると思う。\n\n勝って, 先行して; ~が優れて; 進歩[成功]して\n\n";
        word81.hatuon = @"əhéd";
        word81.reibun = @"I think the work can be completed ahead of time.";
        
        TestWord *word82 = [TestWord new];
        word82.name = @"amount";
        word82.detail =  @"名詞 複～s/ts/\n~な量[額]\nHe has a large ___ of mail to answer every day.\n彼は毎日返信するメールが大量にある。\n\n一定量, ある金額; 合計, 総額; 元利合計\n\n動詞～s/-ts/; ～ed/-ɪd/; ～ing\n自動詞\n~に達する, なる\n\n~も同然である; 要するに~になる";
        word82.hatuon = @"əmáʊnt";
        word82.reibun = @"He has a large amount of mail to answer every day.";
        
        TestWord *word83 = [TestWord new];
        word83.name = @"belief";
        word83.detail =  @"名詞 複～s/-s/\n信じること, 確信, 信念\n\n信用, 信頼\n\n信仰, 信心; 信条\nHe has lost his ___ in God.\n彼は神を信じなくなった。";
        word83.hatuon = @"bɪlíːf, bə-";
        word83.reibun = @"He has lost his belief in God.";
        
        TestWord *word84 = [TestWord new];
        word84.name = @"center";
        word84.detail =  @"名詞 複～s/-z/\n中心点; 中央, まん中; 中心; 芯\n\n中心地, 拠点, 中心; 中心街, 繁華街\n\nセンター, 中心施設\nThe ___ provides facilities for a whole range of leisure activities.\nそのセンターはあらゆる種類の娯楽活動施設を提供している。\n\n注目、関心の的, 対象\n\n動詞～s/-z/; ～ed, ～ing\n\n他動詞\n中心[中央]に置く\n\n集まる; 関心が集中する\n\n自動詞\n集まる; 関心が集中する";
        word84.hatuon = @"séntər";
        word84.reibun = @"The center provides facilities for a whole range of leisure activities.";
        
        TestWord *word85 = [TestWord new];
        word85.name = @"common";
        word85.detail =  @"形容詞more ～; most ～\n普通の; よくある, ありふれた\n\n共通の, 共有の, 共同の; 公共の\nWe have ___ topics to talk about.\n私達は漫談する共通の話題がある。\n\n通常の, 普通の; 平凡な, 月並みな\n\n一般的な, 広く知られた; 当たり前の\n\n名詞\n共有地, 公有地";
        word85.hatuon = @"kɑ́mən|kɔ́m-";
        word85.reibun = @"We have common topics to talk about.";
        
        TestWord *word86 = [TestWord new];
        word86.name = @"cost";
        word86.detail =  @"名詞 複～s/-ts/\n費用, 代価, 値段; 維持費, 諸経費\n\n損失, 失費, 犠牲, 負担\n\n原価\nWe have to sum up the ___s of production.\n私達は生産コストを計算しなければならない。\n\n動詞～s/-ts/; ～; ～ing\n\n金額、費用がかかる, ~を必要とする\n\n~を払わせる; ~をもたらす; ~を必要とする\n\n自動詞\n費用がかかる, 高くつく";
        word86.hatuon = @"kɔːst|kɔst";
        word86.reibun = @"We have to sum up the costs of production.";
        
        TestWord *word87 = [TestWord new];
        word87.name = @"demonstrate";
        word87.detail =  @"動詞～s/-ts/; ～d/-ɪd/; -strating\n他動詞\n証明する, 論証する, 明らかに示す; ~ということを明らかに示す; ~が~であることを証明する\n\n実演する, 説明する; ~を実演販売する; ~かを説明する\nYou have to ___ how to operate the computer.\nあなたはそのコンピューターをどう使うのか実演しなければならない。\n\n才能、技術を示す, 見せる; 感情を表に出す\n\n自動詞\nデモをする, 示威運動をする";
        word87.hatuon = @"démənstrèɪt";
        word87.reibun = @"You have to demonstrate how to operate the computer.";
        
        TestWord *word88 = [TestWord new];
        word88.name = @"different";
        word88.detail =  @"形容詞more ～; most ～\n~とは違う, 異なる; 違った\nHe's a ___ man from what he was 10 years ago.\n彼は10年前とは違う。\n\n別々の, 別の\n\nさまざまな, 種々の\n\n珍しい, 独特な, 風変わりな\n\n違って";
        word88.hatuon = @"dɪ́fr(ə)nt";
        word88.reibun = @"He's a different man from what he was 10 years ago.";
        
        TestWord *word89 = [TestWord new];
        word89.name = @"evidence";
        word89.detail =  @"名詞 複～s/-ɪz/\n証拠, 根拠\nThere wasn't enough ___ to prove his guilt.\n彼の有罪を証明する証拠が充分ではなかった。\n\n証拠物件; 証言\n\nしるし, 徴候; 形跡, 痕\n\n動詞\n他動詞\n立証される; 明らかにされる, 示される";
        word89.hatuon = @"évɪd(ə)ns";
        word89.reibun = @"There wasn't enough evidence to prove his guilt.";
        
        TestWord *word90 = [TestWord new];
        word90.name = @"honesty";
        word90.detail =  @"名詞 複-ties/-z/\n正直, 誠実, 率直, 公正\nI respect you for your ___.\n正直であるあなたを尊敬します。";
        word90.hatuon = @"ɑ́nəsti|ɔ́n-";
        word90.reibun = @"I respect you for your honesty.";
        
        TestWord *word91 = [TestWord new];
        word91.name = @"idiom";
        word91.detail =  @"熟語, 成句, イディオム, 慣用句";
        word91.hatuon = @"ɪ́diəm";
        word91.reibun = @"";
        
        TestWord *word92 = [TestWord new];
        word92.name = @"independent";
        word92.detail =  @"形容詞\n独立した, 独立の; 自治の\n\n中立[第三者]的立場による\n\n無関係の, 影響を受けない, 独立した; 独自の, 別々の\n\n独立の, 民営の; 民営の, 民間の, 私立の\n\n自立した, 独立独歩の, 独立心のある\nYou should learn to be ___ of your parents.\nあなたは両親に頼らず自立するべきだ。\n\n働かなくても暮らせる\n\n自由な, 無所属の";
        word92.hatuon = @"ɪ̀ndɪpénd(ə)nt";
        word92.reibun = @"You should learn to be independent of your parents.";
        
        TestWord *word93 = [TestWord new];
        word93.name = @"inside";
        word93.detail =  @"前置詞\n~の中に, ~の内部に, ~の屋内に\n\n~の内部で\n\n~の中で\n\n体内で\n\n~までに\n\n副詞\n内部で\n\n内部が\n\n~の中で\n\n心の中で, 内心は\n\n形容詞\n内側の, 内部の; 屋内の, 車内の\nMaybe it is in your ___ pocket.\n多分それはあなたのポケットの中にある。\n\n組織内[部内]の; 内幕の\n\n名詞\n内側, 内部, 中身\n\n心の内, 内面\n\n歩道側; 走行車線\n\n内部, 所属メンバー";
        word93.hatuon = @"ɪnsáɪd";
        word93.reibun = @"Maybe it is in your inside pocket.";
        
        TestWord *word94 = [TestWord new];
        word94.name = @"master";
        word94.detail =  @"名詞 複～s/-z/\n主人, 雇い主; 支配者; 親方\nThe dog remained faithful to his ___.\nその犬は主人に忠実であり続けた。\n\n非常に得意な人; 名人, 達人; 大家, 巨匠, 有名画家; 師, 師匠\n\n修士号; 修士号取得者\n\n動詞～s/-z/; ～ed/-d/; ～ing/-t(ə)rɪŋ/\n他動詞\n習得する, 身につける, マスターする\n\n抑える\n\n形容詞\nコピー元の, 元になる\n\nすぐれた, 達人の, 名人の";
        word94.hatuon = @"mǽstər|mɑ́ːs-";
        word94.reibun = @"The dog remained faithful to his master.";
        
        TestWord *word95 = [TestWord new];
        word95.name = @"memory";
        word95.detail =  @"名詞 複-ries/-z/\n記憶, 覚えている[思い出す]こと; 記憶力, 物覚え\nHe has a good visual ___.\n彼は視覚記憶力がいい。\n\n記憶に残る範囲[期間]\n\n思い出, 記念の~, 追憶";
        word95.hatuon = @"mém(ə)ri";
        word95.reibun = @"He has a good visual memory.";
        
        TestWord *word96 = [TestWord new];
        word96.name = @"proper";
        word96.detail =  @"形容詞\n適切な , ふさわしい, 適当な\nHe could not come up with a ___ answer.\n彼は適切な回答が思いつかなかった。\n\n正しい, 妥当な, 受け入れられる\n\nまともな, ちゃんとした, 本物の\n\n固有の, 特有の, 独特の; ふさわしい\n\n厳密な意味での, 本来の, 本土の, その地域そのものの\n\n礼儀正しい";
        word96.hatuon = @"prɑ́pər|prɔ́p-";
        word96.reibun = @"He could not come up with a proper answer.";
        
        TestWord *word97 = [TestWord new];
        word97.name = @"scan";
        word97.detail =  @"動詞～s/-z/; ～ned/-d/; ～ning\n他動詞\n注意深く調べる[見つめる] \n\nざっと読む\n\n走査する; スキャンする\nCould you teach me how to ___ an image?\n画像をどうやってスキャンするか教えて頂けますか？";
        word97.hatuon = @"skæn";
        word97.reibun = @"Could you teach me how to scan an image?";
        
        TestWord *word99 = [TestWord new];
        word99.name = @"section";
        word99.detail =  @"名詞 複～s/-z/\n部分; 区分, 区域; 区間\nWhite lines divide the playing area into ___s.\n白線は競技領域をいくつかの区域に分ける。\n\n階級, 階層; グループ, 派, 党\n\n部門; 部, 課; 音節; 分科会\n\n組み立て用の部分; 房, 袋\n\n節; 項; 欄\n\n断面; 断面図\n\n区域, 地区";
        word99.hatuon = @"sékʃ(ə)n";
        word99.reibun = @"White lines divide the playing area into sections.";
        
        TestWord *word100 = [TestWord new];
        word100.name = @"surface";
        word100.detail =  @"名詞 複～s/-ɪz/\n水面; 地面\n\n表面, 上面\nThe ___ of the lake is quite still.\n湖の表面は静止している。\n\n外観, うわべ, 見かけ\n\n作業面, 上面\n\n形容詞\n表面の; 地表の\n\n地上の; 陸上の; 海上の\n\n表面的な, うわべだけの\n\n動詞\n自動詞\n浮上する\n\n明らかになる, 表面化する";
        word100.hatuon = @"sə́ːrfəs";
        word100.reibun = @"The surface of the lake is quite still.";
		
        words = [NSMutableArray arrayWithObjects:
                 word80, word81, word82, word83, word84, word85,
                 word86, word87, word88, word89, word90, word91, word92, word93, word94, word95, word96, word97,
                 word99, word100, nil];
    }


    
    [checkTextField setDelegate:self];
    checkTextField.returnKeyType = UIReturnKeyDone;
    [checkTextField setEnabled:NO];
    [checkTextField setPlaceholder:[NSString stringWithFormat:@"見て(書いて)覚えるをタップ"]];
    
    NSMutableAttributedString *attFont = [[NSMutableAttributedString alloc] initWithString:@"アプリの使い方は使い方を見るをタップしてください。各種設定方法は下記をご覧下さい。\n手書き入力\n予測変換オフ\n文字サイズ変更\n\n手書き入力\nキーボードアプリを使用、またはiPhoneの設定から手書き入力を追加します。\n設定方法: iPhoneの設定 > 一般 > キーボード > キーボード > 新しいキーボードを追加 > 中国語-繁体字(簡体字) 手書き を追加\n\n予測変換オフ\n自動修正をオフにします。\n設定方法: iPhoneの設定 > 一般 > キーボード > 自動修正オフ\n\n文字サイズの変更\n設定後、メニューに戻るかアプリを再起動して下さい。文字サイズが変更されます。\n設定方法: iPhoneの設定 > 画面表示と明るさ > 文字サイズを変更 > スライダをドラッグ     "];
    
    [attFont addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(0x065db5) range:NSMakeRange(41, 21)];
    //[attFont addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(0x0889e6) range:NSMakeRange(3, 87)];
    
    [ewTextView setAttributedText:attFont];
    
    ewTextView.textAlignment = NSTextAlignmentCenter;
    [ewTextView setEditable:NO];
    //[ewTextView setSelectable:NO];
    
    for (NSUInteger i = 0; i < words.count; ++i) {
        // Select a random element between i and end of array to swap with.
        NSInteger nElements = words.count - i;
        NSInteger n = (arc4random() % nElements) + i;
        [words exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    
    // Create datacontroller and initialize database
    TestWordsData *dataController = [[TestWordsData alloc]init];
    [dataController initDatabase];
    sqlite3_stmt *statement = NULL;
    
    for (int i = 0; i < words.count; ++i) {
        TestWord *randomWord = [words objectAtIndex:i];
        wordName = randomWord.name;
        detailData = randomWord.detail;
        hatuonData = randomWord.hatuon;
        reibunData = randomWord.reibun;
        TestWords *randomTestWord  = [[TestWords alloc]
                                      initWithUniqueId:sqlite3_column_int(statement, 0) + 1
                                      andWord:wordName
                                      andDetail:detailData
                                      andHatuon:hatuonData
                                      andReibun:reibunData];
        // Insert the word
        [dataController insertWord:randomTestWord];
    }
    
    nextButton.enabled = NO;
    saveButton.hidden = YES;
    reibunLabel.hidden = YES;
    reibunButton.hidden = YES;
    tangoLabel.hidden = YES;
    tangoButton.hidden = YES;
    speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
    self.speechSynthesizer.delegate = self;
    bannerForAD.delegate = self;
    startBlue.hidden = NO;
    blueImageLookStart.hidden = NO;
    progressLabel.hidden = YES;
    
    backgroundColorView.backgroundColor = UIColorAlphaFromRGB(0x065db5);
    [backgroundColorView addSubview:tableViewWhite];
    [backgroundColorView addSubview:ewTextView];
    [backgroundColorView addSubview:yourScoreOnLabel];
    [backgroundColorView addSubview:answerLabel];
    [backgroundColorView addSubview:hatuonLabel];
    [backgroundColorView addSubview:tangoLabel];
    [backgroundColorView addSubview:reibunLabel];
    [backgroundColorView addSubview:startButton];
    [backgroundColorView addSubview:progressBar];
    [backgroundColorView addSubview:saveButton];
    [backgroundColorView addSubview:tangoButton];
    [backgroundColorView addSubview:tangoPauseButton];
    [backgroundColorView addSubview:reibunButton];
    [backgroundColorView addSubview:reibunPauseButton];
    [backgroundColorView addSubview:stopButton];
    [backgroundColorView addSubview:textSizeButton];
    [backgroundColorView addSubview:showHelpViewButton];
    [backgroundColorView addSubview:lookToLearnButton];
    [backgroundColorView addSubview:showWordButton];
    
    ewTextView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    
    [menuButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont fontWithName:@"American Typewriter" size:15], NSFontAttributeName,
                                        [UIColor whiteColor], NSForegroundColorAttributeName,
                                        nil] forState:UIControlStateNormal];
    [nextButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont fontWithName:@"American Typewriter" size:15], NSFontAttributeName,
                                        [UIColor whiteColor], NSForegroundColorAttributeName,
                                        nil] forState:UIControlStateNormal];
    
    /* 右 から 左スワイプ に変更*/
    UISwipeGestureRecognizer* swipeLeftGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(view_SwipeLeft:)];
    swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.view addGestureRecognizer:swipeLeftGesture];
    
    
    NSString *MY_BANNER_UNIT_ID = @"ca-app-pub-9302632653080358/4207271822";
    
    // 画面上部に標準サイズのビューを作成する
    // 利用可能な広告サイズの定数値は GADAdSize.h で説明されている
    bannerView_ = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
    
    // 広告ユニット ID を指定する
    bannerView_.adUnitID = MY_BANNER_UNIT_ID;
    
    // ユーザーに広告を表示した場所に後で復元する UIViewController をランタイムに知らせて
    // ビュー階層に追加する
    bannerView_.rootViewController = self;
    [self.view addSubview:bannerView_];
    
    [bannerView_ setDelegate:self];
    
    // 一般的なリクエストを行って広告を読み込む
    //[bannerView_ loadRequest:[GADRequest request]];
    
    //テスト
    GADRequest *req = [GADRequest request];
    req.testDevices = @[ GAD_SIMULATOR_ID ];
    [bannerView_ loadRequest:req];
    
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)adViewDidReceiveAd:(GADBannerView *)bannerView {
    [UIView beginAnimations:@"ToggleViews" context:nil];
    [UIView setAnimationDuration:0.8];
    
    // Make the animatable changes.
    bannerView_.alpha = 0.0;
    bannerView_.alpha = 1.0;
    
    // Commit the changes and perform the animation.
    [UIView commitAnimations];
    
    bannerView.frame = CGRectMake(0,
                                  self.view.frame.size.height -
                                  bannerView.frame.size.height,
                                  bannerView.frame.size.width,
                                  bannerView.frame.size.height);
    [UIView commitAnimations];
}

- (void)adView:(GADBannerView *)bannerView
didFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"adView:didFailToReceiveAdWithError:%@", [error localizedDescription]);
    bannerView_.hidden = YES;
}

- (void)adViewWillLeaveApplication:(GADBannerView *)bannerView
{
    [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    if ([reibunString isEqual:@""] && !hatuonLabel.hidden) {
        [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        reibunButton.enabled = NO;
        [reibunButton setTitle:@"" forState:UIControlStateDisabled];
        tangoButton.enabled = YES;
        [tangoButton setTitle:@"" forState:UIControlStateNormal];
        tangoPauseButton.hidden = YES;
        tangoButton.hidden = NO;
        stopButton.hidden = YES;
    }else if(!hatuonLabel.hidden){
        [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        tangoButton.enabled = YES;
        [tangoButton setTitle:@"" forState:UIControlStateNormal];
        reibunButton.enabled = YES;
        [reibunButton setTitle:@"" forState:UIControlStateNormal];
        tangoPauseButton.hidden = YES;
        tangoButton.hidden = NO;
        reibunButton.hidden = NO;
        reibunPauseButton.hidden = YES;
        stopButton.hidden = YES;
    }
    //[[self presentingViewController] dismissViewControllerAnimated:NO completion:dismissblock];
}

- (void)adViewDidDismissScreen:(GADBannerView *)bannerView
{
    [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    if ([reibunString isEqual:@""] && !hatuonLabel.hidden) {
        [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        reibunButton.enabled = NO;
        [reibunButton setTitle:@"" forState:UIControlStateDisabled];
        tangoButton.enabled = YES;
        [tangoButton setTitle:@"" forState:UIControlStateNormal];
        tangoPauseButton.hidden = YES;
        tangoButton.hidden = NO;
        stopButton.hidden = YES;
    }else if(!hatuonLabel.hidden){
        [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        tangoButton.enabled = YES;
        [tangoButton setTitle:@"" forState:UIControlStateNormal];
        reibunButton.enabled = YES;
        [reibunButton setTitle:@"" forState:UIControlStateNormal];
        tangoPauseButton.hidden = YES;
        tangoButton.hidden = NO;
        reibunButton.hidden = NO;
        reibunPauseButton.hidden = YES;
        stopButton.hidden = YES;
    }
    //[[self presentingViewController] dismissViewControllerAnimated:YES completion:dismissblock];
}

/*
 - (void) dealloc {
 [self.nadView setDelegate:nil]; // delegate に nil をセット
 self.nadView = nil; // プロパティ経由で release、nil をセット
 // [super dealloc]; // MRC(非 ARC 時には必要)
 
 bannerView_.delegate = nil;
 
 // プロジェクトで ARC を使用している場合は bannerView_ を解放しない
 //[bannerView_ release];
 //[super dealloc];
 }
 */

/*
 //iAd取得成功
 - (void)bannerViewDidLoadAd:(ADBannerView *)banner
 {
 NSLog(@"iAd取得成功");
 bannerForAD.hidden = NO;
 
 self.nadView.hidden = YES;
 }
 
 //iAd取得失敗
 - (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
 {
 NSLog(@"iAd取得失敗");
 bannerForAD.hidden = YES;
 
 self.nadView = [[NADView alloc] initWithFrame:CGRectMake(0, 518, 320, 50)];
 // (3) ログ出力の指定
 [self.nadView setIsOutputLog:NO];
 // (4) set apiKey, spotId.
 [self.nadView setNendID:@"c0a9042c6429ca6d09484fae97e5904c38bdf00e"
 spotID:@"150950"];
 [self.nadView setDelegate:self]; //(5)
 [self.nadView load]; //(6)
 [self.view addSubview:self.nadView]; // 最初から表示する場合
 }
 
 -(void)nadViewDidFailToReceiveAd:(NADView *)adView {
 self.nadView.hidden = YES;
 }
 
 - (void)bannerViewActionDidFinish:(ADBannerView *)banner
 {
 [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
 
 [[self presentingViewController] dismissViewControllerAnimated:YES completion:dismissblock];
 }
 
 - (void)nadViewDidClickAd:(NADView *)adView {
 [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
 
 [[self presentingViewController] dismissViewControllerAnimated:YES completion:dismissblock];
 }
 
 - (void) dealloc {
 [self.nadView setDelegate:nil]; // delegate に nil をセット
 self.nadView = nil; // プロパティ経由で release、nil をセット
 // [super dealloc]; // MRC(非 ARC 時には必要)
 }
 */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButton:(id)sender {
    ewTextView.textAlignment = NSTextAlignmentLeft;
    
    _lookOrWrite = 1;
    
    [checkTextField setEnabled:YES];
    [ewTextView setEditable:NO];
    [ewTextView setSelectable:NO];
    
    [checkTextField setText:[NSString stringWithFormat:@""]];
    [checkTextField setPlaceholder:[NSString stringWithFormat:@"単語入力"]];
    
    // Create datacontroller and initialize database
    TestWordsData *dataController = [[TestWordsData alloc]init];
    [dataController initDatabase];
    NSArray *forDataList = [dataController wordInfo];
    dataList = forDataList;
    
    TestWords *dataInfo = [dataList objectAtIndex:currentIndex];
    detailText = [NSString stringWithFormat:@"%@", dataInfo.detail];
    correctHatuon = [NSString stringWithFormat:@"%@", dataInfo.hatuon];
    correctWord = [NSString stringWithFormat:@"%@", dataInfo.word];
    reibunString = [NSString stringWithFormat:@"%@", dataInfo.reibun];
    tangoString = [NSString stringWithFormat:@"%@", dataInfo.word];
    
    [ewTextView setText:detailText];
    
    [UIView beginAnimations:@"fadeIn" context:nil];
    [UIView setAnimationDuration:0.5];
    
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    
    [ewTextView setSelectable:YES];
    [ewTextView setTextColor:[UIColor blackColor]];
    // Make the animatable changes.
    ewTextView.alpha = 0.0;
    ewTextView.alpha = 1.0;
    
    // Commit the changes and perform the animation.
    [UIView commitAnimations];
    
    //TestWord *wordToStart = [words objectAtIndex:currentIndex];
    //correctName = wordToStart.name;
    //correctHatuon = wordToStart.hatuon;
    //[ewTextView setText:[NSString stringWithFormat:@"%@", wordToStart.detail]];
    
    startButton.hidden = YES;
    startButton.enabled = NO;
    /*NSLog(@"%d", currentIndex);*/
    reibunLabel.hidden = NO;
    reibunButton.hidden = NO;
    tangoLabel.hidden = NO;
    tangoButton.hidden = NO;
    yourScoreOnLabel.hidden = NO;
    progressBar.hidden = NO;
    textSizeButton.hidden = NO;
    textSizeBlue.hidden = NO;
    startBlue.hidden = YES;
    tangoButton.enabled = NO;
    reibunButton.enabled = NO;
    [tangoButton setTitle:@"" forState:UIControlStateDisabled];
    [reibunPauseButton setTitle:@"" forState:UIControlStateDisabled];
    saveBlue.hidden = NO;
    saveButton.hidden = NO;
    infoButton.hidden = YES;
    showHelpViewButton.hidden = YES;
    lookToLearnButton.hidden = YES;
    blueImageLookStart.hidden = YES;
    showWordButton.hidden = YES;
    blueImageShowWord.hidden = YES;
    progressLabel.hidden = NO;
}

- (IBAction)menuButton:(id)sender
{
    [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    
    if (_lookOrWrite == 1) {
        if (currentIndex == (words.count - 1)) {
            
            // Create datacontroller and initialize database
            ScoreData *dataController = [[ScoreData alloc]init];
            [dataController initDatabaseForScores];
            NSArray *highScore = [dataController scoreInfos];
            scoreForTest = highScore;
            
            if (scoreForTest.count == 0) {
                for (int p = 1; p <= 30; p++) {
                    NSString *newWordNo = [NSString stringWithFormat:@"%d", p];
                    if ([wordNo isEqualToString:newWordNo] && ![dataController Scores:p]){
                        Score *score  = [[Score alloc] initWithUniqueId:p andScore:yourScore];
                        // Insert the score
                        [dataController insertScore:score];
                    }
                }
            }else{
                for (int i = 0; i < scoreForTest.count; i++) {
                    Score *info = [scoreForTest objectAtIndex:i];
                    
                    for (int p = 1; p <= 30; p++) {
                        NSString *newWordNo = [NSString stringWithFormat:@"%d", p];
                        //info.score < yourScore
                        if ([wordNo isEqualToString:newWordNo] && info.uniqueId == p) {
                            Score *score  = [[Score alloc] initWithUniqueId:p andScore:yourScore];
                            [dataController updateScore:score];
                        }else if ([wordNo isEqualToString:newWordNo] && ![dataController Scores:p]){
                            Score *score  = [[Score alloc] initWithUniqueId:p andScore:yourScore];
                            // Insert the score
                            [dataController insertScore:score];
                        }
                    }
                    /*
                     if ([wordNo isEqualToString:@"1"] && info.uniqueId == 1 && info.score < yourScore) {
                     Score *score  = [[Score alloc] initWithUniqueId:1 andScore:yourScore];
                     [dataController updateScore:score];
                     }else if ([wordNo isEqualToString:@"1"] && ![dataController Scores:1]){
                     Score *score  = [[Score alloc] initWithUniqueId:1 andScore:yourScore];
                     // Insert the score
                     [dataController insertScore:score];
                     }
                     */
                }
            }
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"メニューに戻りますか？" message:@"" delegate:self cancelButtonTitle:@"いいえ" otherButtonTitles:@"はい", nil];
            [alertView show];
            
        }else{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"メニューに戻りますか？" message:@"" delegate:self cancelButtonTitle:@"いいえ" otherButtonTitles:@"はい", nil];
            [alertView show];
        }
        
        CorrectAnswerData *correct = [[CorrectAnswerData alloc] init];
        [correct initDatabaseForAnswers];
        
        //単元番号を取得
        int wordNoInt = [wordNo intValue];
        //NSLog(@"%d", wordNoInt);
        NSArray* answer = [correct AnswersInfo];
        correctAnswerList = answer;
        //NSLog(@"%d", correctAnswerList.count);
        
        //該当番号のデータの有無
        if (correctAnswerList.count == 0 && 0 < currentIndex) {
            for (int p = 1; p <= 30; p++) {
                NSString *newWordNo = [NSString stringWithFormat:@"%d", p];
                if ([wordNo isEqualToString:newWordNo] && ![correct CorrectData:p]){
                    GetAndSetCorrectAnswerData *corrects = [[GetAndSetCorrectAnswerData alloc] initWithUniqueId:wordNoInt andcorrect:correctNumber andincorrect:inCorrectNumber];
                    [correct insertAnswers:corrects];
                    //NSLog(@"Insert!");
                }
            }
        }else if (0 < currentIndex){
            for (int i = 0; i < correctAnswerList.count; i++) {
                infoCorrectIncorrect = [correctAnswerList objectAtIndex:i];
                for (int p = 1; p <= 30; p++) {
                    NSString *newWordNo = [NSString stringWithFormat:@"%d", p];
                    //info.score < yourScore
                    if ([wordNo isEqualToString:newWordNo] && infoCorrectIncorrect.uniqueId == p) {
                        //スコア総計
                        int correctInDB = infoCorrectIncorrect.correct;
                        int allCorrect = 0;
                        allCorrect += correctInDB;
                        allCorrect += correctNumber;
                        int inCorrectInDB = infoCorrectIncorrect.incorrect;
                        int allInCorrect = 0;
                        allInCorrect += inCorrectInDB;
                        allInCorrect += inCorrectNumber;
                        
                        //総計したデータをアップデート
                        GetAndSetCorrectAnswerData *ScoreOfToday  =
                        [[GetAndSetCorrectAnswerData alloc] initWithUniqueId:wordNoInt andcorrect:allCorrect andincorrect:allInCorrect];
                        [correct updateCorrectAnswers:ScoreOfToday];
                        
                        //NSLog(@"Update!");
                    }else if ([wordNo isEqualToString:newWordNo] && ![correct CorrectData:p]){
                        GetAndSetCorrectAnswerData *corrects = [[GetAndSetCorrectAnswerData alloc] initWithUniqueId:wordNoInt andcorrect:correctNumber andincorrect:inCorrectNumber];
                        [correct insertAnswers:corrects];
                        //NSLog(@"Insert!");
                    }
                }
            }
        }
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"メニューに戻りますか？" message:@"" delegate:self cancelButtonTitle:@"いいえ" otherButtonTitles:@"はい", nil];
        [alertView show];
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [[self presentingViewController] dismissViewControllerAnimated:YES completion:dismissblock];
        // Create datacontroller and initialize database
        TestWordsData *testWordDataController = [[TestWordsData alloc]init];
        [testWordDataController initDatabase];
        [testWordDataController deleteData];
    }else{
        //TestWord *wordData = [words objectAtIndex:currentIndex];
        //reibunString = [wordData reibun];
        if ([reibunString isEqual:@""] && !hatuonLabel.hidden) {
            reibunButton.enabled = NO;
            [reibunButton setTitle:@"" forState:UIControlStateDisabled];
            tangoButton.enabled = YES;
            [tangoButton setTitle:@"" forState:UIControlStateNormal];
            tangoPauseButton.hidden = YES;
            tangoButton.hidden = NO;
            stopButton.hidden = YES;
            
        }else if (!hatuonLabel.hidden){
            tangoButton.enabled = YES;
            [tangoButton setTitle:@"" forState:UIControlStateNormal];
            reibunButton.enabled = YES;
            [reibunButton setTitle:@"" forState:UIControlStateNormal];
            tangoPauseButton.hidden = YES;
            tangoButton.hidden = NO;
            reibunButton.hidden = NO;
            reibunPauseButton.hidden = YES;
            stopButton.hidden = YES;
            
        }else if (!tangoLabel.hidden && !reibunLabel.hidden){
            tangoPauseButton.hidden = YES;
            tangoButton.hidden = NO;
            reibunButton.hidden = NO;
            reibunPauseButton.hidden = YES;
            stopButton.hidden = YES;
            nextButton.enabled = NO;
            saveBlue.hidden = YES;
            tangoButton.enabled = NO;
            reibunButton.enabled = NO;
            [tangoButton setTitle:@"" forState:UIControlStateDisabled];
            [reibunPauseButton setTitle:@"" forState:UIControlStateDisabled];
        }
    }
}


- (IBAction)nextButton:(id)sender
{
    currentIndex++;
    
    if (_lookOrWrite == 1) {
        // Create datacontroller and initialize database
        TestWordsData *dataController = [[TestWordsData alloc]init];
        [dataController initDatabase];
        NSArray *forDataList = [dataController wordInfo];
        dataList = forDataList;
        
        TestWords *dataInfo = [dataList objectAtIndex:currentIndex];
        detailText = [NSString stringWithFormat:@"%@", dataInfo.detail];
        correctHatuon = [NSString stringWithFormat:@"%@", dataInfo.hatuon];
        correctWord = [NSString stringWithFormat:@"%@", dataInfo.word];
        reibunString = [NSString stringWithFormat:@"%@", dataInfo.reibun];
        tangoString = [NSString stringWithFormat:@"%@", dataInfo.word];
        
        /* NSLog(@"%d", currentIndex);*/
        
        //TestWord *wordData = [words objectAtIndex:currentIndex];
        //correctName = [wordData name];
        //correctHatuon = [wordData hatuon];
        
        /* NSLog(@"%@ %@", wordData.name, wordData.hatuon);*/
        
        [checkTextField setEnabled:YES];
        [ewTextView setEditable:NO];
        [ewTextView setSelectable:NO];
        
        [checkTextField setText:[NSString stringWithFormat:@""]];
        [checkTextField setPlaceholder:[NSString stringWithFormat:@"単語入力"]];
        [answerLabel setText:@""];
        
        hatuonLabel.hidden = YES;
        //saveButton.hidden = YES;
        
        [hatuonLabel setText:correctHatuon];
        [ewTextView setText:detailText];
        
        [UIView beginAnimations:@"fadeIn" context:nil];
        [UIView setAnimationDuration:0.5];
        
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        
        [ewTextView setSelectable:YES];
        
        // Make the animatable changes.
        ewTextView.alpha = 0.0;
        ewTextView.alpha = 1.0;
        
        // Commit the changes and perform the animation.
        [UIView commitAnimations];
        
        /*
         if (currentIndex == (words.count - 1)) {
         nextButton.enabled = NO;
         [nextButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
         [UIFont fontWithName:@"American Typewriter" size:15], NSFontAttributeName,
         [UIColor lightGrayColor], NSForegroundColorAttributeName,
         nil] forState:UIControlStateDisabled];
         
         UIAlertView *finishAlertView = [[UIAlertView alloc] initWithTitle:@"最後の単語です" message:@"解答後にメニューをタップして下さい" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
         [finishAlertView show];
         }*/
        
        yourScoreOnLabel.textColor = [UIColor whiteColor];
        progressBar.progressTintColor = [UIColor whiteColor];
        
        [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        tangoPauseButton.hidden = YES;
        tangoButton.hidden = NO;
        reibunButton.hidden = NO;
        reibunPauseButton.hidden = YES;
        stopButton.hidden = YES;
        nextButton.enabled = NO;
        //saveBlue.hidden = YES;
        tangoButton.enabled = NO;
        reibunButton.enabled = NO;
        [tangoButton setTitle:@"" forState:UIControlStateDisabled];
        [reibunPauseButton setTitle:@"" forState:UIControlStateDisabled];
        showWordButton.hidden = YES;
        blueImageShowWord.hidden = YES;
    }else{
        // Create datacontroller and initialize database
        TestWordsData *dataController = [[TestWordsData alloc]init];
        [dataController initDatabase];
        NSArray *forDataList = [dataController wordInfo];
        dataList = forDataList;
        
        TestWords *dataInfo = [dataList objectAtIndex:currentIndex];
        detailText = [NSString stringWithFormat:@"%@", dataInfo.detail];
        correctHatuon = [NSString stringWithFormat:@"%@", dataInfo.hatuon];
        correctWord = [NSString stringWithFormat:@"%@", dataInfo.word];
        reibunString = [NSString stringWithFormat:@"%@", dataInfo.reibun];
        tangoString = [NSString stringWithFormat:@"%@", dataInfo.word];
        
        /* NSLog(@"%d", currentIndex);*/
        
        //TestWord *wordData = [words objectAtIndex:currentIndex];
        //correctName = [wordData name];
        //correctHatuon = [wordData hatuon];
        
        /* NSLog(@"%@ %@", wordData.name, wordData.hatuon);*/
        
        [ewTextView setEditable:NO];
        [ewTextView setSelectable:NO];
        
        [checkTextField setText:[NSString stringWithFormat:@""]];
        [checkTextField setPlaceholder:[NSString stringWithFormat:@""]];
        checkTextField.enabled = NO;
        
        [answerLabel setText:@""];
        
        yourScoreOnLabel.hidden = YES;
        hatuonLabel.hidden = YES;
        //showWordButton.hidden = NO;
        //blueImageShowWord.hidden = NO;
        //saveButton.hidden = YES;
        
        [hatuonLabel setText:correctHatuon];
        [ewTextView setText:detailText];
        
        [UIView beginAnimations:@"fadeIn" context:nil];
        [UIView setAnimationDuration:0.5];
        
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        
        [ewTextView setSelectable:YES];
        
        // Make the animatable changes.
        ewTextView.alpha = 0.0;
        ewTextView.alpha = 1.0;
        
        // Commit the changes and perform the animation.
        [UIView commitAnimations];
        /*
         if (currentIndex == (words.count - 1)) {
         nextButton.enabled = NO;
         [nextButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
         [UIFont fontWithName:@"American Typewriter" size:15], NSFontAttributeName,
         [UIColor lightGrayColor], NSForegroundColorAttributeName,
         nil] forState:UIControlStateDisabled];
         
         UIAlertView *finishAlertView = [[UIAlertView alloc] initWithTitle:@"最後の単語です" message:@"解答後にメニューをタップして下さい" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
         [finishAlertView show];
         }*/
        
        yourScoreOnLabel.textColor = [UIColor whiteColor];
        progressBar.progressTintColor = [UIColor whiteColor];
        
        [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        tangoPauseButton.hidden = YES;
        tangoButton.hidden = NO;
        reibunButton.hidden = NO;
        reibunPauseButton.hidden = YES;
        stopButton.hidden = YES;
        nextButton.enabled = NO;
        //saveBlue.hidden = YES;
        tangoButton.enabled = NO;
        reibunButton.enabled = NO;
        [tangoButton setTitle:@"" forState:UIControlStateDisabled];
        [reibunPauseButton setTitle:@"" forState:UIControlStateDisabled];
        
        if (showWordButton.hidden) {
            showWordButton.hidden = NO;
            blueImageShowWord.hidden = NO;
        }
    }
    
    if (saveButton.hidden) {
        saveButton.hidden = NO;
        saveBlue.hidden = NO;
    }
    
    progressLabel.text =[[NSString alloc] initWithFormat:@"%d of 20", currentIndex + 1];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [checkTextField resignFirstResponder];
    return YES;
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [checkTextField setEnabled:NO];
    
    BOOL correct = [checkTextField.text isEqualToString:correctWord];
    
    if (correct)
    {
        hatuonLabel.hidden = NO;
        /*[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(hiddenSeikaiImage:)
         userInfo:nil repeats:NO];*/
        yourScore++;
        [yourScoreOnLabel setText:[NSString stringWithFormat:@"スコア %d", yourScore]];
        [hatuonLabel setText:correctHatuon];
        progressBar.progress += 0.05;
        yourScoreOnLabel.textColor = Rgb2UIColor(102, 255, 102);
        progressBar.progressTintColor = Rgb2UIColor(102, 255, 102);
        tangoButton.enabled = YES;
        [tangoButton setTitle:@"" forState:UIControlStateNormal];
        reibunButton.enabled = YES;
        [reibunButton setTitle:@"" forState:UIControlStateNormal];
        //saveBlue.hidden = YES;
        
        correctNumber += 1;
        //NSLog(@"%d", correctNumber);
    }else{
        hatuonLabel.hidden = NO;
        //saveButton.hidden = NO;
        answerLabel.hidden = NO;
        /*[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(hiddenHuseikaiImage:)
         userInfo:nil repeats:NO];*/
        [answerLabel setText:correctWord];
        [hatuonLabel setText:correctHatuon];
        [checkTextField setEnabled:NO];
        progressBar.progressTintColor = Rgb2UIColor(255, 5, 5);
        yourScoreOnLabel.textColor = Rgb2UIColor(255, 5, 5);
        tangoButton.enabled = YES;
        [tangoButton setTitle:@"" forState:UIControlStateNormal];
        reibunButton.enabled = YES;
        [reibunButton setTitle:@"" forState:UIControlStateNormal];
        //saveBlue.hidden = NO;
        
        inCorrectNumber += 1;
        //NSLog(@"%d", inCorrectNumber);
    }
    
    if (currentIndex == (words.count - 1)) {
        nextButton.enabled = NO;
        [nextButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                            [UIFont fontWithName:@"American Typewriter" size:15], NSFontAttributeName,
                                            [UIColor lightGrayColor], NSForegroundColorAttributeName,
                                            nil] forState:UIControlStateDisabled];
        
    }else{
        nextButton.enabled = YES;
    }
    
    //TestWord *wordData = [words objectAtIndex:currentIndex];
    //reibunString = [wordData reibun];
    if ([reibunString isEqual:@""]) {
        reibunButton.enabled = NO;
        [reibunButton setTitle:@"" forState:UIControlStateDisabled];
    }
}


- (IBAction)saveButton:(id)sender {
    // Create datacontroller and initialize database
    Data *dataController = [[Data alloc]init];
    [dataController initDatabase];
    sqlite3_stmt *statement = NULL;
    Word *word  = [[Word alloc]
                   initWithUniqueId:sqlite3_column_int(statement, 0) + 1
                   andWord:correctWord];
    
    // Insert the word
    [dataController insertWord:word];
    
    UIAlertView *alertViewForSaving = [[UIAlertView alloc] initWithTitle:@"保存しました" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertViewForSaving show];
    saveButton.hidden = YES;
    saveBlue.hidden = YES;
    
    if (!hatuonLabel.hidden) {
        if ([reibunString isEqual:@""]) {
            [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
            reibunButton.enabled = NO;
            [reibunButton setTitle:@"" forState:UIControlStateDisabled];
            tangoButton.enabled = YES;
            [tangoButton setTitle:@"" forState:UIControlStateNormal];
            tangoPauseButton.hidden = YES;
            tangoButton.hidden = NO;
            stopButton.hidden = YES;
        }else{
            [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
            tangoButton.enabled = YES;
            [tangoButton setTitle:@"" forState:UIControlStateNormal];
            reibunButton.enabled = YES;
            [reibunButton setTitle:@"" forState:UIControlStateNormal];
            tangoPauseButton.hidden = YES;
            tangoButton.hidden = NO;
            reibunButton.hidden = NO;
            reibunPauseButton.hidden = YES;
            stopButton.hidden = YES;
        }
    }
}

- (IBAction)tangoSaisei:(id)sender {
    //TestWord *wordData = [words objectAtIndex:currentIndex];
    //tangoString = [wordData name];
    
    if( self.speechSynthesizer.paused){
        [self.speechSynthesizer continueSpeaking];
    }else{
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:tangoString];
        
        AVSpeechSynthesisVoice* ENVoice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
        
        // voiceをAVSpeechUtteranceに指定。
        utterance.voice =  ENVoice;
        utterance.rate = 0.13;
        utterance.pitchMultiplier = 1.0;
        // AVSpeechSynthesizerにAVSpeechUtteranceを設定して読んでもらう
        [speechSynthesizer speakUtterance:utterance];
    }
    
    tangoButton.hidden = YES;
    tangoPauseButton.hidden = NO;
    stopButton.hidden = NO;
    reibunButton.enabled = NO;
    [reibunButton setTitle:@"" forState:UIControlStateDisabled];
}

- (IBAction)reibunSaisei:(id)sender {
    //TestWord *wordData = [words objectAtIndex:currentIndex];
    //reibunString = [wordData reibun];
    
    if( self.speechSynthesizer.paused){
        [self.speechSynthesizer continueSpeaking];
    }else{
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:reibunString];
        
        AVSpeechSynthesisVoice* ENVoice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
        
        // voiceをAVSpeechUtteranceに指定。
        utterance.voice =  ENVoice;
        utterance.rate = 0.13;
        utterance.pitchMultiplier = 1.0;
        // AVSpeechSynthesizerにAVSpeechUtteranceを設定して読んでもらう
        [speechSynthesizer speakUtterance:utterance];
    }
    
    reibunButton.hidden = YES;
    reibunPauseButton.hidden = NO;
    stopButton.hidden = NO;
    tangoButton.enabled = NO;
    [tangoButton setTitle:@"" forState:UIControlStateDisabled];
}

- (IBAction)stopAction:(id)sender {
    
    //TestWord *wordData = [words objectAtIndex:currentIndex];
    //reibunString = [wordData reibun];
    if ([reibunString isEqual:@""]) {
        [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        reibunButton.enabled = NO;
        [reibunButton setTitle:@"" forState:UIControlStateDisabled];
        tangoButton.enabled = YES;
        [tangoButton setTitle:@"" forState:UIControlStateNormal];
        tangoPauseButton.hidden = YES;
        tangoButton.hidden = NO;
        stopButton.hidden = YES;
    }else{
        [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        tangoButton.enabled = YES;
        [tangoButton setTitle:@"" forState:UIControlStateNormal];
        reibunButton.enabled = YES;
        [reibunButton setTitle:@"" forState:UIControlStateNormal];
        tangoPauseButton.hidden = YES;
        tangoButton.hidden = NO;
        reibunButton.hidden = NO;
        reibunPauseButton.hidden = YES;
        stopButton.hidden = YES;
    }
}


- (IBAction)tangoPauseAction:(id)sender {
    [self.speechSynthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    tangoPauseButton.hidden = YES;
    tangoButton.hidden = NO;
    reibunButton.enabled = NO;
    [reibunButton setTitle:@"" forState:UIControlStateDisabled];
}

- (IBAction)showHelpView:(id)sender {
    HelpViewController *helpView = [[HelpViewController alloc] init];
    [self presentViewController:helpView animated:YES completion:nil];
    
    progressBar.progress += 0.05;
    yourScoreOnLabel.textColor = Rgb2UIColor(102, 255, 102);
    progressBar.progressTintColor = Rgb2UIColor(102, 255, 102);
    tangoButton.enabled = YES;
    [tangoButton setTitle:@"" forState:UIControlStateNormal];
    reibunButton.enabled = YES;
    [reibunButton setTitle:@"" forState:UIControlStateNormal];
}

- (IBAction)lookToLearnStart:(id)sender {
    ewTextView.textAlignment = NSTextAlignmentLeft;
    
    _lookOrWrite = 2;
    
    [checkTextField setEnabled:YES];
    [ewTextView setEditable:NO];
    [ewTextView setSelectable:NO];
    
    [checkTextField setText:[NSString stringWithFormat:@""]];
    [checkTextField setPlaceholder:[NSString stringWithFormat:@"単語を見るをタップ"]];
    checkTextField.enabled = NO;
    
    // Create datacontroller and initialize database
    TestWordsData *dataController = [[TestWordsData alloc]init];
    [dataController initDatabase];
    NSArray *forDataList = [dataController wordInfo];
    dataList = forDataList;
    
    TestWords *dataInfo = [dataList objectAtIndex:currentIndex];
    detailText = [NSString stringWithFormat:@"%@", dataInfo.detail];
    correctHatuon = [NSString stringWithFormat:@"%@", dataInfo.hatuon];
    correctWord = [NSString stringWithFormat:@"%@", dataInfo.word];
    reibunString = [NSString stringWithFormat:@"%@", dataInfo.reibun];
    tangoString = [NSString stringWithFormat:@"%@", dataInfo.word];
    
    [ewTextView setText:detailText];
    
    [UIView beginAnimations:@"fadeIn" context:nil];
    [UIView setAnimationDuration:0.5];
    
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    
    [ewTextView setSelectable:YES];
    [ewTextView setTextColor:[UIColor blackColor]];
    // Make the animatable changes.
    ewTextView.alpha = 0.0;
    ewTextView.alpha = 1.0;
    
    // Commit the changes and perform the animation.
    [UIView commitAnimations];
    
    //TestWord *wordToStart = [words objectAtIndex:currentIndex];
    //correctName = wordToStart.name;
    //correctHatuon = wordToStart.hatuon;
    //[ewTextView setText:[NSString stringWithFormat:@"%@", wordToStart.detail]];
    
    startButton.hidden = YES;
    startButton.enabled = NO;
    /*NSLog(@"%d", currentIndex);*/
    reibunLabel.hidden = NO;
    reibunButton.hidden = NO;
    tangoLabel.hidden = NO;
    tangoButton.hidden = NO;
    yourScoreOnLabel.hidden = YES;
    progressBar.hidden = NO;
    textSizeButton.hidden = NO;
    textSizeBlue.hidden = NO;
    startBlue.hidden = YES;
    tangoButton.enabled = NO;
    reibunButton.enabled = NO;
    [tangoButton setTitle:@"" forState:UIControlStateDisabled];
    [reibunPauseButton setTitle:@"" forState:UIControlStateDisabled];
    saveBlue.hidden = NO;
    saveButton.hidden = NO;
    infoButton.hidden = YES;
    showHelpViewButton.hidden = YES;
    lookToLearnButton.hidden = YES;
    blueImageLookStart.hidden = YES;
    showWordButton.hidden = NO;
    blueImageShowWord.hidden = NO;
    progressLabel.hidden = NO;
}

- (IBAction)showWord:(id)sender {
    hatuonLabel.hidden = NO;
    //saveButton.hidden = NO;
    answerLabel.hidden = NO;
    /*[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(hiddenHuseikaiImage:)
     userInfo:nil repeats:NO];*/
    [answerLabel setText:correctWord];
    [hatuonLabel setText:correctHatuon];
    tangoButton.enabled = YES;
    reibunButton.enabled = YES;
    progressBar.progress += 0.05;
    progressBar.progressTintColor = Rgb2UIColor(102, 255, 102);
    
    if (currentIndex == (words.count - 1)) {
        nextButton.enabled = NO;
        [nextButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                            [UIFont fontWithName:@"American Typewriter" size:15], NSFontAttributeName,
                                            [UIColor lightGrayColor], NSForegroundColorAttributeName,
                                            nil] forState:UIControlStateDisabled];
        
    }else{
        nextButton.enabled = YES;
    }
    
    //TestWord *wordData = [words objectAtIndex:currentIndex];
    //reibunString = [wordData reibun];
    if ([reibunString isEqual:@""]) {
        reibunButton.enabled = NO;
        [reibunButton setTitle:@"" forState:UIControlStateDisabled];
    }
    
    showWordButton.hidden = YES;
    blueImageShowWord.hidden = YES;
}

- (IBAction)reibunPauseAction:(id)sender {
    [self.speechSynthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    reibunButton.hidden = NO;
    reibunPauseButton.hidden = YES;
    tangoButton.enabled = NO;
    [tangoButton setTitle:@"" forState:UIControlStateDisabled];
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance
{
    if (!hatuonLabel.hidden) {
        if ([reibunString isEqual:@""]) {
            [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
            reibunButton.enabled = NO;
            [reibunButton setTitle:@"" forState:UIControlStateDisabled];
            tangoButton.enabled = YES;
            [tangoButton setTitle:@"" forState:UIControlStateNormal];
            tangoPauseButton.hidden = YES;
            tangoButton.hidden = NO;
            stopButton.hidden = YES;
        }else{
            [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
            tangoButton.enabled = YES;
            [tangoButton setTitle:@"" forState:UIControlStateNormal];
            reibunButton.enabled = YES;
            [reibunButton setTitle:@"" forState:UIControlStateNormal];
            tangoPauseButton.hidden = YES;
            tangoButton.hidden = NO;
            reibunButton.hidden = NO;
            reibunPauseButton.hidden = YES;
            stopButton.hidden = YES;
        }
        
    }else{
        [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        tangoPauseButton.hidden = YES;
        tangoButton.hidden = NO;
        reibunButton.hidden = NO;
        reibunPauseButton.hidden = YES;
        stopButton.hidden = YES;
        nextButton.enabled = NO;
        saveBlue.hidden = YES;
        tangoButton.enabled = NO;
        reibunButton.enabled = NO;
        [tangoButton setTitle:@"" forState:UIControlStateDisabled];
        [reibunPauseButton setTitle:@"" forState:UIControlStateDisabled];
    }
}

- (void)view_SwipeLeft:(UISwipeGestureRecognizer *)sender
{
    //右 から 左に変更
    if (startButton.hidden && !hatuonLabel.hidden && currentIndex < 19) {
        currentIndex++;
        /* NSLog(@"%d", currentIndex);*/
        
        //TestWord *wordData = [words objectAtIndex:currentIndex];
        //correctName = [wordData name];
        //correctHatuon = [wordData hatuon];
        
        /* NSLog(@"%@ %@", wordData.name, wordData.hatuon);*/
        
        if (_lookOrWrite == 1) {
            // Create datacontroller and initialize database
            TestWordsData *dataController = [[TestWordsData alloc]init];
            [dataController initDatabase];
            NSArray *forDataList = [dataController wordInfo];
            dataList = forDataList;
            
            TestWords *dataInfo = [dataList objectAtIndex:currentIndex];
            detailText = [NSString stringWithFormat:@"%@", dataInfo.detail];
            correctHatuon = [NSString stringWithFormat:@"%@", dataInfo.hatuon];
            correctWord = [NSString stringWithFormat:@"%@", dataInfo.word];
            reibunString = [NSString stringWithFormat:@"%@", dataInfo.reibun];
            tangoString = [NSString stringWithFormat:@"%@", dataInfo.word];
            
            /* NSLog(@"%d", currentIndex);*/
            
            //TestWord *wordData = [words objectAtIndex:currentIndex];
            //correctName = [wordData name];
            //correctHatuon = [wordData hatuon];
            
            /* NSLog(@"%@ %@", wordData.name, wordData.hatuon);*/
            
            [checkTextField setEnabled:YES];
            [ewTextView setEditable:NO];
            [ewTextView setSelectable:NO];
            
            [checkTextField setText:[NSString stringWithFormat:@""]];
            [checkTextField setPlaceholder:[NSString stringWithFormat:@"単語入力"]];
            [answerLabel setText:@""];
            
            hatuonLabel.hidden = YES;
            //saveButton.hidden = YES;
            
            [hatuonLabel setText:correctHatuon];
            [ewTextView setText:detailText];
            
            [UIView beginAnimations:@"fadeIn" context:nil];
            [UIView setAnimationDuration:0.5];
            
            [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
            
            [ewTextView setSelectable:YES];
            
            // Make the animatable changes.
            ewTextView.alpha = 0.0;
            ewTextView.alpha = 1.0;
            
            // Commit the changes and perform the animation.
            [UIView commitAnimations];
            
            /*
             if (currentIndex == (words.count - 1)) {
             nextButton.enabled = NO;
             [nextButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
             [UIFont fontWithName:@"American Typewriter" size:15], NSFontAttributeName,
             [UIColor lightGrayColor], NSForegroundColorAttributeName,
             nil] forState:UIControlStateDisabled];
             
             UIAlertView *finishAlertView = [[UIAlertView alloc] initWithTitle:@"最後の単語です" message:@"解答後にメニューをタップして下さい" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
             [finishAlertView show];
             }*/
            
            yourScoreOnLabel.textColor = [UIColor whiteColor];
            progressBar.progressTintColor = [UIColor whiteColor];
            
            [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
            tangoPauseButton.hidden = YES;
            tangoButton.hidden = NO;
            reibunButton.hidden = NO;
            reibunPauseButton.hidden = YES;
            stopButton.hidden = YES;
            nextButton.enabled = NO;
            //saveBlue.hidden = YES;
            tangoButton.enabled = NO;
            reibunButton.enabled = NO;
            [tangoButton setTitle:@"" forState:UIControlStateDisabled];
            [reibunPauseButton setTitle:@"" forState:UIControlStateDisabled];
            showWordButton.hidden = YES;
            blueImageShowWord.hidden = YES;
        }else{
            // Create datacontroller and initialize database
            TestWordsData *dataController = [[TestWordsData alloc]init];
            [dataController initDatabase];
            NSArray *forDataList = [dataController wordInfo];
            dataList = forDataList;
            
            TestWords *dataInfo = [dataList objectAtIndex:currentIndex];
            detailText = [NSString stringWithFormat:@"%@", dataInfo.detail];
            correctHatuon = [NSString stringWithFormat:@"%@", dataInfo.hatuon];
            correctWord = [NSString stringWithFormat:@"%@", dataInfo.word];
            reibunString = [NSString stringWithFormat:@"%@", dataInfo.reibun];
            tangoString = [NSString stringWithFormat:@"%@", dataInfo.word];
            
            /* NSLog(@"%d", currentIndex);*/
            
            //TestWord *wordData = [words objectAtIndex:currentIndex];
            //correctName = [wordData name];
            //correctHatuon = [wordData hatuon];
            
            /* NSLog(@"%@ %@", wordData.name, wordData.hatuon);*/
            
            [ewTextView setEditable:NO];
            [ewTextView setSelectable:NO];
            
            [checkTextField setText:[NSString stringWithFormat:@""]];
            [checkTextField setPlaceholder:[NSString stringWithFormat:@"単語を見るをタップ"]];
            checkTextField.enabled = NO;
            
            [answerLabel setText:@""];
            
            yourScoreOnLabel.hidden = YES;
            hatuonLabel.hidden = YES;
            //showWordButton.hidden = NO;
            //blueImageShowWord.hidden = NO;
            //saveButton.hidden = YES;
            
            [hatuonLabel setText:correctHatuon];
            [ewTextView setText:detailText];
            
            [UIView beginAnimations:@"fadeIn" context:nil];
            [UIView setAnimationDuration:0.5];
            
            [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
            
            [ewTextView setSelectable:YES];
            
            // Make the animatable changes.
            ewTextView.alpha = 0.0;
            ewTextView.alpha = 1.0;
            
            // Commit the changes and perform the animation.
            [UIView commitAnimations];
            
            /*
             if (currentIndex == (words.count - 1)) {
             nextButton.enabled = NO;
             [nextButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
             [UIFont fontWithName:@"American Typewriter" size:15], NSFontAttributeName,
             [UIColor lightGrayColor], NSForegroundColorAttributeName,
             nil] forState:UIControlStateDisabled];
             
             UIAlertView *finishAlertView = [[UIAlertView alloc] initWithTitle:@"最後の単語です" message:@"解答後にメニューをタップして下さい" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
             [finishAlertView show];
             }*/
            
            yourScoreOnLabel.textColor = [UIColor whiteColor];
            progressBar.progressTintColor = [UIColor whiteColor];
            
            [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
            tangoPauseButton.hidden = YES;
            tangoButton.hidden = NO;
            reibunButton.hidden = NO;
            reibunPauseButton.hidden = YES;
            stopButton.hidden = YES;
            nextButton.enabled = NO;
            //saveBlue.hidden = YES;
            tangoButton.enabled = NO;
            reibunButton.enabled = NO;
            [tangoButton setTitle:@"" forState:UIControlStateDisabled];
            [reibunPauseButton setTitle:@"" forState:UIControlStateDisabled];
            
            if (showWordButton.hidden) {
                showWordButton.hidden = NO;
                blueImageShowWord.hidden = NO;
            }
        }
        
        if (saveButton.hidden) {
            saveButton.hidden = NO;
            saveBlue.hidden = NO;
        }
        
        progressLabel.text =[[NSString alloc] initWithFormat:@"%d of 20", currentIndex + 1];
    }
}

@end
