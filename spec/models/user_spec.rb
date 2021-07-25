require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "spec: モーダルからのユーザー登録" do

    it "メールアドレス、ユーザーネーム、パスワードがありなおかつその確認が同じ値であればログインできる" do
     # expect(FactoryBot.create(:user)).to be_vaild
    user = create(:user)
    expect(user).to be_valid
    end

    it "ユーザーネームがなければ登録できない" do
      expect(build(:user, user_name: "")).to_not be_valid
    end

    it "ユーザーネームが重複する場合登録できない" do
      user1 = create(:user, user_name: "user1")
      expect(build(:user, user_name: user1.user_name)).to_not be_valid
    end

    it "ユーザーネームが2文字以下かつ50文字以上の半角大小文字の場合登録できる" do
      expect(build(:user, user_name: "K _1ly@()-")).to be_valid
    end

    it "ユーザーネームが2文字以下かつ50文字以上の半角大小文字でない場合登録できない" do
      valid_addresses = %w[USERS12345@foo.COM THE_US_ER43215@foo.bar.org first.middle.last@foo.jp]
      invalid_user_names = %w[きりぃ i K1lly()-96K1lly()-96K1lly()-96K1lly()-96K1lly()-961]
      valid_addresses.zip(invalid_user_names) do |valid_address, invalid_user_name|
        expect(build(:user, user_name:invalid_user_name, email:valid_address)).to_not be_valid
      end
    end

    it "メールアドレスがなければ登録できない" do
      expect(build(:user, email: "")).to_not be_valid
    end

    it "メールアドレスが重複する場合登録できない" do
      user1 = create(:user, user_name: "user1", email: "user1@sound-effects.com")
      expect(build(:user, user_name: "user2", email: user1.email)).to_not be_valid
    end

    it "メールアドレスに@とドメイン名を含まれない場合登録できない" do
      # user = create(:user, email:"aaaaaaaaaaaaaaaaaaaaaaa")
      expect(build(:user, email:"aaaaaaaaaaaaaaaaaaaaaaa")).to_not be_valid
    end

    it "メールアドレスが15字以下かつ225字以上の場合登録できない" do
      expect(build(:user, email:"a" + "@example.com")).to_not be_valid
      expect(build(:user, email:"a" * 255 + "@example.com")).to_not be_valid
    end

    it "メールアドレスが有効な型の場合登録できる" do
      valid_addresses = %w[USERS12345@foo.COM THE_US_ER43215@foo.bar.org first.middle.last@foo.jp]
      user_names_pre = %w[user1 user2 user3]
      valid_addresses.zip(user_names_pre) do |valid_address, user_name_pre|
        expect(build(:user, user_name:user_name_pre, email:valid_address)).to be_valid
      end
    end

    it "メールアドレスが有効な型でない場合登録できない" do
      invalid_addresses = %w[user@example,com user_at_foo.org foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        expect(build(:user, email:invalid_address)).to_not be_valid
      end
    end

    it "パスワードがなければ登録できない" do
      expect(build(:user, password: "")).to_not be_valid
    end

    it "パスワードが暗号化されているかどうか(= dbの「password_digest」の値とパスワードの値とが一致しないかどうか)" do
      user = create(:user)
      expect(user.encrypted_password).to_not be "K1lly()-"
      # not: expect(user.encrypted_password).to_not be "K1lly()-"
      # deviseを使うときは、テスト時にはpassword_digestではなく「encrypted_password」。
    end

    it "パスワードとその確認とが異なる場合登録できない" do
      expect(build(:user, password: "K1lly()-", password_confirmation: "K1lly89-")).to_not be_valid
    end
  end

  # describe "spec: モーダルからのログイン" do
  #
  #   it "ログインが正常にできる" do
  #     login_user(:user)
  #   end
  #
  #   # 諦める。
  #   # よくよく考えてみると「ログインができること」だけなら
  #   # 「ログインできたときだけXXができる」のテストで兼用でログインもテストできる。
  #   # そして(本命)ググっても出ない&考えてもわからない。

  #  こ・ん・ど・こ・そ　
  #  諦める。
  #  こんな場所で這いずり回るより削りながらでも先へ進んだ方が建設的だ。
  #  次回ユーザー周りでテストするならさっさと「ユーザー編集」など
  # 「ログインが必須になる機能」の実装に移る。
  #  …ってあれ、なんかフラグってね？
  # end

  describe "spec: モーダルからのユーザー編集" do

    # let(:user){create(:user)}
    #
    # before do
    #   login_user user
    # end

    it "ログイン中のみユーザー編集が可能" do

    end

    it "ログイン中のみユーザー編集が可能" do

    end

  end




end
