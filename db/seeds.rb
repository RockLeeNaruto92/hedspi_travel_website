(1..100).each do |n|
  5.times{FactoryGirl.create :place, owner_id: n}
end
