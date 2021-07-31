class User < ApplicationRecord
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :authentication_keys => [:user_name]#:validatable,

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # 半角英字大小文字、数字のを少なくとも1つ含む
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d\W_]{5,35}+\z/i
  # 半角英数字大小文字、数字を少なくとも一つ含む
  # 記号の入力を可能にする「＼W」が日本語の入力を通してしまうので、前のコードで除外している。
  VALID_USER_NAME_REGEX = /\A(?!.*?[亜-熙ぁ-んァ-ヶ])[a-zA-Z0-9\s\W_]{2,50}+\z/i
  validates :email, length: {in: 15..255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :user_name, presence: {message: "ユーザーネームは必須項目です。"}, length: {in: 2..50}, uniqueness: true, format:{with: VALID_USER_NAME_REGEX}
  validates :password, on: :create, presence: {message: "パスワードは必須項目です。"}, confirmation: true, length: {in: 5..35}, format:{with: VALID_PASSWORD_REGEX}
  validates :password_confirmation, presence: {message: "確認のためもう一度パスワードを入力してください。"}

  def email_required?
    false
  end

  def email_changed?
    false
  end

end
