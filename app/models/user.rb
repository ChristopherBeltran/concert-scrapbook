class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username, :email, :password
  validates :email, email: true
  has_many :concerts

  def slug
    title = self.username
    slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    slug
  end

  def self.find_by_slug(slug)
    unslug = slug.gsub('-', ' ').gsub(/\S+/, &:capitalize)
    User.all.each do |user|
      x = user.username.gsub(/\W+/, '')
      y = unslug.gsub(/\W+/, '')
      if x.casecmp(y) == 0
       return user
      end
    end
  end

end
