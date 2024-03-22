class NavyaRecord < ApplicationRecord
    self.abstract_class = true
  
    connects_to database: { writing: :navya, reading: :navya }
  end
  