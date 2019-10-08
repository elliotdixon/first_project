require_relative("../db/sql_runner")


class Manufacturer


  attr_reader :id
  attr_accessor :manufacturer_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @manufacturer_name = options['manufacturer_name']
  end

  def save()
    sql = "INSERT INTO manufacturers
    (
      manufacturer_name
    )
      VALUES
    (
      $1
    )RETURNING id"
    values = [@manufacturer_name]
    result = SqlRunner.run(sql, values)
    @id = result.first["id"].to_i()
  end

  def update()
    sql = "UPDATE manufacturers SET manufacturer_name = $1 WHERE id = $2"
    values = [@manufacturer_name]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM manufacturers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def infinity_stones()
    sql = "SELECT * FROM infinity_stones where manufacturer_id = $1"
    values = [@id]
    infinity_stones_data = SqlRunner.run(sql, values)
    infinity_stone = InfintyStone.map_items(infinity_stones_data)
    return infinity_stone
  end

  def self.find(id)
    sql = "SELECT * FROM manufacturers WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    manufacturer = Manufacturer.new(result)
    return manufacturer
  end

  def self.all()
    sql = "SELECT * FROM manufacturers"
    manufacturer_data = SqlRunner.run(sql)
    manufacturers = map_items(manufacturer_data)
    return manufacturers
  end

  def self.delete_all()
    sql = "DELETE FROM manufacturers"
    SqlRunner.run(sql)
  end


  def self.map_items(manufacturer_data)
    return manufacturer_data.map { |manufacturer| Manufacturer.new(manufacturer)}
  end

end
