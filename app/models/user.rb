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
end
