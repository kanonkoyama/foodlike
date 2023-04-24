class User < ApplicationRecord
  mount_uploader :image, ImageUploader

  def posts
    return Post.where(user_id: self.id)
  end      
   
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
