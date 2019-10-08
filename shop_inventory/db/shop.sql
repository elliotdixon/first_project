DROP TABLE infinity_stones;
DROP TABLE manufacturers;


CREATE TABLE manufacturers
(
  id SERIAL8 primary key,
  manufacturer_name VARCHAR(255) not null
);

CREATE TABLE infinity_stones
(
  id SERIAL8 primary key,
  stone_name VARCHAR(255),
  description TEXT,
  quantity INT8,
  buy_cost INT8,
  sell_price INT8,
  manufacturer_id INT8 references manufacturers(id)
);
