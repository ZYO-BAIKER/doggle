class Type < ActiveHash::Base
  self.data = [
    { id: 1, name: '犬種を選択して下さい' },
    { id: 2, name: 'トイプードル' }, { id: 3, name: 'チワワ' }, { id: 4, name: 'ミックス犬' },
    { id: 5, name: '柴犬' }, { id: 6, name: '小豆柴' }, { id: 7, name: '秋田犬' },
    { id: 8, name: '甲斐犬' }, { id: 9, name: '紀州犬' }, { id: 10, name: '土佐犬' },
    { id: 11, name: 'シーズー' }, { id: 12, name: 'ミニチュアダックスフンド' }, { id: 13, name: 'ウェルシュテリア' },
    { id: 14, name: 'ミニチュアシュナウザー' }, { id: 15, name: 'ヨークシャテリア' }, { id: 16, name: 'ポメラニアン' },
    { id: 17, name: 'その他' }
  ]
end