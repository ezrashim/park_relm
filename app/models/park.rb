class Park < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  validates :title, presence: true
  validates :location, presence: true

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
