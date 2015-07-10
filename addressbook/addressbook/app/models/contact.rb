
class Contact < ActiveRecord::Base
	
	class Contact < ActiveRecord::Base
	  validates :name, presence: true
	  validates :address, presence: true
	end

end
