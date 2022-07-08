# _Mario's Food Store_

#### By _**Gabe Nielsen**_

#### _This is an application for a food store, stocked with products that all have reviews._

## Technologies Used

- _Ruby 2.6.10_
- _Rails 5.2.8_
- _SQL_
- _Faker_
- _HTML_
- _CSS / Bootstrap_
- _shoulda-matchers_

## Description

## Setup/Installation Requirements

- _Clone this repository_
- _Make sure that your Ruby version is 2.6.X, and Rails version is 5.2.X_
- _Navigate to the root directory in the terminal_
- _Run `bundle install` to install the necessary gems_
- _Run `rake db:create db:migrate`_
- _If you would like to see the test results, run `rspec`_
- _Run `rails s`_
- _In your web browser of choice, enter `localhost:3000`_

## Proposal

```
Name of Student:
  Gabe Nielsen

Name of Project:
  Board Game Review Condenser

Project's Purpose or Goal:
  This application will take reviews from boardgamegeek.com, and condense them so the most common words among reviews are listed.

List the absolute minimum features the project requires to meet this purpose or goal:
  A user can search a game and get the most common words among reviews.

What tools, frameworks, libraries, APIs, modules and/or other resources (whatever is specific to your track, and your language) will you use to create this MVP? List them all here. Be specific.
  -Ruby
  -Rails
  -Postman
  -Boardgamegeek API (buried in files)
  -Data visualization gem?

If you finish developing the minimum viable product (MVP) with time to spare, what will you work on next? Describe these features here: Be specific.
  -Different ways to visualize the data
  -Thorough testing
  -Add comments to code to explain the process
  -Add more than one review site

What additional tools, frameworks, libraries, APIs, or other resources will these additional features require?
  -Probably a couple other gems for data management / visualization

Is there anything else you'd like your instructor to know?
  My main concern for this project is being able to search games by name. I found the API used to hold the reviews, but I am not positive the only variable is the game name in the call. I suspect figuring this out will be the hardest part of the project. Worst case senario I will create a database with as many games as I can and a user can look up games from that library instead.
```

## Known Issues

- _None that I am aware of in this commit_

## License

Copyright (c) _2022_ _Gabe Nielsen_
