# README

Uses Redis as primary storage and Redcord as the ORM (https://github.com/chanzuckerberg/redcord).

Since external library use was encouraged, a barebones Redis ORM wrapper was useful. BCrypt for basic password encryption.

Utilizes the CreateUser interactor to handle validations since Redcord doesn't currently include them, and instead of bloating the controller.

Run tests with 'rails test'. Focuses on testing responses in controller tests and validations in the CreateUser tests.
