class Rental < ApplicationRecord
    validates :customer_name, presence: true, format: { with: /^[A-Z]/, message: "must be capitalized."}, exclusion: { in: %w(Jeff), message: "is not allowed!" }
    validates :date_time, presence: true
    validates :boat_name, presence: true
    validate :date_time_cannot_be_in_the_past, 
        :date_time_is_date_time
end


# The customer name, date/time, and boat name can not be blank or nil.
# 2. The date/time needs to be an actual date/time
# 3. The date/time can not be in the past.
# 4. The customer name must be capitalized.
# 5. The customer name can not be Jeff (Jeff is banned from the rental shop for prior boat damage)

def date_time_cannot_be_in_the_past
    if date_time < DateTime.now
      errors.add(:date_time, "can't be in the past")
    end
end

def date_time_is_date_time
    if date_time.class !=  DateTime
        errors.add(:date_time, "must be an actual date & time")
    end
end