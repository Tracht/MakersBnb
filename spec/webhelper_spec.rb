require 'pg'

USERID = 1
FIRST_NAME = 'John'
LAST_NAME = 'Doe'
EMAIL = 'john.doe@example.com'
PASSWORD = '$2a$12$Z3YyX5M1wOPn31Pfq8dA..o4x6oo3eC0ZV4l8PWeBU4t6/Q9gvPJS'
SPACEID = 1
NAME = 'Home'
DESCRIPTION = 'No place like home'
PRICE = 50
DATE = '2001/01/01'
REQUESTID = 1
BOOKINGID = 1
AVAILABILITIYID = 1

def empty_tables
  con = PG.connect :dbname => 'makersbnb_test', :user => 'student'
  rs = con.exec "TRUNCATE TABLE Spaces RESTART IDENTITY CASCADE;"
  rs = con.exec "TRUNCATE TABLE Users RESTART IDENTITY CASCADE;"
  rs = con.exec "TRUNCATE TABLE Requests RESTART IDENTITY CASCADE;"
  rs = con.exec "TRUNCATE TABLE Bookings RESTART IDENTITY CASCADE;"
  rs = con.exec "TRUNCATE TABLE Availabilities RESTART IDENTITY CASCADE;"
end

def fill_tables
  con = PG.connect :dbname => 'makersbnb_test', :user => 'student'
  rs = con.exec "INSERT INTO Users (first_name, last_name, email, password) VALUES ('#{FIRST_NAME}', '#{LAST_NAME}', '#{EMAIL}', '#{PASSWORD}');"
  rs = con.exec "INSERT INTO Spaces (name, description, price, date, userID) VALUES ('#{NAME}', '#{DESCRIPTION}', '#{PRICE}', '#{DATE}', '#{USERID}');"
  rs = con.exec "INSERT INTO Requests (date, spaceID, userID) VALUES ('#{DATE}', '#{SPACEID}', '#{USERID}');"
  rs = con.exec "INSERT INTO Bookings (date, spaceID, userID) VALUES ('#{DATE}', '#{SPACEID}', '#{USERID}');"
  rs = con.exec "INSERT INTO Availabilities (date, spaceID) VALUES ('#{DATE}', '#{SPACEID}');"
end
