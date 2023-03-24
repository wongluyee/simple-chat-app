class Message < ApplicationRecord
  self.table_name = "sca_messages"
  belongs_to :chatroom, foreign_key: "sca_chatroom_id"
  belongs_to :user, foreign_key: "user_id"
end
