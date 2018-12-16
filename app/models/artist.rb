class Artist < ActiveRecord::Base
  has_many :concerts
  has_many :venues, through: :concerts


  def slug
    title = self.name
    slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    slug
  end

  def self.find_by_slug(slug)
    unslug = slug.gsub('-', ' ').gsub(/\S+/, &:capitalize)
    Artist.all.each do |artist|
      x = artist.name.gsub(/\W+/, '')
      y = unslug.gsub(/\W+/, '')
      if x.casecmp(y) == 0
       return artist
      end
    end
  end
end
