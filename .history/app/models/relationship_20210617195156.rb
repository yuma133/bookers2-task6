class Relationship < ApplicationRecord
  #belongs_to :user user must be existsみたいなエラー出る
  belongs_to :follower, class_name: 'User', foreign_key: :follower_id #follower_id,followee_idはuser_idを参照
  belongs_to :followee, class_name: 'User', foreign_key: :followee_id

  validates :follower_id, presence: true
  validates :followee_id, presence: true
end
