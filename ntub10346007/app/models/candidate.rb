class Candidate < ApplicationRecord
   validates :name, presence: true
   has_many :logs
  
  def disolay_name
     "#{name}(#{party})"
  end
  
  def vote
    increment(:votes)
    #self.votes = self.votes + 1
    save
  end
  
  
end