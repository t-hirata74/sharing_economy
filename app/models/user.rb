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
end
