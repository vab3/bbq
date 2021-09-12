class Vendor < ApplicationRecord
  has_many :locations, dependent: :delete_all
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  before_validation :set_slug

  def set_slug
    self.slug = name.parameterize
  end

  def to_param
    "#{self.id}-#{self.slug}"
  end

end
