if @post.persisted?
  json.form render(partial: "posts/form", formats: :html, locals: {community: @community, post: Post.new})
  json.inserted_item render(partial: "posts/post", formats: :html, locals: {post_profile_likes: [Post.last, current_user.profiles.last, []]})
else
  json.form render(partial: "posts/form", formats: :html, locals: {community: @community, post: @post})
end

# if @post.persisted?
#   json.form render(partial: "posts/form", formats: :html, locals: {community: @community, post: Post.new})
#   json.inserted_item render(partial: "posts/post", formats: :html, locals: {post_profile_likes: post_profile_likes, community: @community})
# else
#   json.form render(partial: "posts/form", formats: :html, locals: {community: @community, post: @post})
# end
