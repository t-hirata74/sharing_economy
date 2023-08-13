class User < ApplicationRecord
  devise :database_authenticatable, # 認証
         :registerable, # 新規登録
         :recoverable, # パスワードリセット
         :rememberable, # ログイン状態を保持
         :validatable, # バリデーション
         :confirmable, # メールアドレス認証
         :lockable, # パスワード複数間違いでアカウントロック
         :timeoutable, # ログイン保持機能
         :trackable # ログイン時のipなどを記録

  validates :nickname, presence: true
  validates :gender, presence: true
  before_validation :skip_confirmation!, if: :new_record?
  after_create :create_stripe_customer

  has_one :user_information, dependent: :destroy
  has_one :user_mobile_phone, dependent: :destroy
  has_one :stripe_customer, dependent: :destroy
  has_one :current_shipping_address, dependent: :destroy
  
  has_many :items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy
  has_many :seller_orders, through: :items, source: "order"
  has_many :payer_orders, class_name: "Order"
  has_many :payer_evaluations, through: :seller_orders
  has_many :seller_evaluations, through: :payer_orders
  
  enum gender: {
    unanswered: 0,
    male: 1,
    demale: 2
  }

  class << self
    def genders_i18n
      I18n.t("enums.user.gender")
    end
  end

  def remember_me
    true
  end

  def liked?(item)
    favorites.exists?(item: item)
  end
end
