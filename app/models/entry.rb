class Entry < ApplicationRecord

  belongs_to :user, dependent: :destroy

  validates :title, :content, :user_id, presence: true
end
