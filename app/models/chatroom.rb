class Chatroom < ApplicationRecord
  self.table_name = "sca_chatrooms"
  has_many :messages, foreign_key: "sca_chatroom_id"
end
