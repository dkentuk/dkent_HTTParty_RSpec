Readme - D.Kent RSpec w/ HTTParty
===========================

This is the Readme on how to run the RSpec Tests
The project is an exercise routine testing out the basic functionality of HTTParty and it's respective use as a testing tool

## Installation
Clone the folder from the URL:

```
https://github.com/dkentuk/dkent_HTTParty_RSpec
```

Navigate to the folder using Command Prompt or alternative
An example of this could be

```
C:\Users\'YourUserName'\Desktop\dkent_HTTParty_RSpec
```

Once navigated to the folder - Run:

```
bundler install
```

This will look in the 'Gemfile' folder, and automatically download all necessary gems for the project to work
If you do not have bundler installed, look within the gem file, and download the necessary 'Ruby Gems' manually.
For this project, I have provided the necessary 'Gems' below:

> source 'https://rubygems.org'

* gem 'rspec', '~>3.1.0',
* gem 'httparty', '~>0.11.0'
* gem 'pry'

## How to Use
From within the command line ``` dkent_HTTParty_RSpec``` 
Type:

```
rspec
```

The let the program run it's course. Done.

## Observervation
Once run, you should see a list of tests, and whether or not if they failed or not.

The passed should come up green (If you have a colour scheme downloaded or using 'pry')

Any that have failed will return red and with a ```(FAILED - 1)```
From there, the failure reason can be observed.
