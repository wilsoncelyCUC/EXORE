class Criterium < ApplicationRecord
  belongs_to :user
  belongs_to :position
  validates :position_id, :search_status, presence: true

# Collections
SEARCH_STATUS = ["Starting Search","Actively searching","I am curiaus"]
NOTICE_PERIOD = ["Immediately", "3 months from now", "From this date:"]
SALARY_GRID = ["10 to 40k EUR","41 to 70 k EUR","+70 k EUR","Open"]
REMOTE_WORK_TYPE = ["Remote Friendly","Hybrid (WFH + In-office)","Fully Remote"]
#############

end
