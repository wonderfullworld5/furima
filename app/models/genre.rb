class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'メンズ' },
    { id: 3, name: 'レディース' },
    { id: 4, name: 'ベビー・キッズ'},
    { id: 5, name: 'インテリア' },
    { id: 6, name: '住まい・小物' }
    { id: 7, name: '本・音楽・ゲーム' },
    { id: 8, name: 'おもちゃ・ホビー・グッズ' },
    { id: 9, name: '家電・スマホ・カメラ' },
    { id: 10, name: 'スポーツ・レジャー'},
    { id: 11, name: 'ハンドメイド' },
    { id: 12, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :articles

  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '新品・未使用' },
    { id: 3, name: '未使用に近い' },
    { id: 4, name: '目立った傷や汚れなし'},
    { id: 5, name: 'やや傷や汚れあり' },
    { id: 6, name: '傷や汚れあり' }
    { id: 7, name: '全体的に状態が悪い' },
    { id: 8, name: 'おもちゃ・ホビー・グッズ' },
    { id: 9, name: '家電・スマホ・カメラ' },
  ]


  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '着払い(購入者負担)' },
    { id: 3, name: '送料込み(出品者負担)' },
  ]



  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '北海道' },
    { id: 3, name: 'レディース' },
    { id: 4, name: 'ベビー・キッズ'},
    { id: 5, name: 'インテリア' },
    { id: 6, name: '住まい・小物' }
    { id: 7, name: '本・音楽・ゲーム' },
    { id: 8, name: 'おもちゃ・ホビー・グッズ' },
    { id: 9, name: '家電・スマホ・カメラ' },
    { id: 10, name: 'スポーツ・レジャー'},
    { id: 11, name: 'ハンドメイド' },
    { id: 12, name: 'その他' }
    { id: 13, name: '---' },
    { id: 14, name: 'メンズ' },
    { id: 15, name: 'レディース' },
    { id: 16, name: 'ベビー・キッズ'},
    { id: 17, name: 'インテリア' },
    { id: 18, name: '住まい・小物' }
    { id: 19, name: '本・音楽・ゲーム' },
    { id: 20, name: 'おもちゃ・ホビー・グッズ' },
    { id: 21, name: '家電・スマホ・カメラ' },
    { id: 22, name: 'スポーツ・レジャー'},
    { id: 23, name: 'ハンドメイド' },
    { id: 24, name: 'その他' }
    { id: 25, name: '---' },
    { id: 26, name: 'メンズ' },
    { id: 27, name: 'レディース' },
    { id: 28, name: 'ベビー・キッズ'},
    { id: 29, name: 'インテリア' },
    { id: 30, name: '住まい・小物' }
    { id: 31, name: '本・音楽・ゲーム' },
    { id: 32, name: 'おもちゃ・ホビー・グッズ' },
    { id: 33, name: '家電・スマホ・カメラ' },
    { id: 34, name: 'スポーツ・レジャー'},
    { id: 35, name: 'ハンドメイド' },
    { id: 36, name: 'その他' }
    { id: 37, name: '---' },
    { id: 38, name: 'メンズ' },
    { id: 39, name: 'レディース' },
    { id: 40, name: 'ベビー・キッズ'},
    { id: 41, name: 'インテリア' },
    { id: 42, name: '住まい・小物' }
    { id: 43, name: '本・音楽・ゲーム' },
    { id: 44, name: 'おもちゃ・ホビー・グッズ' },
    { id: 45, name: '家電・スマホ・カメラ' },
    { id: 46, name: 'スポーツ・レジャー'},
    { id: 47, name: 'ハンドメイド' },
    { id: 48, name: 'その他' }
]

self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1~2日で発送' },
    { id: 3, name: '2~3日で発送' },
    { id: 4, name: '4~7日で発送'},
]

end