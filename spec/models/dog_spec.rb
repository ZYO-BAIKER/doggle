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
      expect(@dog.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空では保存できないこと' do
      @dog.name = nil
      @dog.valid?
      expect(@dog.errors.full_messages).to include("Name can't be blank")
    end
    it 'typeがid_1では保存できないこと' do
      @dog.type_id = 1
      @dog.valid?
      expect(@dog.errors.full_messages).to include('Type must be other than 1')
    end
    it 'dog_sexがid_1では保存できないこと' do
      @dog.dog_sex_id = 1
      @dog.valid?
      expect(@dog.errors.full_messages).to include('Dog sex must be other than 1')
    end
    it 'descriptionが空では保存できないこと' do
      @dog.description = nil
      @dog.valid?
      expect(@dog.errors.full_messages).to include("Description can't be blank")
    end

  end
end

