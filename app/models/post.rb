class Post < ApplicationRecord

    validates  :title, presence: true
    validates  :text, presence: true
    validates  :slug, presence: true
    validates_uniqueness_of :slug


    after_create {NotificationService::call(self,true)}
    after_update {NotificationService::call(self,false)}

    before_validation :create_slug
    belongs_to :author

    def create_slug
      self.slug =  title.to_slug.normalize.to_s
    end

end
