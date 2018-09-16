json.ignore_nil!
json.set! :follower_avatar , @follower_user.profile.image
json.set! :follower_name , @follower_user.profile.username
json.set! :following_avatar , @following_user.profile.image
json.set! :following_name, @following_user.profile.username
json.set! :matching, @matching