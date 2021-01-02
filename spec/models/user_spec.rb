require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end  
  describe "ユーザー新規登録" do
    it "ニックネームが空だと登録できない" do
      @user.nickname = ""
      binding.pry
    end
    it "メールアドレスが空だと登録できない" do
    end
    it "重複したemailが存在する場合登録できない" do
    end
    it "メールアドレスは、@を含む必要があること" do
    end
    it "パスワードが空だと登録できない" do
    end
    it "パスワードは、6文字以上での入力が必須であること" do
    end
    it "パスワードは、半角英数字混合での入力が必須であること" do
    end
    it "パスワードは、確認用を含めて2回入力すること" do
    end
    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
    end
  end
end
