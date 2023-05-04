class Criterium < ApplicationRecord
  belongs_to :user
  belongs_to :position

# Collections
SEARCH_STATUS = ["Starting Search","Actively searching","I am curiaus"]
NOTICE_PERIOD = ["Immediately", "3 months from now", "From this date:"]
SALARY_GRID = ["10 to 30k EUR","30 to 50 k EUR","50 to 80 k EUR","More"]
REMOTE_WORK_TYPE = ["Remote Friendly","Hybrid (WFH + In-office)","Fully Remote"]
#############

end
