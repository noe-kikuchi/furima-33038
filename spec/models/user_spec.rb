require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end  
  describe "ユーザー新規登録" do
    it "全ての項目の入力が存在すれば登録できること" do
      expect(@user).to be_valid
    end
    it "ニックネームが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "メールアドレスが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end
    it "メールアドレスは、@を含む必要があること" do
      @user.email = "test.com"
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it "パスワードが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "パスワードは、6文字以上での入力が必須であること" do
      @user.password = "aaa1"
      @user.valid?
      expect(@user.errors.full_messages).to include  "Password is too short (minimum is 6 characters)"
    end
    it "passwordが英文字のみでは登録できない" do
      binding.pry
      @user.password = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it "passwordが数字のみでは登録できない" do
      @user.password = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it "password_confirmationがない場合は登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "last_nameがない場合は登録できないこと" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it "last_nameは、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.last_name = "@@"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
    end
    it "first_nameがない場合は登録できないこと" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it "first_nameは、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.first_name = "@@"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it "last_name_kanaがない場合は登録できないこと" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it "last_name_kanaは、全角カタカナでの入力が必須であること" do
      @user.last_name_kana = "aa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid"
    end
    it "first_name_kanaがない場合は登録できないこと" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it "first_name_kanaは、全角カタカナでの入力が必須であること" do
      @user.first_name_kana = "aa"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end
    it "birth_date_idがない場合は登録できないこと" do
      @user.birth_date_id = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth date can't be blank"
    end
  end
end
