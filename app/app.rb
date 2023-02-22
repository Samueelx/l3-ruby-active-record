require "pry"
require "active_record"

# TODO: CONNECT TO THE DATABASE
ActiveRecord::Base.establish_connection(
    adapter: "sqlite3",
    database: "db/school.db"
)
# TODO: CREATE TABLE
create_tm_table = <<-SQL
    CREATE TABLE IF NOT EXISTS mentors (id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name TEXT, email TEXT, 
    UNIQUE(email)
)
SQL

ActiveRecord::Base.connection.execute(create_tm_table)
# TODO: Create class that associates with the db table
class Mentor < ActiveRecord::Base

end
# TODO: VIEW METHODS AVAILABLE FOR TABLE (methods)

# TODO: COLUMN NAMES (column_names)
pp Mentor.column_names
# TODO: CREATE NEW RECORD (create)
#Mentor.create(name: "Abel", email: "abel@gmail.com")
# TODO: VIEW ALL RECORDS (all)
pp Mentor.all
# TODO: FIND BY ID (find)
pp Mentor.find(1)
# TODO: FIND BY GIVEN CONDITIONS (find_by)
pp Mentor.find_by(name: "Abel")
# TODO: UPDATE RECORDS (save)
abel = Mentor.find_by(name: "Abel")
abel.email = "starboy@gmail.com"
abel.save
