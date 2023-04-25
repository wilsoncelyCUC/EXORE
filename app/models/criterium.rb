class Criterium < ApplicationRecord
  belongs_to :user
  belongs_to :position

# Collections
SEARCH_STATUS = ["Starting Search For New Job","Actively searching, with on-going interviews","I am curiaus"]
NOTICE_PERIOD = ["Immediately", "3 months from now", "From this date:"]
SALARY_GRID = ["10 to 30k EUR","30 to 50 k EUR","50 to 80 k EUR","Open"]
#############

end
