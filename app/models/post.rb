class Post < ApplicationRecord
    mount_uploader :r_image, RImageUploader
    validates :user_id,{presence:true}
    
    def self.search(search,free)
        if search 
            @posts = Post.where(['r_adress LIKE ?', "%#{search}%"])
        elsif free
            @posts = Post.where(['r_introduction LIKE ? OR r_name LIKE ?', "%#{free}%", "%#{free}%"])
        else
            @posts = Post.all
        end
    end
end
