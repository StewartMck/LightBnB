const { Pool } = require("pg");
const pool = new Pool({
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
});

/****       Users       ****/

//Get a single user from the database given their email.
const getUserWithEmail = function(email) {
  return pool
    .query(
      `SELECT * FROM users
     WHERE email = $1;`,
      [email]
    )
    .then((res) => res.rows ? res.rows[0] : null);
};
exports.getUserWithEmail = getUserWithEmail;

//Get a single user from the database given their id.
const getUserWithId = function(id) {
  return pool
    .query(
      `SELECT * FROM users
      WHERE id = $1;
    `, [id]
    )
    .then(res => res.rows ? res.rows[0] : null);
};
exports.getUserWithId = getUserWithId;

//Add a new user to the database.
const addUser = function(user) {
  return pool
    .query(
      `INSERT INTO users (name, email, password)
      VALUES($1, $2, $3)
      RETURNING *;
      `, [user.name, user.email, user.password])
    .then(res => res.rows[0].id);
};
exports.addUser = addUser;

/****       Reservations       ****/

//Get all reservations for a single user.
const getAllReservations = function(guest_id, limit = 10) {
  return pool.query(
    `SELECT reservations.*, properties.*, AVG(property_reviews.rating) as average_rating
    FROM reservations
    JOIN properties ON reservations.property_id = properties.id
    JOIN property_reviews ON properties.id = property_reviews.property_id
    WHERE reservations.guest_id = $1
    AND reservations.end_date < NOW()::date
    GROUP BY reservations.id, properties.id
    ORDER BY start_date
    LIMIT $2;`, [guest_id, limit])
    .then(res => res.rows);
};
exports.getAllReservations = getAllReservations;

/****       Properties       ****/

//Get all properties.
const getAllProperties = function(options, limit = 10) {

  /*QUERY STRUCTURE:
    SELECT
    FROM
    JOIN
    WHERE
    GROUP BY
    HAVING
    ORDER BY
    LIMIT
  */

  const queryParams = [];
  
  // SELECT, FROM, JOIN
  let queryString = `
  SELECT properties.*, AVG(property_reviews.rating) as average_rating
  FROM properties
  LEFT OUTER JOIN property_reviews ON properties.id = property_reviews.property_id
  `;

  // WHERE
  // Owner ID queried through 'My Listings' route
  if (options.owner_id) {
    queryParams.push(options.owner_id);
    queryString += `WHERE owner_id = $${queryParams.length}`;
  }

  if (options.city) {
    queryParams.push(`%${options.city}%`);
    queryString += `WHERE city LIKE $${queryParams.length} ${options.minimum_price_per_night || options.maximum_price_per_night ? 'AND ' : ''}`;
  }

  // Adjust for dollars (as user input) to cents (as stored in db)
  if (options.minimum_price_per_night && options.maximum_price_per_night) {
    queryParams.push(options.minimum_price_per_night * 100);
    queryString += `cost_per_night BETWEEN $${queryParams.length} AND `;
    queryParams.push(options.maximum_price_per_night * 100);
    queryString += `$${queryParams.length}`;
  } else if (options.minimum_price_per_night) {
    queryParams.push(options.minimum_price_per_night * 100);
    queryString += `cost_per_night >= $${queryParams.length}`;
  } else if (options.maximum_price_per_night) {
    queryParams.push(options.maximum_price_per_night * 100);
    queryString += `cost_per_night <= $${queryParams.length}`;
  }

  // GROUP BY
  queryString += `
  GROUP BY(properties.id)`;

  // HAVING
  if (options.minimum_rating) {
    queryParams.push(options.minimum_rating);
    queryString += `
  HAVING AVG(property_reviews.rating) >= $${queryParams.length}`;
  }

  // ORDER BY, LIMIT
  queryParams.push(limit);
  queryString += `
  ORDER BY cost_per_night
  LIMIT $${queryParams.length};
  `;

  return pool
    .query(queryString, queryParams)
    .then((res) => res.rows);
};
exports.getAllProperties = getAllProperties;


//Add a property to the database
const addProperty = function(property) {

  const queryParams = Object.values(property);
  let queryString = `
  INSERT INTO properties (title, description, number_of_bedrooms, number_of_bathrooms, parking_spaces, cost_per_night, thumbnail_photo_url, cover_photo_url, street, country, city, province, post_code, owner_id)
  VALUES(`;

  queryParams.forEach((item, index) => {
    queryString += `${index === 0 ? '' : ', '}$${index + 1}${index === queryParams.length - 1 ? ')' : ''}`;
  });

  queryString += `
  RETURNING *;`;

  return pool.query(queryString, queryParams)
    .then(res => res.rows);
};
exports.addProperty = addProperty;