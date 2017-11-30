class PostTransition < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.last_state
    order('created_at DESC').first.to_state
  end
end
