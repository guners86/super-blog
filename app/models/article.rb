# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(150)
#  body       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  
  validates :title, presence: true, length: {maximum: 100}
  validates :body, presence: true
end
