FactoryBot.define do
  factory :note_block do
    note { nil }
    content { "MyText" }
    index { 1 }
  end
end
