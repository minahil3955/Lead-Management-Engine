# Lead-Management-Engine
This product is aimed at managing sales leads and their process in an organization.
## Assumptions:
   - User having role of Business Developer can only create Leads.
   - Only Creator of Lead can add Phases on it.
   - Anyone can add and view comments who can view Leads and Phases on them simulteanously.
   - Each phase must be assigned a manager upon its creation.
   - Creator of phase can add engineers on the phase later on.
   - All users can see the basic details of Leads, Phases and comments on them.
## Prerequisites :
The setups steps expect following tools installed on the system.
Github :
  * Ruby 2.7.1
  * Rails 6.1.3.1
  * psql (PostgreSQL) 13.2 (Ubuntu 13.2-1.pgdg20.04+1)
### Check out the repository
git clone git@github.com:minahil3955/Lead-Management-Engine.git

### Create and setup the database
Run the following commands to create and setup the database.
```
bundle exec rails db:create
bundle exec rails db:setup
```
### Start the Rails server
You can start the rails server using the command given below.
```
bundle exec rails s
```
And now you can visit the site with the URL http://localhost:3000
