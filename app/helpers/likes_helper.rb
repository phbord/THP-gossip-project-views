module LikesHelper
    def like_exists?(id)
        like = Like.find(id)
    end
end
