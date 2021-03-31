class Dog < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_many :comments, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :dog_sex
  belongs_to_active_hash :type

  with_options presence: true do
    validates :images, :name, :description
  end

  with_options numericality: { other_than: 1, message: 'を選んで下さい' } do
    validates :dog_sex_id, :type_id
  end

end
