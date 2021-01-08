class Age < ActiveHash::Base
  self.data = [
    { id: 1, name: '年齢層を選択して下さい' },
    { id: 2, name: '10代' },
    { id: 3, name: '20~24歳' },
    { id: 4, name: '25~29歳' },
    { id: 5, name: '30~34歳' },
    { id: 6, name: '35~39歳' },
    { id: 7, name: '40代' },
    { id: 8, name: '50代' },
    { id: 9, name: '60代以上' },
  ]
  end