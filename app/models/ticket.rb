class Ticket < ApplicationRecord
    belongs_to :user

    # def owner
    #     self.user_id = current_user.id
    # end
end
