class Message < ApplicationRecord
  belongs_to :booking

  after_create_commit {broadcast_append_to "messages"}
end
