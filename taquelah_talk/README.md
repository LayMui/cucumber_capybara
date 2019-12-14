# e2e test automation

```
Clone from github
git clone https://github.com/LayMui/cucumber_capybara.git

To run in local environment with dependencies setup
-Install Ruby 
-Install bundle (bundle is a library to simplify the task of installing several gems)
-Go to project root folder and run
    bundle install
-Run the test (default to single)
    rake

To run a single test, run bundle exec rake single
To run local tests, run bundle exec rake local
To run parallel tests, run bundle exec rake parallel

To run specific test, modify the Rake task in the Rakefile
 task.cucumber_opts = ['--format=pretty', 'features/signin.feature', 'CONFIG_NAME=local']

To run on the cloud, comment out the following line at the Rakefile
ENV['chrome'] ||= 'true'

Structure:

```bash
├── Rakefile
├── Gemfile
├── Gemfile.lock
├── README.md
└── config
    ├── local.config.yml
    ├── parallel.config.yml
    ├── single.config.yml
└── features
    ├── signin.feature
    
    ├── ....
    └── support
        ├── env.rb
        ├── hooks.rb
        ├── world.rb
    └── step_definitions
        ├── sign_in.rb
      
        ├── ...
```

The high level feature files served as the living documentation that express scenarios
in business domain specific language using Gherkins syntax 'Given, When, Then'

Ruby code that supports step definition can go into the features/support which are loaded 
before the step definitions

The env.rb is loaded first. This is where you need to boot up your app

Cucumber read the features file and map to the step definitions
1 file per domain entities such as signin,  etc
Step definition execute in the context of an Object called the World.
By adding my own World module, we make the step definition code easier to read and
able to decouple the step definition from the system.
Any @instance_variable instantiated in a step definition will be assigned to the World, and can be accessed from other step definitions. Example The Actor (user) @james.

Includes modules with helper method to the World

To integrate with browserstack
set the env variables
BROWSERSTACK_USERNAME
BROWSERSTACK_ACCESS_KEY

reference: 
https://github.com/browserstack/capybara-browserstack

