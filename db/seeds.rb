@dealership_1 = Dealership.create!(name: "Ed Voyles Ford", created_at: DateTime.new(2000, 2, 2, 7, 30, 15), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), open: true, max_car_capacity: 150)

@dealership_2 = Dealership.create!(name: "Jim Ellis BMW", created_at: DateTime.new(1996, 1, 12, 8, 15, 37), updated_at: DateTime.new(2021, 4, 8, 9, 25, 17), open: true, max_car_capacity: 100)

@car_1 = Car.create!(dealership_id: @dealership_1.id, name: "Ford Fusion", created_at: DateTime.new(2015, 6, 22, 9, 30, 15), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), inspected: true, price: 15999.99)

@car_2 = Car.create!(dealership_id: @dealership_1.id, name: "Ford Explorer", created_at: DateTime.new(2012, 8, 12, 7, 30, 19), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), inspected: true, price: 11999.99)

@car_3 = Car.create!(dealership_id: @dealership_2.id, name: "BMW M3", created_at: DateTime.new(2005, 7, 24, 10, 05, 22), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), inspected: true, price: 22999.99)

@car_4 = Car.create!(dealership_id: @dealership_2.id, name: "BMW M6", created_at: DateTime.new(2002, 3, 2, 6, 03, 17), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), inspected: true, price: 32999.99)

@car_5 = Car.create!(dealership_id: @dealership_2.id, name: "Ford Taurus", created_at: DateTime.new(2012, 4, 22, 9, 15, 22), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), inspected: true, price: 20999.99)

@car_4 = Car.create!(dealership_id: @dealership_2.id, name: "BMW M5", created_at: DateTime.new(2013, 7, 2, 11, 18, 15), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), inspected: true, price: 42999.99)

@stand_1 = FarmersMarketStand.create!(name: "Red Wagon Organic Farm", city: "Boulder", seasonal: true, staffing: 3)

@stand_2 = FarmersMarketStand.create!(name: "Devries Produce", city: "Olathe", seasonal: false, staffing: 5)

@produce_item_1 = ProduceItem.create!(farmers_market_stand_id: @stand_1.id, type: "spinach", created_at: DateTime.new(2021, 4, 12, 8, 03, 17), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), weight: 1.1, price_by_weight: 3.29, organic: true)

@produce_item_2 = ProduceItem.create!(farmers_market_stand_id: @stand_1.id, type: "cherries", created_at: DateTime.new(2021, 4, 14, 9, 03, 30), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), weight: 2.4, price_by_weight: 7.18, organic: false)

@produce_item_3 = ProduceItem.create!(farmers_market_stand_id: @stand_2.id, type: "corn", created_at: DateTime.new(2021, 4, 22, 3, 11, 45), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), weight: 3.2, price_by_weight: 6.37, organic: false)

@produce_item_4 = ProduceItem.create!(farmers_market_stand_id: @stand_2.id, type: "peaches", created_at: DateTime.new(2021, 4, 26, 7, 13, 33), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), weight: 2.9, price_by_weight: 8.67, organic: true)

@produce_item_5 = ProduceItem.create!(farmers_market_stand_id: @stand_1.id, type: "potatoes", created_at: DateTime.new(2021, 4, 22, 9, 13, 17), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), weight: 6.2, price_by_weight: 1.37, organic: false)

@produce_item_6 = ProduceItem.create!(farmers_market_stand_id: @stand_2.id, type: "strawberries", created_at: DateTime.new(2021, 5, 3, 9, 12, 55), updated_at: DateTime.new(2020, 3, 10, 12, 15, 30), weight: 1.2, price_by_weight: 5.31, organic: true)
