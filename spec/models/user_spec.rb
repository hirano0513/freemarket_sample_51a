require 'rails_helper'
describe User do
  describe '#create' do

    it "nickname, email, password, password_confirmationが入力されていれば登録されること" do
      user = User.new(nickname: "test", email: "test@gmail.com", password: "00000000", password_confirmation: "00000000")
      expect(user).to be_valid
    end

    it "nicknameが空の場合に登録されないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "emailが空の場合に登録されないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "emailが重複していた場合に登録されないこと" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "passwordが空の場合に登録されないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "password_confirmationが空の場合に登録されないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "passwordとpassword_confirmationが一致しないと登録されないこと" do
      user = build(:user, password_confirmation: "11111111")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "passwordが6文字未満の場合に登録されないこと" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    it "passwordが6文字以上の場合に登録されること" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      expect(user).to be_valid
    end

  end
end