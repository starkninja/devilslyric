Models:

User
 - hasmany comments
 - hasmnay transactions
 - hasmany shouts

 - username
 - password hash
 - email
 - avatar link
 - balance

Comment
 - belongsto author
 - belongsto transaction
 - author
 - content
 - transaction id

Transaction
 - belongs to user
 - to
 - from
 - amount

Shout
  - author
  - content
  - recipient
