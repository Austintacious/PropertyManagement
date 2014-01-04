class Building < ActiveRecord::Base
  belongs_to :owner
  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zipcode

  validates :street_address, format: {with: /\A\d{1,5}\s[a-z]+\s[a-z]+\z/i}
  validates :city, format: {with: /\A[a-z]+\z/i}
  validates :state, format: {with: /\A[a-z]{2}\z/i}
  validates :zipcode, format: {with: /\A[0-9]{5}\z/}

  # def states 
  #   ['AL','AK','AZ','AR','CA','CO','CT','DE','FL','GA','HI','ID','IL','IN','IA','KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VT','VA','WA','WV','WI','WY']
  # end
end
