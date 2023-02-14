require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    it 'ユーザー名は必須であること' do
      user = build(:user, username: nil)
      user.valid?
      expect(user.errors[:username]).to include('を入力してください')
    end

    it 'ユーザー名は一意であること' do
      user_a = create(:user, username: 'ユーザー')
      user_b = build(:user, username: 'ユーザー')
      user_b.valid?
      expect(user_b.errors[:username]).to include('はすでに存在します')
    end

    it 'メールアドレスは必須であること' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end

    it 'メールアドレスは一意であること' do
      user_a = create(:user, email: 'test@example.com')
      user_b = build(:user, email: 'test@example.com')
      user_b.valid?
      expect(user_b.errors[:email]).to include('はすでに存在します')
    end

    it 'パスワードは6文字以上であること' do
      user = build(:user, password: 'a' * 5, password_confirmation: 'a' * 5)
      user.valid?
      expect(user.errors[:password]).to include('6文字以上')
    end
  end
end

# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  admin            :boolean          default(FALSE), not null
#  crypted_password :string
#  email            :string           not null
#  salt             :string
#  username         :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email     (email) UNIQUE
#  index_users_on_username  (username) UNIQUE
#
