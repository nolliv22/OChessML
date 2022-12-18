#load "graphics.cma";;
open Graphics;;
let cavalier1 = make_image
[|
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; 0; 0; 0; -1; -1; -1; 0; 0; 0; 0; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; 0; 0; 0; 0; 0; -1; 0; 0; 0; 0; 0; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 657930; 2105376; 921102; 0; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 4210752; 9803157; 8553090; 5855577; 2500134; 0; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 65793; 4802889; 12434877; 14869218; 13619151; 10066329; 4934475; 723723; 0; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; 0; 0; 0; 723723; 1973790; 526344; 0; 0; 0; 0; 0; 0; 526344; 2236962; 5855577; 11908533; 15329769; 12829635; 6118749; 921102; 0; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; 0; 0; 789516; 8224125; 12500670; 4276545; 0; 0; 0; 0; 0; 0; 0; 0; 65793; 1710618; 8026746; 14803425; 13948116; 6118749; 723723; 0; -1; -1; -1; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; 0; 0; 0; 4737096; 15066597; 14737632; 4605510; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 723723; 6908265; 14935011; 13158600; 4802889; 0; 5066061; -1; -1; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; 0; 0; 0; 0; 7895160; 15987699; 10395294; 1513239; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 789516; 8224125; 15790320; 10855845; 2565927; 0; -1; -1; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; 0; 0; 0; 0; 3750201; 7631988; 2763306; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 1776411; 11645361; 15329769; 6776679; 460551; 0; -1; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; 0; 0; 0; 0; 0; 131586; 263172; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 65793; 5066061; 15132390; 11974326; 2631720; 0; 592137; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 1250067; 10658466; 15527148; 5921370; 197379; -1; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 5921370; 15395562; 10197915; 1184274; 0; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 2697513; 13092807; 13750737; 3026478; 0; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 789516; 10132122; 15527148; 5789784; 65793; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; 0; 0; 657930; 5000268; 5000268; 657930; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 7237230; 15461355; 8553090; 263172; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; 0; 0; 2763306; 13224393; 13224393; 2763306; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 4934475; 14935011; 10921638; 1184274; 0; -1; -1; -1; -1; -1|];
[|-1; -1; -1; 0; 0; 0; 1381653; 8421504; 8421504; 1381653; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 3158064; 14145495; 12698049; 2500134; 0; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; 0; 0; 0; 460551; 460551; 0; 0; 0; 0; 0; 0; 0; 0; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 1907997; 13092807; 13948116; 3815994; 0; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 1118481; 11974326; 14606046; 4934475; 0; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 657930; 10987431; 15000804; 5855577; 0; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 394758; 10197915; 15329769; 6579300; 0; 197379; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; 0; 0; 0; 0; 0; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 197379; 9737364; 15527148; 7105644; 0; 13684944; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 197379; 9408399; 15658734; 7434609; 0; 0; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 197379; 9276813; 15724527; 7566195; 0; 0; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 197379; 9408399; 15724527; 7631988; 0; 0; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 197379; 9803157; 15724527; 7434609; 0; 0; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 394758; 10197915; 15724527; 7171437; 0; 0; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 460551; 9671571; 14277081; 6184542; 0; 0; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 394758; 6579300; 9474192; 4079166; 0; 131586; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1|];
[|-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1|];
|];;