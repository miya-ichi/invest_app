require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'バリデーション' do
    it 'タグ名は必須であること' do
      tag = build(:tag, name: nil)
      tag.valid?
      expect(tag.errors[:name]).to include('を入力してください')
    end

    it 'タグ名は一意であること' do
      create(:tag, name: 'tag')
      tag = build(:tag, name: 'tag')
      tag.valid?
      expect(tag.errors[:name]).to include('はすでに存在します')
    end

    it 'タグ名は15文字以内であること' do
      tag = build(:tag, name: 'a' * 15)
      tag.valid?
      expect(tag.errors[:name]).not_to include('は15文字以内で入力してください')

      tag = build(:tag, name: 'a' * 16)
      tag.valid?
      expect(tag.errors[:name]).to include('は15文字以内で入力してください')
    end
  end
end

# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string(15)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tags_on_name  (name) UNIQUE
#
