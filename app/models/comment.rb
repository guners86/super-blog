# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :integer
#

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  
  validates :body, presence: true
end
