json.text simple_format(@comment.text)
json.created_at @comment.created_at.strftime("%F")
json.id @comment.id
json.user_name @comment.user.nickname
json.user_id @comment.user_id
json.item_user_id @comment.item.user.id
json.item_id @comment.item.id