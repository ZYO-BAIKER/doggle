class Dog < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :sex
  belongs_to_active_hash :type

  with_options presence: true do
    validates :image, :name, :description
  end

  with_options numericality: { other_than: 1 } do
    validates :sex_id, :type_id
  end

end
