module NotificationService
  def self.call(post,is_create)
    if post.published
      Author.where.not(id: post.author_id).each do |author|
        if is_create
          NotificationMailer.send_notification(author.email,post.title, "Создан").deliver_later
        else
          NotificationMailer.send_notification(author.email,post.title, "Обновлен").deliver_later
        end
      end
    end
  end
end
