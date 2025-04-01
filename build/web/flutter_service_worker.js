'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "7052ca82bc0c12d1d3edcf9bed39edb6",
"assets/AssetManifest.bin.json": "389f02f4cb3d6e07798d8fb846599390",
"assets/AssetManifest.json": "82abf33dfb964c2fc095dde5243a57ab",
"assets/assets/16%2520(1).png": "2292910f7353ebbf296b90c5b821543c",
"assets/assets/17.png": "2366ec8f98bbcad6113639aada61095c",
"assets/assets/3dcoin.png": "67728643c942409eadccbf7d86340090",
"assets/assets/alarm.png": "27189a0074c51332172c616529607cf2",
"assets/assets/alarmb.png": "7d96cb284c65da18719854080d78461b",
"assets/assets/Already.png": "13700a39a17b3f60c6e92a9811b511c9",
"assets/assets/america_flag.png": "5901bf50ce44e8dde715ecd5153a6409",
"assets/assets/apple.png": "80abf2defeb4ae97b8b754ce0a2b214d",
"assets/assets/applewatch.png": "7843cc81c8e78c74dc7d1cb2e3ff5847",
"assets/assets/assetchart.png": "70d317ca403f4de1db3e9c22359ac23e",
"assets/assets/Badges/baby.png": "95a9bd6abe7c247f40fc408da6b2f3ba",
"assets/assets/Badges/early.png": "5245e7985018378bbeb4e4fde87b3e9c",
"assets/assets/Badges/finwhiz.png": "97cd7b89b791cb88d091c176999c5289",
"assets/assets/Badges/piggybank.png": "17ac59cf1971819a4d38c297d88054b3",
"assets/assets/Badges/pretty.png": "3466ae746d5e526850c6d594c99d0c46",
"assets/assets/Badges/welcome.png": "a847c2e907ea62a56fd12c77008968b1",
"assets/assets/badmilk.png": "8f17488aa1f885851364a4c4cbb66480",
"assets/assets/bank.png": "cd0f149966ec833fcfd6786453ba631c",
"assets/assets/banky.png": "05a7e3da3cc05df315265f0b988d0be3",
"assets/assets/banky2.png": "6081757cde1d67ef841ff4fd730de69a",
"assets/assets/beach_background.png": "6776daec7f2070fce4d8bb4fd72d3559",
"assets/assets/bebe.png": "6f8e471a08e48113e907a2749dbd0494",
"assets/assets/big%2520green.png": "dc15ccb53e05b42c224c285874b51e24",
"assets/assets/bike%2520coinwa.png": "899ee1bfd2c165e49e761dda18ba4513",
"assets/assets/bird_mail.png": "1055147445fec64972c2ec7c0e6768ad",
"assets/assets/blackhouse.png": "3ff3432f12a509339dfc4c58d9afd1ad",
"assets/assets/blackhouse2.png": "6e98f76c1c931737b8a95f5d24a52209",
"assets/assets/blank.png": "27615fb0bd04a8c3d8e7281b2571e136",
"assets/assets/blankcreditscore.png": "18998d39c192cac13d0e6ab5939e8b4b",
"assets/assets/boogle.png": "253fcee268608fb74e6fd9c9a5a550be",
"assets/assets/books.png": "0349a8c7f0485947eede0c3489322be6",
"assets/assets/bracket1coin.png": "6942915f852def8dc6aa4fe86517f0ea",
"assets/assets/bracket2coin.png": "d946b942d89438bcf70f514776ee62c9",
"assets/assets/bracket3coin.png": "29a937aef73188e3d4923139e40e99cc",
"assets/assets/bracket4coin.png": "fc375ed297675f9396dee04971912527",
"assets/assets/bracket5coin.png": "1936530a1bfcdc868ba0b32a1865ea56",
"assets/assets/building.png": "bf33591b2b2e373f68430c72d6685b22",
"assets/assets/busbob.png": "158b32d629bbc071e97d123d071ef125",
"assets/assets/buscard.png": "1dcc93005d6c709f149630b916b6c031",
"assets/assets/busstop.png": "a75633920f7bab61bf15d9d6e445678f",
"assets/assets/buzman.png": "9171bb9a138f8e8df422a72919d6addd",
"assets/assets/calendar.png": "9099b0306b121b6924ffc7ad802c8fd7",
"assets/assets/calendarb.png": "fefef63769710efcb5e4e9806dd2ecfa",
"assets/assets/calling_wawa.png": "c6a72d98fdac7f172251ae86b8920daf",
"assets/assets/canada_flag.png": "f46e210d72ed9c3c5764649d80102be7",
"assets/assets/cardexplain.png": "c4d6d81614da72f20908ade1372ffd74",
"assets/assets/cart.png": "0d7cb222819f8df49a0e90eb543d95cc",
"assets/assets/cartb.png": "1499488a53afb444f0566662692335be",
"assets/assets/cartonmilk.png": "41108a9ee7a4c7d9345677c059a7b824",
"assets/assets/check.png": "0599cf8dc16d14e7de88ff4e4c42b1b2",
"assets/assets/circled.png": "c93b317e2a178482a01a8e998f51aba7",
"assets/assets/circleframe.png": "41af2de5da5b6c3a12703999b104e8c3",
"assets/assets/cityroad.png": "6126c1119a9de73ae829642c1c007e67",
"assets/assets/Coin-3/piechart1.png": "4148a9491152a8adfee7233eda691e03",
"assets/assets/Coin-3/piechart2.png": "0c88df982dda530cfd867d3505a43405",
"assets/assets/Coin-3/tape.png": "3be50ee9faca671ad08508f8db16e82d",
"assets/assets/Coin-3/wawaCalendar.png": "dd6a4b64323aaf01b65001a54500736d",
"assets/assets/Coin-3/wawaGirl1.png": "3b70c0080ec58be480f52f1b20d2f95a",
"assets/assets/Coin-3/wawaGirl2.png": "0d3cd3f68673dcdbb77334a7eb9174f6",
"assets/assets/Coin-4/bookshelf_family.png": "e9f81dfb0f0aa8189a656dc89c3ffb90",
"assets/assets/Coin-4/bookshelf_laptop.png": "a7b8d39e608351e857824903d395081c",
"assets/assets/Coin-4/bookshelf_phone.png": "18ef47f8a82cc7567f6cc6e9846b8b9e",
"assets/assets/Coin-4/bookshelf_pig.png": "89518f44b668ddb0ea982fc61019c66b",
"assets/assets/Coin-4/cash.png": "7eebe569b7c20f3009af7ef5eea5bde7",
"assets/assets/Coin-4/desk_closed.png": "f90b48e615500dd0f07077f3e32e4f6e",
"assets/assets/Coin-4/desk_open.png": "922b63dd03213e71585aa4da8943a452",
"assets/assets/Coin-4/lego1.png": "79b4f56c6c0dd0c7851f731217b9d70a",
"assets/assets/Coin-4/lego2.png": "238ba91ebca99b68a388854cdde018dc",
"assets/assets/Coin-4/lego3.png": "992dc2427496d8e701a7bda17f412c4b",
"assets/assets/Coin-4/money_arrow.png": "828888a0742a7e79fb8f77b6e6632a2d",
"assets/assets/Coin-4/money_jar.png": "e64aa7cfe9256a96468ea1b75537520a",
"assets/assets/Coin-4/wawaBack.png": "17c78c1d805ae898c3d4d54dd6c93eca",
"assets/assets/Coin-4/wawaCash.png": "2b760bbd4cc7e361bbc0c54d86a7e8ad",
"assets/assets/Coin-4/wawaJar1.png": "21bc39b28d0f91a68dd61f2afd6024fb",
"assets/assets/Coin-4/wawaJar2.png": "0d1309123a2b943c7685efc28471f8b1",
"assets/assets/coin.png": "7a21d7814ad57f6e83c54636dd590a6d",
"assets/assets/coin17headercash.png": "b51bd00c31d517f51ecb382a5d73c5c4",
"assets/assets/coin1mask.png": "4c6eda0426ae7e6f9c51b2463e9ebb21",
"assets/assets/coin2phone.png": "b4d7fd439e163079a637c500d2616966",
"assets/assets/coinstack.png": "8957c214cdf1b7d9d7c8f86d51a280b9",
"assets/assets/coinwaarrow.png": "c3c14a7353dcf0cdd90c2f5d0dd7a9bb",
"assets/assets/coinwalogo.png": "6639d254940517e620077941d07f6697",
"assets/assets/coinwa_big_pig.png": "59651680fa435b1604855714548523d6",
"assets/assets/coin_blue.png": "54959cd6d884ed64e7ae220dc0349051",
"assets/assets/coin_green.png": "8b832cdfbc7d68d495948e1ea5636590",
"assets/assets/coin_level.png": "a2daae95ccf3b2d6e0e17059d4a31909",
"assets/assets/coin_purple.png": "c2ec280522d8e78fa9db252cad57000d",
"assets/assets/coin_red.png": "06573bccf03897b178b59e0352790ff9",
"assets/assets/coin_sky.png": "16b1703a9f08b3350d651069b5514037",
"assets/assets/coin_yellow.png": "1e1c813d74f75481308aec230664af74",
"assets/assets/confetti.png": "a5b3bd5d268cf23e96bc1d3a8acfe5a9",
"assets/assets/confet_coin.png": "86b2834371322913fa3146537ed30316",
"assets/assets/construction.png": "19c6c638f0a9bbd264f5dacf1a93f88b",
"assets/assets/controller.png": "b87e5b6f5aab6403c7589aed21ccc085",
"assets/assets/corporatewawa.png": "0469724bb39947cdb304fc304d287a97",
"assets/assets/create_account-removebg-preview.png": "fcacf27f1097208893fa237233bf139e",
"assets/assets/creditCardCoin.png": "1c143351333eb6a8484a26616b86934f",
"assets/assets/creditcardintro.png": "197952a73393234857f2b22adfa77559",
"assets/assets/creditscore.png": "f18190602400cc534e5d91c8264c93bf",
"assets/assets/cutecard.png": "2b2b4135e11a089db54c274862b7f13e",
"assets/assets/debtrock.png": "daf8d9d6917ac6441f3b9a5b6ffa0b90",
"assets/assets/defaultguy.png": "13dc11a3c89f2cf7a068d6ae374fef32",
"assets/assets/defaultwoman.png": "5f0eaa00d703dd21de52c73bec2defec",
"assets/assets/desk.png": "59069a18ccbacbe87f04236f238377c1",
"assets/assets/document-boogle.png": "4d2c8c58afcf6207fa10983c798d5c7b",
"assets/assets/dragonegghatch.png": "853a844ac3aacef9561fdfb98b431aa0",
"assets/assets/dropCoin.png": "6194434a72c547555f9788f56f0149e4",
"assets/assets/eggs.png": "4426a3b317dd9e30e0da11b7112ef096",
"assets/assets/Ellipse_64.png": "a515607a94de3d4f6005a139a1064c7a",
"assets/assets/Ellipse_64_1.png": "8eaa9b3000f8939e73fb45fdebd1a087",
"assets/assets/Ellipse_65.png": "a64f46e86322ea0655b04b199be8a5f8",
"assets/assets/end_page_background.png": "9d94274cf8ca398d28f46cdf8d7e0263",
"assets/assets/evilcard.png": "69d3358584b3bbc9614bb9aa884437ed",
"assets/assets/exbadges.png": "8f6ce5e4a8adcbdf2755dacb3ff5053e",
"assets/assets/expaper.png": "e4d265805cc9deed25c6a985b2085b9c",
"assets/assets/file-boogle.png": "92b7585a95cac4f8c12a8c3c6cff1ab0",
"assets/assets/fire_wawa.png": "aeb7c9c44f1d94c474950ff17bd0cc85",
"assets/assets/flatcoin.png": "48c6b6357eaf6d1f9101e60f13bd3c2e",
"assets/assets/forgotwawa.png": "a046065acc4d4c945d3494f891ea832a",
"assets/assets/Frame_34276-removebg-preview.png": "8830d05b3fb8cbfd6f816a173da92e48",
"assets/assets/game.png": "949a4cb420a05f43d06943adbe9fe5f5",
"assets/assets/get_started.png": "6f73d535c205b458ee3cc27427d1c8cb",
"assets/assets/globe.png": "85deefb7e3f3985fb04f0319d736ab5c",
"assets/assets/gold-dollar-coin-icon-isometric-style-vector.jpg": "adea5047876dca1ea8326360916ce4aa",
"assets/assets/govern.png": "6b2c3387365d41c8e00b521e2cd647f3",
"assets/assets/government.png": "2ccaafabdc10ebacb840bfb22524bbeb",
"assets/assets/grad.png": "889e5ee63daaa50df5928b1b459de6f7",
"assets/assets/gradb.png": "c0f6bb6c384affb22d0987654fe7dd15",
"assets/assets/gradient.png": "64b06b74fc0b343f2c45e5d55cbcb726",
"assets/assets/grave.png": "459705d97d13dd6ff4d2bc80eb7d49e2",
"assets/assets/greenbut.png": "642750267d658fdd7e78eac37eee656a",
"assets/assets/greenpiggy.png": "fa64314a12cf8d0c10b4cb719105b1d9",
"assets/assets/green_wa.png": "3f02d3f45fe2634fbdc2aba3d2cd0e1f",
"assets/assets/halfpig_green.png": "08272d2e92892e2ad9caa857774cf84f",
"assets/assets/half_piggy.png": "27a84cd3c0f0398577bcdb723b292639",
"assets/assets/hammer.png": "29fc151c1093952481f805b7c4fc2193",
"assets/assets/hammerb.png": "44ab3cb08a2d816936589a02e1800a70",
"assets/assets/heart.png": "1baf25abf170dacc07495e500b9d8fe1",
"assets/assets/hello2frame.png": "b82e6579322cceb65274ef04ddb4c20b",
"assets/assets/hexagon.png": "3fc22cc67fc809606016600d77e2c3f5",
"assets/assets/home_page.png": "8732c206ab930751fdae4342d86d2618",
"assets/assets/hospital.png": "5e8c2a16b619935b8da220ead5bfffe1",
"assets/assets/house.png": "95695e41779f55a8f54a47e092723e1e",
"assets/assets/icecream.png": "8ee76ff8b992e99b66d3a7e301e1a594",
"assets/assets/ice_wawa.png": "9fa2914fc7f8ddc2486476d9218095e4",
"assets/assets/Im_Not_New.png": "b705749f6a0026aec98a2674432f7271",
"assets/assets/income.png": "b3bea5e5d910acca26afa149859987f6",
"assets/assets/ladderwawa.png": "dc88a4c86c53e6bd545c3b8316a9f132",
"assets/assets/laptop.png": "1334fb1bb45bef7d19113c60db71e9d7",
"assets/assets/leaderboard/goldbar.png": "1cba7dba3b388945762ae71089e0ce2f",
"assets/assets/leaderboard/trophy.png": "58ec890323286dd4c789a81d97deda94",
"assets/assets/letter-old.png": "b6efc8c72c85a1088774bc396d72dc84",
"assets/assets/letter.png": "975b3222d105c4a3605da01a41b35653",
"assets/assets/login-removebg-preview.png": "d2118a96c5235e4bc9cd1fcc04be19be",
"assets/assets/logo.png": "a8246a71c7b78b8e0a5afa49a7956dbf",
"assets/assets/logo2.png": "ed1004a25c7dbb16866271100d9a5906",
"assets/assets/LogoText.png": "7e8e5f6aafdc122fd96e79e1cc97bf9b",
"assets/assets/LogoText2.png": "58057ee8b98d65998256551a2e06ae73",
"assets/assets/longladder.png": "8bba1a3f55117dcea8983427eacd71a7",
"assets/assets/longsky.png": "89b475168ac3e4e69d9a24e49873a696",
"assets/assets/lowmoney.png": "b9748eb66d0a4d80197ae87f61a90925",
"assets/assets/magichat.png": "f5bc18c2652bd8a2c1a0654a944b1d16",
"assets/assets/magicwawa.png": "13d23b61edb137c4442ca48826cf9738",
"assets/assets/magnifying_detective_wawa.png": "ed46a78bb64d6ddd3025641f9e29aa01",
"assets/assets/mediummoney.png": "215a51b4bc83ba34b2d1e5f8d277170a",
"assets/assets/milk.png": "8466fe206272aec0dd7704cee95568f9",
"assets/assets/moneyrain.png": "2d2d8ba61ebe306e8e0fe5d54e1c992b",
"assets/assets/mostmoney.png": "6b340bb544f3d017c8f185d49764c84b",
"assets/assets/mystery.png": "f03f9b854b4ed1c163b1ed3f4c9a6f6a",
"assets/assets/mystery_box.png": "bc4cae4d803fb1e7aeea438146e3cfac",
"assets/assets/notebook.png": "37dc5be1c105a3f11e4b620cab4d1f9b",
"assets/assets/OFFICIAL_COINWA_LOGO.png": "dcddf241da91bd3a2c41333247cdade6",
"assets/assets/ogwawa.png": "9415967f810a0af8940644d9784a9f7c",
"assets/assets/old.png": "98545f432a59b6459c85d5bf0487c48d",
"assets/assets/openhands.png": "2abfc95b55895802be695949f3c5ba0c",
"assets/assets/openwallet.png": "43bd9149e086d7413acdda2338a1ce48",
"assets/assets/orange_wa.png": "99a550c3043cebde2076e1c311afae6c",
"assets/assets/paintcircle.png": "cae297a8a77a99f111890fccbfe531db",
"assets/assets/painting.png": "d1f625b561ba195180da85e08ba84644",
"assets/assets/parentglow.png": "e9f81dfb0f0aa8189a656dc89c3ffb90",
"assets/assets/parentintro.png": "b6ff7e8288785540aa1a3e1ad4809efd",
"assets/assets/partyhatcircle.png": "fe9fc027ca4ea33902d251b649b90c3f",
"assets/assets/party_wawa.png": "f37e921316419b430dda3bd8fa7772d9",
"assets/assets/pause.png": "82f62150bdd81ae45ee6f271d39fb605",
"assets/assets/peace.png": "0859894a5e6c2d38a4ffec5d51a5cf0a",
"assets/assets/peaceb.png": "f8c0c93d44ddbbb50fdc9d4f246aa7c2",
"assets/assets/phonedata.png": "b4280a02a1d1ee530c248f675bd19915",
"assets/assets/phoneglow.png": "2e8d38505ae99c32c2af26ef2c002794",
"assets/assets/phonenoglow.png": "4a98ba08212d7dab03f1617d91e43cde",
"assets/assets/pigcoin2.png": "f499473255faf8732eb9869b8521df92",
"assets/assets/pigdollarfly.png": "a8bd8e57dbe4680540d1f933e00b2862",
"assets/assets/pigdollarsave.png": "dcb995bf961117acc0b8ce208aae9e0e",
"assets/assets/pigshelf.png": "c8dc4e8cc4e716ca67e79fd4eda9205d",
"assets/assets/pigspeech.png": "7b9fefb42f38de5c34c29e9925fe9b69",
"assets/assets/pigwalletthink.png": "2d895af20860498c7d1595b5576cb661",
"assets/assets/pink_piggy.png": "4f7434150d79460c2be67de0841043cc",
"assets/assets/plant.png": "2e3d0efa68819277c0970f023ee85e12",
"assets/assets/police.png": "c753b04e610081da39d344c1f090e77c",
"assets/assets/police_badge.png": "48fe3367f13caf55fc843cbbe5460e4d",
"assets/assets/profileback.png": "be3c4715d9bfbd12987ceb11f30a85ac",
"assets/assets/purse.png": "7447034714744c09f07196aed29cb700",
"assets/assets/rarecoin.png": "680d5f6876b8ec91f874ae38d4cc292f",
"assets/assets/receipt.png": "22339f1996fba302aa5194b94faca44c",
"assets/assets/redx.png": "9563f1064ec1b2f75c0803fc3db97d53",
"assets/assets/red_wa.png": "530339dd752c428d63a166d9b6d95e1c",
"assets/assets/regrob.png": "11c5787495771d051639d26492543aba",
"assets/assets/richtextriangle.png": "0f92b246100f01140f7fc1a46a0b49c6",
"assets/assets/richwawa.png": "754ca4184b5374a962295f545e6aa1e4",
"assets/assets/richwawahandmoney.png": "6faf2d57e7ce67f912d675d8922410be",
"assets/assets/savinggoal.png": "152605ed056a78feb8f942d3d0238eb4",
"assets/assets/savingjar.png": "85c74fee9bdf2f99706a6054fb6f0e71",
"assets/assets/scattered-papers.png": "0b9a25a395395006920fd735e708d029",
"assets/assets/scenario_alarm.png": "32a622486e9675fdccab6d670182934b",
"assets/assets/scenario_calendar.png": "5531a49b1d091f99da0dcf029cd462c2",
"assets/assets/scenario_cart.png": "2d5159748d15877b4a8557dffd037c94",
"assets/assets/scenario_grad.png": "57f6100c0b402d03c34fde765fe4bbbc",
"assets/assets/scenario_hammer.png": "e82859404daab4d2f39fc89115902f38",
"assets/assets/scenario_peace.png": "c291f3f59080c9062df39a79b5220332",
"assets/assets/scene1.png": "b9a04eaf53434fbf0633c53d9c5b8ebc",
"assets/assets/school.png": "2e331b6fd15c591968c70b06a9a42ebe",
"assets/assets/shakecoin.png": "37b753ea03e0ae7ad626ed5d34469384",
"assets/assets/Shopping_Icons/apple.png": "a04623e1c3fbd29f6d10da7c9bc09367",
"assets/assets/Shopping_Icons/banana.png": "25119ca3f3d2d4912904d850751b174e",
"assets/assets/Shopping_Icons/bigcart.png": "d2ff6b9e73e127950af08ca9870fa293",
"assets/assets/Shopping_Icons/chocolate.png": "ec32584fc814b2b3d3c87bfd205310ec",
"assets/assets/Shopping_Icons/egg1.png": "fe8d1506c5650bcc9fe8a01d9555b777",
"assets/assets/Shopping_Icons/egg2.png": "f7ea1f76819411cbf79c69eab0f1fefd",
"assets/assets/Shopping_Icons/egg3.png": "5c4423d283441da67b349fcff7eb4d0a",
"assets/assets/Shopping_Icons/milk1.png": "b05d0a566926757ab37a52acfc500f1a",
"assets/assets/Shopping_Icons/milk2.png": "0b41be86533c5d4fb06681d8806be7a0",
"assets/assets/Shopping_Icons/milk3.png": "08ea704b58ee9469b66e69c70a0cc14d",
"assets/assets/Shopping_Icons/milk4.png": "467da34bffe83b66335d90a026f55fe2",
"assets/assets/Shopping_Icons/paper.png": "39af9f12e595540c2658697744f0e449",
"assets/assets/Shopping_Icons/shoppingsave.png": "5dd0089333c2748e06a376ad9064a785",
"assets/assets/Shopping_Icons/water1.png": "fd4a986297b78b4261d92137288b5b0e",
"assets/assets/Shopping_Icons/water2.png": "090932c43bf248cac2f101f714b41c27",
"assets/assets/Shopping_Icons/water3.png": "7acd2036b5db22f0f96cfdd8edd2cd8b",
"assets/assets/signupwawa.png": "1b94b605dc2ee412121dcdadefa10d98",
"assets/assets/slight_fire_wawa.png": "01f88f639219c31ec8f7399ec24094ce",
"assets/assets/smallcar.png": "f551558249cff69c646d3137107af3d4",
"assets/assets/smalldollar.png": "3ce83c5a6fd5f0d3bb5c23565b645a57",
"assets/assets/smallpig.png": "539ce9dd1fcb41d01c5a3c24a28253ae",
"assets/assets/smallpiggrey.png": "952298cd964c84846823edaa1215f0de",
"assets/assets/smartphone.png": "b1899d62a8286f3118528092ff1090fa",
"assets/assets/sounds/coin_drop.mp3": "80ebbe4df4be41995f0cf61515124df8",
"assets/assets/sounds/confetti.mp3": "32ed0460e21a6bb317f558d85130a748",
"assets/assets/spillmilk.png": "064dbf1705f1183702e0b3e0e688ca86",
"assets/assets/stacked_pig.png": "b5250e77759f3dc47c07d9745575c62c",
"assets/assets/streakpopback.png": "f3cb3f40e412eb2f3a16c848424c3d93",
"assets/assets/stucard.png": "961ca9437e3657e847c28ea4be6b5d13",
"assets/assets/studsam.png": "4425be9912aa56efaae22cf28d7b50aa",
"assets/assets/supercarwawa.png": "639055b7ec7f81f63fb28d40a0d4d00b",
"assets/assets/supercar_dark_wawa.png": "2f5426cdab1b2feec86e964dc9d5e003",
"assets/assets/suprisedwawa.png": "2e5f449b0a4449f2c743317f3dcb46cb",
"assets/assets/Tapcoin.png": "738332694456c2d21720e395f7415ce8",
"assets/assets/tax-desk.png": "ac0ebf38584308b526aa4f233b6766be",
"assets/assets/tax-form.png": "058ceebe2da1cabbd76c6f5aae4725d2",
"assets/assets/tax.png": "76238d9ae4456280ed79f4f180cd9cd5",
"assets/assets/TaxCoin.png": "5758256b910fce796810f4ea3fbf0813",
"assets/assets/taxhitlist.png": "34d3648e937ad5a3e6cab3e7d0cb1d23",
"assets/assets/telephone_icon.png": "c2e494aa3f2e52ea67bb9b60d6bedeb2",
"assets/assets/toothbrush.png": "15df4d226d2ba772622eeb4554e464c5",
"assets/assets/tradingcard.png": "186fc690de00c2ec24b76e92180def54",
"assets/assets/treasure_bottle.png": "e103b76a619b7c7aa7c7672989be464e",
"assets/assets/treasure_map.png": "80071b16b19c165b4c9c48ded6028325",
"assets/assets/triangle.png": "7ba40c66c238c4dcc8167ab6696cb169",
"assets/assets/trianglecut2.png": "178edf063253613f5b814eb91efd178c",
"assets/assets/trophy_background.png": "af25a4d6883cf5031e9c0eadee29ddeb",
"assets/assets/Unit%25202/baba_old.png": "44304194e4567f26b704257ecc3e8a36",
"assets/assets/Unit%25202/baba_young.png": "b445705372968a5cdba172a3e03d4bf4",
"assets/assets/Unit%25202/boxstuff.png": "e6fe060f5f7ff726d7e76e2f4422b9f5",
"assets/assets/Unit%25202/daboss.png": "dc40baa1fbdfe8a268c6bc55bcf04089",
"assets/assets/Unit%25202/dragonegg.png": "2dac1443a7bfb008a6a60d546d91f31b",
"assets/assets/Unit%25202/fancypig.png": "66eaa9b8198718711e6eba220d380580",
"assets/assets/Unit%25202/house_asset.png": "cbe6c325ad7e89935c96c852224e9621",
"assets/assets/Unit%25202/Icon.png": "c01cef57fd16508ea5eb23160b2426a8",
"assets/assets/Unit%25202/liability.png": "f411a94e6b962ecdb2b06f7d72d22ed4",
"assets/assets/Unit%25202/money_bag.png": "5d03a05f8d2216e22b3a1744b34553b4",
"assets/assets/Unit%25202/namecard.png": "0426c57916dbda57f2d31c80773a44f5",
"assets/assets/Unit%25202/pencil_case.png": "e5514ac55464d6d79b75a4446e86974e",
"assets/assets/Unit%25202/red_marker.png": "5ee701a093fa9462daf4081ca7e4b97f",
"assets/assets/Unit%25202/red_marker_faded.png": "d892cadf39208a9b4fa00c91a3ae8944",
"assets/assets/Unit%25202/scenario_boxstuff.png": "62c14b216c8173605970a2853e3df7a7",
"assets/assets/Unit%25202/scenario_money.png": "9e19c1a79ecb8daac2777871185f15e0",
"assets/assets/Unit%25202/stocks.png": "3e6c749688ec62673eb60a1636fe6022",
"assets/assets/Unit%25202/wawaBook.png": "7b3bb8146569101a3f4252f8a592e2ce",
"assets/assets/Unit%25202/wawaPlant.png": "6e0a73a1ffb3acf35bf1312a82bf9ae7",
"assets/assets/Unit%25202/wawaValue.png": "811b4a36a16ee6ad02fb0e56da8c4967",
"assets/assets/Unit%25203/cashier.png": "0765025460d5215868aafe2a9856bce7",
"assets/assets/Unit%25203/cash_register.png": "9519ca5c39a1f1a5e0e03707033ccb78",
"assets/assets/Unit%25203/credit_card.png": "83b3f022046d1f201337422c5ceec2f5",
"assets/assets/Unit%25203/credit_score_600.png": "db9cd92e355cda01133d3dd8ee0a3d8b",
"assets/assets/Unit%25203/debit_machine.png": "df1acccbc27117c2f0df5419fd5d498c",
"assets/assets/Unit%25203/empty_wallet.png": "b54855d81191c9fe7208f621ae7dc1ee",
"assets/assets/Unit%25203/grad_cap.png": "04acde4d677f535451cdb74dbbf078c0",
"assets/assets/Unit%25203/medschool.png": "c96e30a165f1af64034e54784ad376bb",
"assets/assets/Unit%25203/movie_seat.png": "6163d120e9cb4474100f1171932b6623",
"assets/assets/Unit%25203/plan.png": "3935369742a11ec057042d3e975d52cf",
"assets/assets/Unit%25203/student_loan.png": "0bb05f9289a58da274e5adf505dd5554",
"assets/assets/Unit%25203/wawaBus.png": "91cc4218d0903fdc47dfcc3048fcedf7",
"assets/assets/Unit%25203/wawaCar.png": "f1a7936847fbc663c9978d04f6dd9d68",
"assets/assets/Unit%25203/wawaDoctor.png": "6be4c01bbfa8acb2df47317b503dc412",
"assets/assets/Unit%25203/wawaMovie.png": "f512cde5cf19d7eb1192f102badaabff",
"assets/assets/Unit%25203/white_pig.png": "87dd2a7c8b97e388dd0f214b4cc0c046",
"assets/assets/userdollar.png": "47dfd834994d925ff0cd76b9393fa437",
"assets/assets/very_fire_wawa.png": "87a63bef976f943a236bc889df5c476b",
"assets/assets/wacoin.png": "bb3a5a00182612ef51f125fc90d0fb76",
"assets/assets/wallet_coin.png": "6194434a72c547555f9788f56f0149e4",
"assets/assets/water.png": "b4e97676ebbdddbb2ac7d3722e2e0295",
"assets/assets/wawa-mail.png": "5db6450e347400e7e659d68e2cabb836",
"assets/assets/wawa.png": "65a088499d2f7424957260ec0b343103",
"assets/assets/wawaandrichwawa.png": "c1c9f4416902fdb7f64e90f903faddf3",
"assets/assets/wawabadtax.png": "907bcd730e4da7599cb6a371cef099e3",
"assets/assets/wawaBag.png": "4eb4b7408afd076a73e04c9764c5c660",
"assets/assets/wawacalendar.png": "3d0c5fe13d26b8d099a59d4f905c8352",
"assets/assets/wawaCoach.png": "219eaae5c4959f9884b3ed065b1f2803",
"assets/assets/wawacoin2intro.png": "aa64f79e06ec746bdff576c3aa16e6f2",
"assets/assets/wawaConfused.png": "dea398860763bc2f7b6408ff15620422",
"assets/assets/wawadriving.png": "c9b2ddec2c39fa896ccaab2f976ef04f",
"assets/assets/wawaghost.png": "636e9c8aa1cf5f2a7ad071cab0c80931",
"assets/assets/wawahand.png": "0d01159590c052d384d85c349fe2f159",
"assets/assets/wawaholding.png": "592d3376530a030a716a4f3afa80dac7",
"assets/assets/wawaparent.png": "07b940d823dcce44add06b271842d1d2",
"assets/assets/wawaphone.png": "fc4343fff8ae54f28b6e64b9a065d2cc",
"assets/assets/wawaRelax.png": "cd9871ef5dd383bb4dae1ea4dbc8f9fc",
"assets/assets/wawasale.png": "a69256c3f71f67a86edabfdda112dfc7",
"assets/assets/wawasign.png": "b3f86eaa33be8c5db646d66bb525a8ca",
"assets/assets/wawaTalk.png": "14747156e9eb1bac34b06e1fbf051fb0",
"assets/assets/wawatax.png": "bf9de6c5560a5bcbee91c9881b676b08",
"assets/assets/wawaup.png": "9f0fd2e49451538c2c26eacacc7e7ced",
"assets/assets/wawa_talking.png": "676c341ea174596b8b9661895057acde",
"assets/assets/weekstreakback.png": "1703a835ef05a72607dcfb4bc85f8575",
"assets/assets/welcome_background.png": "3438d4fceeb793f832b32c4dd29631dc",
"assets/assets/welcome_to.png": "0bc963bdbf3b173684aa1637ef4d07b0",
"assets/assets/Welcome_to_1.png": "250eb1a3cd0156c8d83050c7887ad55c",
"assets/assets/whatisinterest.png": "bbb428f3a4f51777a3964176114cdc94",
"assets/assets/wheelstand.png": "0238e304d355ef6fdadef4c65fdac646",
"assets/assets/wheresave.png": "e732532278ae900ef583b4f6f6808c95",
"assets/assets/wondering_detective_wawa.png": "f6883cff816b2a1f3fa94a3a8a5475b3",
"assets/assets/world.png": "62508411b9e17d374f314885796dcd59",
"assets/assets/x.png": "df8dc6ac2bb2b5004ca7d5cec97cced7",
"assets/assets/yellingwawa.png": "d5e43346a16797fecad0c23411449a70",
"assets/assets/yellow_wa.png": "f1aa3325db82b445c954f49a5f1485dc",
"assets/assets/young.png": "8c7c62bd9679bb7f26a75dff4e5193df",
"assets/assets/yplant.png": "90745a0d46f6f59549a96181d797822c",
"assets/FontManifest.json": "6fb260e698396b2eb2e19aa876d0471c",
"assets/fonts/handwriting.ttf": "e9c296bc1299bcd7883f5bd74b22b835",
"assets/fonts/MaterialIcons-Regular.otf": "744d15a0835fde8e3076d03ca23ce191",
"assets/fonts/PermanentMarker-Regular.ttf": "c863f8028c2505f92540e0ba7c379002",
"assets/fonts/SourceSansPro-Black.otf": "2516b34268d5abb314bd31734f2391d0",
"assets/fonts/SourceSansPro-Bold.ttf": "760cda86de964d7e344fe4c2cce1c357",
"assets/fonts/SourceSansPro-Semibold.ttf": "ce8a7a5d8c76d57e5a384baa25fe6342",
"assets/fonts/SourceSerifPro-Bold.otf": "b925ad9fabb07ea33b1b657f3284860f",
"assets/NOTICES": "84654e92748fe0d93eaf001d0b6b732a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "218ed1b2893761d231754583e8c88e7c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "5216f2958ee3c3848a75867a246f20ba",
"/": "5216f2958ee3c3848a75867a246f20ba",
"main.dart.js": "34bb3e3127ce1e5f58fd161ca378f0de",
"manifest.json": "fd091ea5bc8f3ccc10f74bd67179fb6a",
"version.json": "15235b5108d6a877ef74fe3317a96bf7"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
