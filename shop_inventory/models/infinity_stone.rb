require_relative("../db/sql_runner")
require_relative("manufacturer")


class InfintyStone


  attr_accessor :stone_name, :description, :quantity, :buy_cost, :sell_price, :manufacturer_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @stone_name = options['stone_name']
    @description = options['description']
    @quantity = options['quantity'].to_i()
    @buy_cost = options['buy_cost'].to_i()
    @sell_price = options['sell_price'].to_i()
    @manufacturer_id = options['manufacturer_id'].to_i()
  end

  def save()
    sql = "INSERT INTO infinity_stones
    (
      stone_name,
      description,
      quantity,
      buy_cost,
      sell_price,
      manufacturer_id
    )
      VALUES
    (
      $1, $2, $3, $4, $5, $6
    )RETURNING id"
    values = [@stone_name, @description, @quantity, @buy_cost, @sell_price, @manufacturer_id]
    result = SqlRunner.run(sql, values)
    @id = result.first["id"].to_i()
  end

  def update()
    sql = "UPDATE infinity_stones SET
    (
    stone_name,
    description,
    quantity,
    buy_cost,
    sell_price,
    manufacturer_id
    ) =
    (
    $1, $2, $3, $4, $5, $6
    )
    WHERE id = $7"
    values = [@stone_name, @description, @quantity, @buy_cost, @sell_price, @manufacturer_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM infinity_stones WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def manufacturer()
    sql = "SELECT * FROM manufacturers WHERE id = $1"
    values = [@manufacturer_id]
    manufacturer_data = SqlRunner.run(sql, values)
    manufacturers = Manufacturer.map_items(manufacturer_data)
    return manufacturers
  end

  def self.find(id)
    sql = "SELECT * FROM infinity_stones WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    infinity_stone = InfintyStone.new(result)
    return infinity_stone
  end

  def self.all()
    sql = "SELECT * FROM infinity_stones"
    infinity_stone_data = SqlRunner.run(sql)
    infinity_stones = map_items(infinity_stone_data)
    return infinity_stones
  end

  def self.delete_all()
    sql = "DELETE FROM infinity_stones"
    SqlRunner.run(sql)
  end

  def self.map_items(infinity_stones_data)
    return infinity_stones_data.map { |infinity_stone| InfintyStone.new(infinity_stone)}
  end

  def stock_count()
   return "Out of Stock" if @quantity == 0
   return "Stock Level Good" if @quantity >= 5
   return "Low stock" if @quantity < 5
 end

end
