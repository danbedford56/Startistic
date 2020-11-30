# Startistic #

## User Stories: ##

### User story 1:
```
  So that they can use the app,
  A user can make an account.
```
### User story 2:
```
  So that they can use the app,
  A user can sign in to their account
```
### User story 3:
```
  So that the user can edit their information,
  A user can view their profile.
```
### User story 4:
```
  So that a user can present an opportunity,
  A user should be able to post a new opportunity.
```
### User story 5:
```
  So that they can view opportunities,
  A user should see relevant opportunities on their activity feed.
```
### User story 6:
```
  So that they can take an opportunity,
  A user should be able to sign up for an opportunity that they fit.
```
### User story 7:
```
  So that opportunities get relevant applicants,
  Only users matching op description can sign up.
```
### User story 8:
```
  So that users can deal with op applications,
  they should be able to view a list of applicants.
```
### User story 9:
```
  So that they choose an applicant,
  A user can send a message to an applicant.
```
### User story 10:
```
  So that a user can see industry activity,
  relevant activity should appear on the user's activity feed.
```
### User story 11:
```
  So that a user can manage their posted ops,
  They should be able to see a list of their ops.
```
### User story 12:
```
  So that a user can find specific content,
  they should be able to search for keywords.
```
### User story 13:
```
  So that a user has a more seemless experience,
  They should stay logged in when closing the app unless explicitly stated otherwise.
```

## Classes and structs ##
 - User
 - Opportunity
 - PortfolioPost
 - Application
 - Search

 ### Properties:
 - User:
  - id
  - username
 - Opportunity:
  - id
  - description
  - images = []
  - title
  - must_haves = []
  - nice_to_haves = []
  - posted_date
  - closing_date
  - applications = []
 - PortfolioPost:
  - title
  - id
  - message (small)
  - images = []
  - posted_date
  - likes
 - Application:
  - id
  - op_id
  - applicant_id
  - images = []
  - nice_to_have_matches = [Bool]
  - message
  - accepted?

 ### Methods:
 - User:
  - Static:
    - .find(id:)
    - .create(all the user db properties) (private)
    - .update(^^)
    - .delete(id:)
    - .sign_in(username, password)
    - .sign_up(infos....)
 - Opportunity
  - Static:
    - .find(id:)
    - .create(all op db properties)
    - .update(^^)
    - .delete(id:)
  - Instance:
    - .closed?
    - .apply()
 - PortfolioPost
  - Static:
    - .find(id:)
    - .create(all post properties for db)
    - .update(id:)
    - .delete(id:)
  - Instance:
    - .like()
 - Application:
  - Static:
    - .find(id:)
    - .create(all application properties for db)
    - .update(id:)
    - .delete(id:)
  


