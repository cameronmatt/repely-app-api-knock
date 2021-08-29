class Comment < ApplicationRecord
    belongs_to :ticket
    belongs_to :user

    #validates :comment, presence: true

    #instanace method of user to get the 
    #serializer can call comment.user
end
