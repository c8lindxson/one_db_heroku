class VerifiNotification < ApplicationRecord
  belongs_to :user
  belongs_to :VerifiPost
end
