class Request < ApplicationRecord
    # nameのエラー条件
    validates :name, {presence: true}
    # phoneのエラー条件
    validates :phone, {presence: true}
    # genreのエラー条件
    validates :genre, {presence: true}
    # placeのエラー条件
    validates :place, {presence: true}
    # dateのエラー条件
    validates :date, {presence: true}
    # user_idのエラー条件
    validates :user_id, {presence: true}
    
    def user
        return User.find_by(id: self.user_id)
    end
    
end
