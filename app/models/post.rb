class Post < ApplicationRecord
    mount_uploader :post_image, PostImageUploader

    validates :content, {presence: true, length: {maximum: 140}}
    validates :user_id, {presence: true}
    #validates :post_image, {presence: true}
  

    def user
      return User.find_by(id: self.user_id)
    end

end
