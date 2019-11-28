# Challenge 4

## Project setup

This project represents a project that was submitted by a user and contains a problem they ran into. To get the project into the right state for tackling the problem, do the following:

#### 1. Specify database and database credentials in Prisma schema

For this challenge, you can use whatever database you prefer (and is supported by Prisma). Just configure the database connection in [`./prisma/schema.prisma`](./prisma/schema.prisma).

#### 2. Install project dependencies

Run the following command in this directory:

```
npm install
```

#### 3. Run Prisma's development mode

Start Prisma's development mode with the following command:

```
npx prisma2 dev
```

This performs the initial migration of your database and generates Photon.js.

#### 4. Seed the database

You can seed the database with the data in [`./prisma/seed.ts`](./prisma/seed.ts):

```
npm run seed
```

#### 5. Start the GraphQL server

You can start the GraphQL server using this command:

```
npm run dev
```

This should now throw the error that's further described below. 

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

What are the necessary steps to achieve this? Also, would there be a way to make the "number" of top posts configurable in the API somewhow?