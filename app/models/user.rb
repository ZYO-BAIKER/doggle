class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :dogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :avatar
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :sex
  belongs_to_active_hash :age
  belongs_to_active_hash :prefecture
  
  validates :nickname, presence: true, length: { maximum: 10 }
  validates :city,:avatar, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, on: :create, with: PASSWORD_REGEX,  message: 'は半角英数字混合で入力して下さい'

  with_options numericality: { other_than: 1, message: 'を選んで下さい' } do
    validates :sex_id, :age_id, :prefecture_id
  end

  mount_uploader :avatar, ImageUploader
  
end
