require 'rails_helper'

RSpec.describe Dog, type: :model do
  describe '#create' do
    before do
      @dog = FactoryBot.build(:dog)
      @dog.image = fixture_file_upload('public/images/test_image.png')
    end

    it '全てのカラムが存在すれば保存できる' do
      expect(@dog).to be_valid
    end

    it 'imageが空では保存できない' do
      @dog.image = nil
      @dog.valid?
      expect(@dog.errors.full_messages).to include("ワンちゃんの画像を入力してください")
    end
    it 'nameが空では保存できないこと' do
      @dog.name = nil
      @dog.valid?
      expect(@dog.errors.full_messages).to include("ワンちゃんのお名前を入力してください")
    end
    it 'typeがid_1では保存できないこと' do
      @dog.type_id = 1
      @dog.valid?
      expect(@dog.errors.full_messages).to include('犬種を選んで下さい')
    end
    it 'dog_sexがid_1では保存できないこと' do
      @dog.dog_sex_id = 1
      @dog.valid?
      expect(@dog.errors.full_messages).to include('ワンちゃんの性別を選んで下さい')
    end
    it 'descriptionが空では保存できないこと' do
      @dog.description = nil
      @dog.valid?
      expect(@dog.errors.full_messages).to include("ワンちゃんの「特徴、嗜好、性格」などを入力してください")
    end

  end
end

