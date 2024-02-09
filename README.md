# _Board Game Review Condenser_

#### By _**Gabe Nielsen**_

#### _This is an application for people to look up board games, and get a quick glimpse at what the reviews for it say._

## Live Site

_The host for the old live site has removed their free option. It is on my todo list to get it up and running again through github pages. This requires a slight restructuring of some files, and I am currently knee deep in another project of higher priority. Expect updates to this project soon._

## Technologies Used

- _Ruby 2.6.10_
- _Rails 5.2.8_
- _Rapid Automatic Keyword Extraction (RAKE)_
- _Postman_
- _Rspec_
- _HTML_
- _CSS / Bootstrap_

## Description

There are 2 different ways to run this application on your machine if you don't want to use the live site. The first is in the console. This doesn't require starting a server and using the web browser, but it is a little more manual. In the root directory run `bin/rails runner run.rb` and answer the prompt. The name of the game needs to be the **exact name of the game** to work, otherwise you will get errors. This will print out a csv of the data, where you can either import it to a sheets app, or just open as preview in VSC. The second way is to run the server and use a web browser. There is code that creates a word cloud from the results, but it is currently commented out. The method to create it is **very** unoptimized, sometimes taking up to 2 minutes to finish, so it remains an opt-in feature.

## Setup/Installation Requirements

- _Clone this repository_
- _Make sure that your Ruby version is 2.6.X, and Rails version is 5.2.X_
- _Navigate to the root directory in the terminal_
- _Run `bundle install` to install the necessary gems_
- _To run in terminal without needing a server/localhost: `bin/rails runner run.rb`_
- _Run `rails s`_
- _In your web browser of choice, enter `localhost:3000`_

## Rapid Automatic Keyword Extraction (RAKE) Algorithm

This algorithm really is one of the cornerstones of this project. Without it, there would be no reasonable way to gather words together, much less phrases. [This is a good summary](https://www.analyticsvidhya.com/blog/2021/10/rapid-keyword-extraction-rake-algorithm-in-natural-language-processing/) of the algorithm in a Python context, but the concepts are the same. It makes a matrix of the phrases in beween stop words, and gives them a score based on word frequency and Degree of word. [Here is a video that explains that process well](https://www.youtube.com/watch?v=ZOgrhn2Uq0U). I am using the [rake-nlp gem](https://github.com/spohlenz/rake-nlp) to help me do this with some customization for the games with lots of reviews.


## Known Issues

- _Many small improvements to the RAKE method or the output of results need to be made. I suspect this work will never be perfected alone and with my skillset._
- _Live site needs updating to github pages_
- _There's a world where I change the word cloud into a Python script with Myplotlib and Seaborn for easy data visualization. Not a high priority._

## License

Copyright (c) _2022_ _Gabe Nielsen_
