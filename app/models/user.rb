class User < ApplicationRecord
    # emailのエラー条件
    validates :email, {presence: true, uniqueness: true}
    # passwordのエラー条件
    validates :password, {presence: true}
    # nameのエラー条件
    validates :name, {presence: true}
    
    def requests
        return Request.where(user_id: self.id)
    end
end
