Santa's elves have reported an issue with gift distribution fairness. Some children are receiving gifts far more expensive than others in their neighborhood. Santa wants to ensure a more equitable distribution by identifying these cases. He needs to find all children who received gifts that are more expensive than the average gift price in the North Pole's gift database, so he can review and adjust the distribution plan accordingly.


# Example Schema:
    DROP TABLE IF EXISTS children CASCADE;
    DROP TABLE IF EXISTS gifts CASCADE;
    CREATE TABLE children (
        child_id SERIAL PRIMARY KEY,
        name VARCHAR(100),
        age INTEGER,
        city VARCHAR(100)
    );
    CREATE TABLE gifts (
        gift_id SERIAL PRIMARY KEY,
        name VARCHAR(100),
        price DECIMAL(10,2),
        child_id INTEGER REFERENCES children(child_id)
    );

# Example Data:
    INSERT INTO children (name, age, city) VALUES
        ('Tommy', 8, 'London'),
        ('Sarah', 7, 'London'),
        ('James', 9, 'Paris'),
        ('Maria', 6, 'Madrid'),
        ('Lucas', 10, 'Berlin');
    
    INSERT INTO gifts (name, price, child_id) VALUES
        ('Robot Dog', 45.99, 1),
        ('Paint Set', 15.50, 2),
        ('Gaming Console', 299.99, 3),
        ('Book Collection', 25.99, 4),
        ('Chemistry Set', 109.99, 5);

# Example solution
     child_name |   gift_name    | gift_price 
    ------------+----------------+------------
     Lucas      | Chemistry Set  |     109.99
     James      | Gaming Console |     299.99

## Solution to submit
Lucas

The reason is because the average gift price is 99.492.
