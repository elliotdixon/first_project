require_relative( "../models/infinity_stone.rb" )
require_relative( "../models/manufacturer.rb" )
require("pry")

Manufacturer.delete_all()
InfintyStone.delete_all()

manufacturer1 = Manufacturer.new({
  "manufacturer_name" => "Earth"
  })

manufacturer1.save()

manufacturer2 = Manufacturer.new({
  "manufacturer_name" => "Vision"
  })

manufacturer2.save()

manufacturer3 = Manufacturer.new({
  "manufacturer_name" => "Collector"
  })

manufacturer3.save()

manufacturer4 = Manufacturer.new({
  "manufacturer_name" => "Morag"
  })

manufacturer4.save()

manufacturer5 = Manufacturer.new({
  "manufacturer_name" => "Kamar-Taj"
  })

manufacturer5.save()

manufacturer6 = Manufacturer.new({
  "manufacturer_name" => "Vormir"
  })

manufacturer6.save()



infinity_stone1 = InfintyStone.new({
  "stone_name" => "Space Stone",
  "description" => "Known as the Tesseract, the Space Stone can be used to open up doors in space.",
  "quantity" => 1,
  "buy_cost" => 20,
  "sell_price" => 30,
  "manufacturer_id" => manufacturer1.id
  })

  infinity_stone1.save()

infinity_stone2 = InfintyStone.new({
  "stone_name" => "Mind Stone",
  "description" => "If you need a mind created, manipulated or changed, the Mind Stone is what you need.",
  "quantity" => 2,
  "buy_cost" => 40,
  "sell_price" => 60,
  "manufacturer_id" => manufacturer2.id
  })

infinity_stone2.save()

infinity_stone3 = InfintyStone.new({
  "stone_name" => "Reality Stone",
  "description" => "Also known as the Aether the Reality Stone under the right circumstances has the ability to flick off the
  universe like a light switch and effectively change reality.",
  "quantity" => 4,
  "buy_cost" => 80,
  "sell_price" => 120,
  "manufacturer_id" => manufacturer3.id
  })

infinity_stone3.save()

infinity_stone4 = InfintyStone.new({
  "stone_name" => "Power Stone",
  "description" => "The Power Stone can only be wielded by incredibly strong and powerful beings or several semi-strong and powerful beings. It can be used to wipe out entire planets.",
  "quantity" => 6,
  "buy_cost" => 160,
  "sell_price" => 240,
  "manufacturer_id" => manufacturer4.id
  })

infinity_stone4.save()

infinity_stone5 = InfintyStone.new({
  "stone_name" => "Time Stone",
  "description" => "Whoever holds the Time Stone has control over all time, past, present and future.",
  "quantity" => 8,
  "buy_cost" => 320,
  "sell_price" => 480,
  "manufacturer_id" => manufacturer5.id
  })

infinity_stone5.save()

infinity_stone6 = InfintyStone.new({
  "stone_name" => "Soul Stone",
  "description" => "The holder of the Soul Stone has the ability to steal, control, manipulate and alter living and dea souls.",
  "quantity" => 10,
  "buy_cost" => 640,
  "sell_price" => 960,
  "manufacturer_id" => manufacturer6.id
  })

infinity_stone6.save()


binding.pry
nil
