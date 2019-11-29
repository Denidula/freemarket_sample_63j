

lady = Category.create(:name=>"レディース")

lady_tops = lady.children.create(:name=>"トップス")
lady_jacket = lady.children.create(:name=>"ジャケット/アウター")
lady_pants = lady.children.create(:name=>"パンツ")
lady_skirt = lady.children.create(:name=>"スカート")
lady_onePiece = lady.children.create(:name=>"ワンピース")
lady_shoes = lady.children.create(:name=>"靴")
lady_roomWear = lady.children.create(:name=>"ルームウェア/パジャマ")
lady_legs = lady.children.create(:name=>"レッグウェア")
lady_hat = lady.children.create(:name=>"帽子")
lady_bag = lady.children.create(:name=>"バッグ")
lady_accessory = lady.children.create(:name=>"アクセサリー")
lady_hairAccessory = lady.children.create(:name=>"ヘアアクセサリー")
lady_small = lady.children.create(:name=>"小物")
lady_watch = lady.children.create(:name=>"時計")
lady_wig = lady.children.create(:name=>"ウィッグ/エクステ")
lady_yukataSwimsuit = lady.children.create(:name=>"浴衣/水着")
lady_suits = lady.children.create(:name=>"スーツ/フォーマル/ドレス")
lady_maternity = lady.children.create(:name=>"マタニティー")
lady_others = lady.children.create(:name=>"その他")

lady_tops.children.create(
  [{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"シャツ/ブラウス(半袖/袖なし)"},{:name=>"シャツ/ブラウス(七分/長袖)"},{:name=>"ポロシャツ"},{:name=>"キャミソール"},{:name=>"タンクトップ"},{:name=>"ホルターネック"},{:name=>"ニット/セーター"},{:name=>"チュニック"},{:name=>"カーディガン/ボレロ"},{:name=>"アンサンブル"},{:name=>"ベスト/ジレ"},{:name=>"パーカー"},{:name=>"トレーナー/スウェット"},{:name=>"ベアトップ/チューブトップ"},{:name=>"ジャージ"},{:name=>"その他"}]
)
lady_jacket.children.create(
  [{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"},{:name=>"Gジャン/デニムジャケット"},{:name=>"レザージャケット"},{:name=>"ダウンジャケット"},{:name=>"ライダースジャケット"},{:name=>"ミリタリージャケット"},{:name=>"ダウンベスト"},{:name=>"ジャンパー/ブルゾン"},{:name=>"ポンチョ"},{:name=>"ロングコート"},{:name=>"トレンチコート"},{:name=>"ダッフルコート"},{:name=>"ピーコート"},{:name=>"チェスターコート"},{:name=>"モッズコート"},{:name=>"スタジャン"},{:name=>"毛皮/ファーコート"},{:name=>"スプリングコート"},{:name=>"スカジャン"},{:name=>"その他"}]
)
lady_pants.children.create(
  [{:name=>"デニム/ジーンズ"}, {:name=>"ショートパンツ"},{:name=>"カジュアルパンツ"},{:name=>"ハーフパンツ"},{:name=>"チノパン"},{:name=>"ワークパンツ/カーゴパンツ"},{:name=>"クロップドパンツ"},{:name=>"サロペット/オーバーオール"},{:name=>"オールインワン"},{:name=>"サルエルパンツ"},{:name=>"ガウチョパンツ"},{:name=>"その他"}]
)
lady_skirt.children.create(
  [{:name=>"ミニスカート"}, {:name=>"ひざ丈スカート"},{:name=>"ロングスカート"},{:name=>"キュロット"},{:name=>"その他"}]
)
lady_onePiece.children.create(
  [{:name=>"ミニワンピース"}, {:name=>"ひざ丈ワンピース"},{:name=>"ロングワンピース"},{:name=>"その他"}]
)
lady_shoes.children.create(
  [{:name=>"ハイヒール/パンプス"}, {:name=>"ブーツ"},{:name=>"サンダル"},{:name=>"スニーカー"},{:name=>"ミュール"},{:name=>"モカシン"},{:name=>"ローファー/革靴"},{:name=>"フラットシューズ/バレエシューズ"},{:name=>"長靴/レインシューズ"},{:name=>"その他"}]
)
lady_roomWear.children.create(
  [{:name=>"パジャマ"}, {:name=>"ルームウェア"}]
)
lady_legs.children.create(
  [{:name=>"ソックス"}, {:name=>"スパッツ/レギンス"},{:name=>"ストッキング/タイツ"},{:name=>"レッグウォーマー"},{:name=>"その他"}]
)
lady_hat.children.create(
  [{:name=>"ニットキャップ/ビーニー"}, {:name=>"ハット"},{:name=>"ハンチング/ベレー帽"},{:name=>"キャップ"},{:name=>"キャスケット"},{:name=>"麦わら帽子"},{:name=>"その他"}]
)
lady_bag.children.create(
  [{:name=>"ハンドバッグ"}, {:name=>"トートバッグ"},{:name=>"エコバッグ"},{:name=>"リュック/バックパック"},{:name=>"ボストンバッグ"},{:name=>"スポーツバッグ"},{:name=>"ショルダーバッグ"},{:name=>"クラッチバッグ"},{:name=>"ポーチ/バニティ"},{:name=>"ボディバッグ/ウェストバッグ"},{:name=>"マザーズバッグ"},{:name=>"メッセンジャーバッグ"},{:name=>"ビジネスバッグ"},{:name=>"旅行用バッグ/キャリーバッグ"},{:name=>"ショップ袋"},{:name=>"和装用バッグ"},{:name=>"かごバッグ"},{:name=>"その他"}]
)
lady_accessory.children.create(
  [{:name=>"ネックレス"}, {:name=>"ブレスレット"},{:name=>"バングル/リストバンド"},{:name=>"リング"},{:name=>"ピアス(片耳用)"},{:name=>"ピアス(両耳用)"},{:name=>"イヤリング"},{:name=>"アンクレット"},{:name=>"ブローチ/コサージュ"},{:name=>"チャーム"},{:name=>"その他"}]
)
lady_hairAccessory.children.create(
  [{:name=>"ヘアゴム/シュシュ"}, {:name=>"ヘアバンド/カチューシャ"},{:name=>"ヘアピン"},{:name=>"その他"}]
)
lady_small.children.create(
  [{:name=>"長財布"}, {:name=>"折り財布"},{:name=>"コインケース/小銭入れ"},{:name=>"名刺入れ/定期入れ"},{:name=>"キーケース"},{:name=>"キーホルダー"},{:name=>"手袋/アームカバー"},{:name=>"ハンカチ"},{:name=>"ベルト"},{:name=>"マフラー/ショール"},{:name=>"ストール/スヌード"},{:name=>"バンダナ/スカーフ"},{:name=>"ネックウォーマー"},{:name=>"サスペンダー"},{:name=>"サングラス/メガネ"},{:name=>"モバイルケース/カバー"},{:name=>"手帳"},{:name=>"イヤマフラー"},{:name=>"傘"},{:name=>"レインコート/ポンチョ"},{:name=>"ミラー"},{:name=>"タバコグッズ"},{:name=>"その他"}]
)
lady_watch.children.create(
  [{:name=>"腕時計(アナログ)"}, {:name=>"腕時計(デジタル)"},{:name=>"ラバーベルト"},{:name=>"レザーベルト"},{:name=>"金属ベルト"},{:name=>"その他"}]
)
lady_wig.children.create(
  [{:name=>"前髪ウィッグ"}, {:name=>"ロングストレート"},{:name=>"ロングカール"},{:name=>"ショートストレート"},{:name=>"ショートカール"},{:name=>"その他"}]
)
lady_yukataSwimsuit.children.create(
  [{:name=>"浴衣"}, {:name=>"着物"},{:name=>"振袖"},{:name=>"長襦袢/半襦袢"},{:name=>"水着セパレート"},{:name=>"水着ワンピース"},{:name=>"水着スポーツ用"},{:name=>"その他"}]
)
lady_suits.children.create(
  [{:name=>"スカートスーツ上下"}, {:name=>"パンツスーツ上下"},{:name=>"ドレス"},{:name=>"パーティーバッグ"},{:name=>"シューズ"},{:name=>"ウェディング"},{:name=>"その他"}]
)
lady_maternity.children.create(
  [{:name=>"トップス"}, {:name=>"アウター"},{:name=>"インナー"},{:name=>"ワンピース"},{:name=>"パンツ/スパッツ"},{:name=>"スカート"},{:name=>"パジャマ"},{:name=>"授乳服"},{:name=>"その他"}]
)
lady_others.children.create(
  [{:name=>"コスプレ"}, {:name=>"下着"},{:name=>"その他"}]
)


mens = Category.create(:name=>"メンズ")

mens_tops = mens.children.create(:name=>"トップス")
mens_jacket = mens.children.create(:name=>"ジャケット/アウター")
mens_pants = mens.children.create(:name=>"パンツ")
mens_shoes = mens.children.create(:name=>"靴")
mens_bag = mens.children.create(:name=>"バッグ")
mens_suits = mens.children.create(:name=>"スーツ")
mens_hat = mens.children.create(:name=>"帽子")
mens_accessory = mens.children.create(:name=>"アクセサリー")
mens_small = mens.children.create(:name=>"小物")
mens_watch = mens.children.create(:name=>"時計")
mens_swimsuit = mens.children.create(:name=>"水着")
mens_legs = mens.children.create(:name=>"レッグウェア")
mens_under = mens.children.create(:name=>"アンダーウェア")
mens_others = mens.children.create(:name=>"その他")

mens_tops.children.create(
  [{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"シャツ"},{:name=>"ポロシャツ"},{:name=>"タンクトップ"},{:name=>"ホルターネック"},{:name=>"ニット/セーター"},{:name=>"パーカー"},{:name=>"カーディガン"},{:name=>"スウェット"},{:name=>"ジャージ"},{:name=>"ベスト"},{:name=>"その他"}]
)
mens_jacket.children.create(
  [{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"},{:name=>"Gジャン/デニムジャケット"},{:name=>"レザージャケット"},{:name=>"ダウンジャケット"},{:name=>"ライダースジャケット"},{:name=>"ミリタリージャケット"},{:name=>"ダウンベスト"},{:name=>"ブルゾン"},{:name=>"ポンチョ"},{:name=>"ロングコート"},{:name=>"トレンチコート"},{:name=>"ダッフルコート"},{:name=>"ピーコート"},{:name=>"チェスターコート"},{:name=>"モッズコート"},{:name=>"スタジャン"},{:name=>"毛皮/ファーコート"},{:name=>"スプリングコート"},{:name=>"スカジャン"},{:name=>"ナイロンジャケット"},{:name=>"フライトジャケット"},{:name=>"ステンカラーコート"},{:name=>"マウンテンパーカー"},{:name=>"カバーオール"},{:name=>"その他"}]
)
mens_pants.children.create(
  [{:name=>"デニム/ジーンズ"}, {:name=>"ワークパンツ/カーゴパンツ"},{:name=>"スラックス"},{:name=>"チノパン"},{:name=>"ショートパンツ"},{:name=>"ペインターパンツ"},{:name=>"サルエルパンツ"},{:name=>"オーバーオール"},{:name=>"その他"}]
)
mens_shoes.children.create(
  [{:name=>"スニーカー"}, {:name=>"サンダル"},{:name=>"ブーツ"},{:name=>"モカシン"},{:name=>"ドレス/ビジネス"},{:name=>"長靴/レインシューズ"},{:name=>"デッキシューズ"},{:name=>"その他"}]
)
mens_bag.children.create(
  [{:name=>"ショルダーバッグ"}, {:name=>"トートバッグ"},{:name=>"ボストンバッグ"},{:name=>"リュック/バックパック"},{:name=>"ウエストポーチ"},{:name=>"ボディーバッグ"},{:name=>"ドラムバッグ"},{:name=>"ビジネスバッグ"},{:name=>"トラベルバッグ"},{:name=>"メッセンジャーバッグ"},{:name=>"エコバッグ"},{:name=>"その他"}]
)
mens_suits.children.create(
  [{:name=>"スーツジャケット"}, {:name=>"スーツベスト"},{:name=>"スラックス"},{:name=>"セットアップ"},{:name=>"その他"}]
)
mens_hat.children.create(
  [{:name=>"キャップ"}, {:name=>"ハット"},{:name=>"ニットキャップ/ビーニー"},{:name=>"ハンチング/ベレー帽"},{:name=>"キャスケット"},{:name=>"サンバイザー"},{:name=>"その他"}]
)
mens_accessory.children.create(
  [{:name=>"ネックレス"}, {:name=>"ブレスレット"},{:name=>"バングル/リストバンド"},{:name=>"リング"},{:name=>"ピアス(片耳用)"},{:name=>"ピアス(両耳用)"},{:name=>"アンクレット"},{:name=>"その他"}]
)
mens_small.children.create(
  [{:name=>"長財布"}, {:name=>"折り財布"},{:name=>"マネークリップ"},{:name=>"コインケース/小銭入れ"},{:name=>"名刺入れ/定期入れ"},{:name=>"キーケース"},{:name=>"キーホルダー"},{:name=>"ネクタイ"},{:name=>"手袋"},{:name=>"ハンカチ"},{:name=>"ベルト"},{:name=>"マフラー"},{:name=>"ストール"},{:name=>"バンダナ"},{:name=>"ネックウォーマー"},{:name=>"サスペンダー"},{:name=>"ウォレットチェーン"},{:name=>"サングラス/メガネ"},{:name=>"モバイルケース/カバー"},{:name=>"手帳"},{:name=>"ストラップ"},{:name=>"ネクタイピン"},{:name=>"カフリンクス"},{:name=>"イヤマフラー"},{:name=>"傘"},{:name=>"レインコート"},{:name=>"ミラー"},{:name=>"タバコグッズ"},{:name=>"その他"}]
)
mens_watch.children.create(
  [{:name=>"腕時計(アナログ)"}, {:name=>"腕時計(デジタル)"},{:name=>"ラバーベルト"},{:name=>"レザーベルト"},{:name=>"金属ベルト"},{:name=>"その他"}]
)
mens_swimsuit.children.create(
  [{:name=>"一般水着"}, {:name=>"スポーツ用"},{:name=>"アクセサリー"},{:name=>"その他"}]
)
mens_legs.children.create(
  [{:name=>"ソックス"}, {:name=>"レギンス/スパッツ"},{:name=>"レッグウォーマー"},{:name=>"その他"}]
)
mens_under.children.create(
  [{:name=>"トランクス"}, {:name=>"ボクサーパンツ"},{:name=>"その他"}]
)


kids = Category.create(:name=>"ベビー・キッズ")

kids_girl95 = kids.children.create(:name=>"ベビー服(女の子用)  ~95cm")
kids_boy95 = kids.children.create(:name=>"ベビー服(男の子用)  ~95cm")
kids_uni95 = kids.children.create(:name=>"ベビー服(男女兼用)  ~95cm")
kids_girl100 = kids.children.create(:name=>"キッズ服(女の子用) 100cm~")
kids_boy100 = kids.children.create(:name=>"キッズ服(男の子用) 100cm~")
kids_uni100 = kids.children.create(:name=>"キッズ服(男女兼用) 100cm~")
kids_shoes = kids.children.create(:name=>"キッズ靴")
kids_small = kids.children.create(:name=>"子ども用ファッション小物")
kids_bath = kids.children.create(:name=>"おむつ/トイレ/バス")
kids_outDoor = kids.children.create(:name=>"外出/移動用品")
kids_food = kids.children.create(:name=>"授乳/食事")
kids_furniture = kids.children.create(:name=>"ベビー家具/寝具/室内用品")
kids_toy = kids.children.create(:name=>"おもちゃ")
kids_souvenir = kids.children.create(:name=>"行事/記念品")
kids_others = kids.children.create(:name=>"その他")

kids_girl95.children.create(
  [{:name=>"トップス"}, {:name=>"アウター"},{:name=>"パンツ"},{:name=>"スカート"},{:name=>"ワンピース"},{:name=>"ベビードレス"},{:name=>"おくるみ"},{:name=>"下着/肌着"},{:name=>"パジャマ"},{:name=>"ロンパース"},{:name=>"その他"}]
)
kids_boy95.children.create(
  [{:name=>"トップス"}, {:name=>"アウター"},{:name=>"パンツ"},{:name=>"おくるみ"},{:name=>"下着/肌着"},{:name=>"パジャマ"},{:name=>"ロンパース"},{:name=>"その他"}]
)
kids_uni95.children.create(
  [{:name=>"トップス"}, {:name=>"アウター"},{:name=>"パンツ"},{:name=>"おくるみ"},{:name=>"下着/肌着"},{:name=>"パジャマ"},{:name=>"ロンパース"},{:name=>"その他"}]
)
kids_girl100.children.create(
  [{:name=>"コート"}, {:name=>"ジャケット/上着"},{:name=>"トップス(Tシャツ/カットソー)"},{:name=>"トップス(トレーナー)"},{:name=>"トップス(チュニック)"},{:name=>"トップス(タンクトップ)"},{:name=>"トップス(その他)"},{:name=>"スカート"},{:name=>"パンツ"},{:name=>"ワンピース"},{:name=>"セットアップ"},{:name=>"パジャマ"},{:name=>"フォーマル/ドレス"},{:name=>"和服"},{:name=>"浴衣"},{:name=>"甚平"},{:name=>"水着"},{:name=>"その他"}]
)
kids_boy100.children.create(
  [{:name=>"コート"}, {:name=>"ジャケット/上着"},{:name=>"トップス(Tシャツ/カットソー)"},{:name=>"トップス(トレーナー)"},{:name=>"トップス(その他)"},{:name=>"パンツ"},{:name=>"セットアップ"},{:name=>"パジャマ"},{:name=>"フォーマル/ドレス"},{:name=>"和服"},{:name=>"浴衣"},{:name=>"甚平"},{:name=>"水着"},{:name=>"その他"}]
)
kids_uni100.children.create(
  [{:name=>"コート"}, {:name=>"ジャケット/上着"},{:name=>"トップス(Tシャツ/カットソー)"},{:name=>"トップス(トレーナー)"},{:name=>"トップス(その他)"},{:name=>"パジャマ"},{:name=>"ボトムス"},{:name=>"その他"}]
)
kids_shoes.children.create(
  [{:name=>"スニーカー"}, {:name=>"サンダル"},{:name=>"ブーツ"},{:name=>"長靴"},{:name=>"その他"}]
)
kids_small.children.create(
  [{:name=>"靴下/スパッツ"}, {:name=>"帽子"},{:name=>"エプロン"},{:name=>"サスペンダー"},{:name=>"タイツ"},{:name=>"ハンカチ"},{:name=>"バンダナ"},{:name=>"ベルト"},{:name=>"マフラー"},{:name=>"傘"},{:name=>"手袋"},{:name=>"スタイ"},{:name=>"バッグ"},{:name=>"その他"}]
)
kids_bath.children.create(
  [{:name=>"おむつ用品"}, {:name=>"おまる/補助便座"},{:name=>"トレーニングパンツ"},{:name=>"ベビーバス"}, {:name=>"お風呂用品"},{:name=>"その他"}]
)
kids_outDoor.children.create(
  [{:name=>"ベビーカー"}, {:name=>"抱っこひも/スリング"},{:name=>"チャイルドシート"},{:name=>"その他"}]
)
kids_food.children.create(
  [{:name=>"ミルク"}, {:name=>"ベビーフード"},{:name=>"ベビー用食器"},{:name=>"その他"}]
)
kids_furniture.children.create(
  [{:name=>"ベッド"}, {:name=>"布団/毛布"},{:name=>"イス"},{:name=>"たんす"},{:name=>"その他"}]
)
kids_toy.children.create(
  [{:name=>"おふろのおもちゃ"}, {:name=>"がらがら"},{:name=>"オルゴール"},{:name=>"ベビージム"},{:name=>"手押し車/カタカタ"},{:name=>"知育玩具"},{:name=>"その他"}]
)
kids_souvenir.children.create(
  [{:name=>"お宮参り用品"}, {:name=>"お食い初め用品"},{:name=>"アルバム"},{:name=>"手形/足形"},{:name=>"その他"}]
)
kids_others.children.create(
  [{:name=>"母子手帳用品"},{:name=>"その他"}]
)


interior = Category.create(:name=>"インテリア・住まい・小物")

interior_kitchen = kids.children.create(:name=>"キッチン/食器")
interior_bed = kids.children.create(:name=>"ベッド/マットレス")
interior_sofa = kids.children.create(:name=>"ソファ/ソファベッド")
interior_chair = kids.children.create(:name=>"椅子/チェア")
interior_table = kids.children.create(:name=>"机/テーブル")
interior_storage = kids.children.create(:name=>"収納家具")
interior_mat = kids.children.create(:name=>"ラグ/カーペット/マット")
interior_curtain = kids.children.create(:name=>"カーテン/ブラインド")
interior_light = kids.children.create(:name=>"ライト/照明")
interior_bedding = kids.children.create(:name=>"寝具")
interior_small = kids.children.create(:name=>"インテリア小物")
interior_event = kids.children.create(:name=>"季節/年中行事")
interior_others = kids.children.create(:name=>"その他")

interior_kitchen.children.create(
  [{:name=>"食器"},{:name=>"調理器具"},{:name=>"収納/キッチン雑貨"},{:name=>"弁当用品"},{:name=>"カトラリー(スプーン等)"},{:name=>"テーブル用品"},{:name=>"容器"},{:name=>"エプロン"},{:name=>"アルコールグッズ"},{:name=>"浄水機"},{:name=>"その他"}]
)
interior_bed.children.create(
  [{:name=>"セミシングルベッド"},{:name=>"シングルベッド"},{:name=>"セミダブルベッド"},{:name=>"ダブルベッド"},{:name=>"ワイドダブルベッド"},{:name=>"クイーンベッド"},{:name=>"キングベッド"},{:name=>"脚付きマットレスベッド"},{:name=>"マットレス"},{:name=>"すのこベッド"},{:name=>"ロフトベッド/システムベッド"},{:name=>"簡易ベッド/折りたたみベッド"},{:name=>"収納付き"},{:name=>"その他"}]
)
interior_sofa.children.create(
  [{:name=>"ソファセット"},{:name=>"シングルソファ"},{:name=>"ラブソファ"},{:name=>"トリプルソファ"},{:name=>"オットマン"},{:name=>"コーナーソファ"},{:name=>"ビーズソファ/クッションソファ"},{:name=>"ローソファ/フロアソファ"},{:name=>"ソファベッド"},{:name=>"応接セット"},{:name=>"ソファカバー"},{:name=>"リクライニングソファ"},{:name=>"その他"}]
)
interior_chair.children.create(
  [{:name=>"一般"},{:name=>"スツール"},{:name=>"ダイニングチェア"},{:name=>"ハイバックチェア"},{:name=>"ロッキングチェア"},{:name=>"座椅子"},{:name=>"折り畳みイス"},{:name=>"デスクチェア"},{:name=>"その他"}]
)
interior_table.children.create(
  [{:name=>"こたつ"},{:name=>"カウンターテーブル"},{:name=>"サイドテーブル"},{:name=>"センターテーブル"},{:name=>"ダイニングテーブル"},{:name=>"座卓/ちゃぶ台"},{:name=>"アウトドア用"},{:name=>"パソコン用"},{:name=>"事務机/学習机"},{:name=>"その他"}]
)
interior_storage.children.create(
  [{:name=>"リビング収納"},{:name=>"キッチン収納"},{:name=>"玄関/屋外収納"},{:name=>"バス/トイレ収納"},{:name=>"本収納"},{:name=>"本/CD/DVD収納"},{:name=>"洋服タンス/押入れ収納"},{:name=>"電話台/ファックス台"},{:name=>"ドレッサー/鏡台"},{:name=>"棚/ラック"},{:name=>"ケース/ボックス"},{:name=>"その他"}]
)
interior_mat.children.create(
  [{:name=>"ラグ"},{:name=>"カーペット"},{:name=>"ホットカーペット"},{:name=>"玄関/キッチンマット"},{:name=>"トイレ/バスマット"},{:name=>"その他"}]
)
interior_curtain.children.create(
  [{:name=>"カーテン"},{:name=>"ブラインド"},{:name=>"ロールスクリーン"},{:name=>"のれん"},{:name=>"その他"}]
)
interior_light.children.create(
  [{:name=>"蛍光灯/電球"},{:name=>"天井照明"},{:name=>"フロアスタンド"},{:name=>"その他"}]
)
interior_bedding.children.create(
  [{:name=>"布団/毛布"},{:name=>"枕"},{:name=>"シーツ/カバー"},{:name=>"その他"}]
)
interior_small.children.create(
  [{:name=>"ごみ箱"},{:name=>"ウェルカムボード"},{:name=>"オルゴール"},{:name=>"クッション"},{:name=>"クッションカバー"},{:name=>"スリッパラック"},{:name=>"ティッシュボックス"},{:name=>"バスケット/かご"},{:name=>"フォトフレーム"},{:name=>"マガジンラック"},{:name=>"モビール"},{:name=>"花瓶"},{:name=>"灰皿"},{:name=>"傘立て"},{:name=>"小物入れ"},{:name=>"置時計"},{:name=>"掛時計/柱時計"},{:name=>"鏡(立て掛け式)"},{:name=>"鏡(壁掛け式)"},{:name=>"置物"},{:name=>"風鈴"},{:name=>"植物/観葉植物"},{:name=>"その他"}]
)
interior_event.children.create(
  [{:name=>"正月"},{:name=>"成人式"},{:name=>"バレンタインデー"},{:name=>"ひな祭り"},{:name=>"子どもの日"},{:name=>"母の日"},{:name=>"父の日"},{:name=>"サマーギフト/お中元"},{:name=>"夏/夏休み"},{:name=>"ハロウィン"},{:name=>"敬老の日"},{:name=>"七五三"},{:name=>"お歳暮"},{:name=>"クリスマス"},{:name=>"冬一般"},{:name=>"その他"}]
)
