## Ruby Database with Active Record - Employee Tracker

An app that lets people design and take surveys, July 19th, 2016

By Molly McGlone & Maldon Meehan

## Description

An Epicodus student project to practice Ruby database with Active Record.

Employee Tracker
* Build an app for a company to help track employees and the current projects they're assigned.
* HR manager should be able to create divisions in the company (HR, IT, Sales, etc).
* HR manager, should be able to list, update, and delete divisions.
* HR manager, should be able to add employees and assign them to a division.
* An employee will belong to one division and a division will have many employees.
* HR manager, will be able to choose an individual division and see its employees.

*Refactor Project Using Many-to-Many, July 21, 2016*

Practice building a many-to-many association, clone the employees-projects repo. This application currently has a one-to-many association in place. Update it to reflect a many-to-many relationship between employees and projects .

## Setup/Installation Requirements

Install *Employee Tracker* by cloning the repository.  
```
$ git clone https://github.com/maldonmeehan/employee-tracker-many-to-many.git
or https://github.com/mollykmcglone/Employee_Tracker.git
```

Install required gems:
```
$ bundle install
```

Run Postgress:
```
$ postgres
```

Open a new window and run:
```
$ rake db:create
$ rake db:migrate
$ rake db:test:prepare
```

Start the Sinatra webserver:
```
$ ruby app.rb
```

Navigate to `localhost:4567` in your browser of choice.

## Known Bugs

No known bugs at this point

## Support and contact details

If you have any questions please feel free to contact Maldon and Molly on github

## Technologies Used

* Ruby
* Postgres
* Sinatra

### License

MIT License

Copyright (c) 2016, **Molly McGlone & Maldon Meehan, Epicodus**
