# Challenge 4

## Problem description

I want to add a new feature to my GraphQL API where posts can have "views" (i.e. a sort of score that indicates how often a post has been viewed and therefore gives a sense of the popularity of the post). I also want to be able to query the top 3 posts of any user with a query similar to this:

```graphql
query {
  users {
    id
    name
    topThreePosts {
      id
      title
    }
  }
}
```

What are the necessary steps to achieve this?