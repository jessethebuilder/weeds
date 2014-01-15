u = User.new :email => 'test@test.com', :password => 'test8888'
u.save!

SectionsHelper::SECTIONS.each do |k, v|
  s = Section.new(:name => v[:name],
                 :description => v[:description],
                 :items_pricing_scheme => k == :flowers ? 'weight' : 'unit'
  )
  s.save!
end

flowers = Section.where(:name => 'Flowers').first
concentrates = Section.where(:name => 'Concentrates').first

ItemsHelper::ITEMS.each do |i|
  item = Item.new(:name => i[0], :description => i[1])
  item.section = flowers
  pricing = Pricing.new(:scheme => item.section.items_pricing_scheme, :per_gram => 10.0, :per_quarter => 50,
                        :per_half => 100, :per_ounce => 200, :per_eighth => 30)

  3.times do |n|
    i = Image.create(:description => 'A description goes here.')
    i.image.store!(File.open(File.join(Rails.root, 'app', 'assets', 'images', 'test', "pot#{n}.jpg")))
    item.images << i
  end

  item.pricing = pricing
  item.section = flowers
  item.save!

  item2 = item.dup
  item2.pricing = pricing.dup
  item2.section = concentrates
  item2.save!
end

