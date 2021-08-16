class Vendor < ApplicationRecord
  has_many :locations
  enum status: { submitted: 0, approved: 1, rejected: 2 }
end
