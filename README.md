# Who cleans the bathroom?


## Setup

* Ruby version:

        2.5.1

* System dependencies:
        
        bundle install --path vendor/bundle

the `--path vendor/bundle` it's really important, since we force to install the system dependencies directly in the project folder. This way, we can easily make a bundle when we upload the function to AWS Lambda.

 * Creating the zip file
 
        zip who-cleans-the-bathroom.zip lambda_function.rb lib/ vendor/