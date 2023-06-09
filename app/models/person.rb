class Person < ActiveRecord::Base
  belongs_to :location
  belongs_to :role
  belongs_to :manager, class_name: "Person", foreign_key: :manager_id
  has_many :employees, class_name: "Person", foreign_key: :manager_id

  def self.in_region(region)
    with_region.where(regions: { name: region })
  end

  def self.alphabetically_by_region_and_location
    with_region.order("regions.name, locations.name, people.name")
  end

  def self.with_region
    joins(location: :region)
  end
end
