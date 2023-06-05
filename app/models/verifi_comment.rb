class VerifiComment < ApplicationRecord
  belongs_to :user
  belongs_to :verifi_post
end
