# The Gossip Project, the project of the year 

by Nicolas HODEE

How to install it?

```
$ bundle install

$ rails db:create

$ rails db:migrate

$ rails db:seed
```

How to use it?

Aller  : http://localhost:3000/

What we can do here:

    Create a user account
    Login as a registered user
    Check the last gossips
    See the creators
    Contact them (maybe)
    Create a new gossip, comment it and update it
    

Here's the global key concepts we are using here :
* config/routes.rb : create all possibles urls. 
* app/controllers : where we can find all our controllers
> 1. Contact : manage the contact page display
> 2. Gossip : manage the contact page display (find the gossip id to display)
> 3. Team : manage the team page display
> 4. User : Show the selected user (and find the user id to display)
> 5. Welcome : manage the homepage display + the Welcome page for someone if we type 'http://localhost:3000/welcome/someone/'
* views : One folder per controller plus one file per function. 
> 1. contact/index : displayed content for the contact page
> 2. gossip/show :  displayed content for a specific gossip
> 3. team/index : displayed content for the team page
> 4. user/show : displayed content for the user page
> 5. welcome/index : displayed content for the homepage with all the gossips
> 6. welcome/show : customized welcome page for someone, go to 'http://localhost:3000/welcome/untel'
