class Vendor < ApplicationRecord
  enum status: { submitted: 0, approved: 1, verified: 3, rejected: 4 }
end
