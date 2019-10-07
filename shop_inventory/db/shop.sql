DROP TABLE infinity_stones;
DROP TABLE manufacturer;


CREATE TABLE manufacturers
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE infinity_stones
(
  id SERIAL8 primary key,
  product_name VARCHAR(255),
  description TXT,
  Quantity INT8,
  buy_cost INT8,
  sell_price INT8,
  manufacturer_id INT8 references manufacturers(id)
);
