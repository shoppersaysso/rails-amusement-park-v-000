class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction


  def take_ride
    enough_tickets, tall_enough = requirements
    if enough_tickets && tall_enough
      user.tickets = (user.tickets - attraction.tickets)
      user.happiness = (user.happiness + attraction.happiness_rating)
      user.nausea = (user.nausea + attraction.nausea_rating)
      user.save
      "Thanks for riding the #{attraction.name}!"
    elsif tall_enough && !enough_tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif enough_tickets && !tall_enough
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end
  end

  def requirements
    tall_enough, enough_tickets = false
    if self.user.height >= self.attraction.min_height
      tall_enough = true
    end
    if self.user.tickets >= self.attraction.tickets
      enough_tickets = true
    end
    return [enough_tickets, tall_enough]
  end

end
