class Comment < ApplicationRecord
  #has_many :comments
  belongs_to :post
end
