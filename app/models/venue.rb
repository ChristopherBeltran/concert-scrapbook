class Venue < ActiveRecord::Base
  has_many :concerts
  has_many :artists, through: :concerts


  #need concert_id in venues table


  def slug
    title = self.name
    slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    slug
  end

  def self.find_by_slug(slug)
    unslug = slug.gsub('-', ' ').gsub(/\S+/, &:capitalize)
    Venue.all.each do |venue|
      x = venue.name.gsub(/\W+/, '')
      y = unslug.gsub(/\W+/, '')
      if x.casecmp(y) == 0
       return venue
      end
    end
  end
end
