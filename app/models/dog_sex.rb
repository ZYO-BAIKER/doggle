class DogSex < ActiveHash::Base
  self.data = [
    { id: 1, name: '性別を選択して下さい' },
    { id: 2, name: 'メス' },
    { id: 3, name: 'オス' },
  ]
  end
