# _Board Game Review Condenser_

#### By _**Gabe Nielsen**_

#### _This is an application for people to look up board games, and get a quick glimpse at what the reviews for it say._

## Live Site

https://board-game-review-condenser.herokuapp.com/

## Technologies Used

- _Ruby 2.6.10_
- _Rails 5.2.8_
- _Rapid Automatic Keyword Extraction (RAKE)_
- _Postman_
- _Rspec_
- _HTML_
- _CSS / Bootstrap_

## Description

There are 2 different ways to run this application. The first is in the console. This doesn't require starting a server and using the web browser, but it is a little more manual. In the root directory run `bin/rails runner run.rb` and answer the prompt. The name of the game needs to be the **exact name of the game** to work, otherwise you will get errors. This will print out a csv of the data, where you can either import it to a sheets app, or just open as preview in VSC. The second way is to run the server and use a web browser. There is code that creates a word cloud from the results, but it is currently commented out. The method to create it is **very** unoptimized, sometimes taking up to 2 minutes to finish, so it remains an opt-in feature.

## Setup/Installation Requirements

- _Clone this repository_
- _Make sure that your Ruby version is 2.6.X, and Rails version is 5.2.X_
- _Navigate to the root directory in the terminal_
- _Run `bundle install` to install the necessary gems_
- _To run in terminal without needing a server/localhost: `bin/rails runner run.rb`_
- _Run `rails s`_
- _In your web browser of choice, enter `localhost:3000`_

## Rapid Keyword Extraction (RAKE) Algorithm

This algorithm really is one of the cornerstones of this project. Without it, there would be no reasonable way to gather words together, much less phrases. [This is a good summary](https://www.analyticsvidhya.com/blog/2021/10/rapid-keyword-extraction-rake-algorithm-in-natural-language-processing/) of the algorithm in a Python context, but the concepts are the same. It makes a matrix of the phrases in beween stop words, and gives them a score based on word frequency and Degree of word. [Here is a video that explains that process well](https://www.youtube.com/watch?v=ZOgrhn2Uq0U). I am using the [rake-nlp gem](https://github.com/spohlenz/rake-nlp) to help me do this with some customization for the games with lots of reviews.

## Proposal

```
Name of Student:
  Gabe Nielsen

Name of Project:
  Board Game Review Condenser

Project's Purpose or Goal:
  This application will take reviews from boardgamegeek.com, and condense them so the most important words among reviews are listed.

List the absolute minimum features the project requires to meet this purpose or goal:
  A user can search a game and get the most important words among reviews.

What tools, frameworks, libraries, APIs, modules and/or other resources (whatever is specific to your track, and your language) will you use to create this MVP? List them all here. Be specific.
  -Ruby
  -Rails
  -Postman
  -Boardgamegeek API
  -Rapid Keyword Extraction

If you finish developing the minimum viable product (MVP) with time to spare, what will you work on next? Describe these features here: Be specific.
  -Different ways to visualize the data
  -Thorough testing
  -Add comments to code to explain the process
  -Add more than one review site
  -Optimizing the RAKE results
  -Integrating a different keyword extraction tool

What additional tools, frameworks, libraries, APIs, or other resources will these additional features require?
  -Probably a couple other gems for data management / visualization
```

## Known Issues

- _Many small improvements to the RAKE method or the output of results need to be made. I suspect this work will never be perfected alone and with my skillset._

## License

Copyright (c) _2022_ _Gabe Nielsen_
