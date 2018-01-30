class Entry < ApplicationRecord

  belongs_to :user, dependent: :destroy

  validates :title, :content, :user_id, presence: true

  scope :current_month, lambda { where('created_at > ? AND created_at < ?', Time.now.beginning_of_month, Time.now.end_of_month) }
end
