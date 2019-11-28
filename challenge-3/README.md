# Challenge 3

## Project setup

This project represents a project that was submitted by a user and contains a problem they ran into. To get the project into the right state for tackling the problem, do the following:

#### 1. Run Prisma's development mode

Start Prisma's development mode with the following command:

```
npx prisma2 dev
```

#### 2. Seed the database

You can seed the database using [`script.ts`](./script.ts):

```
npm run dev
```

You're now readt to start working on the problem below.

## Problem description

Hello! I want to update my database schema to split the `name` column of the `User` table into two parts: `firstName` and `lastName`. The problem is that I already have production data in my database and I'm not sure how I can achieve the migration. I don't think Prisma supports this kind of migration where the data needs to be migrated in addition to a schema change, is there a workaround to achieve the migration without losing data but actually splitting the existing `name` values into two and still use Prisma afterwards?