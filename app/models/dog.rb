class Dog < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :dog_sex
  belongs_to_active_hash :type

  with_options presence: true do
    validates :image, :name, :description
  end

  with_options numericality: { other_than: 1, message: 'を選んで下さい' } do
    validates :dog_sex_id, :type_id
  end

end
