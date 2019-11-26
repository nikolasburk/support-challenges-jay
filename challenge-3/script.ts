import { Photon } from '@generated/photon'

const photon = new Photon()

// A `main` function so that we can use async/await
async function main() {
  // Seed the database with users and posts
  const user1 = await photon.users.create({
    data: {
      name: 'Harry Potter',
    },
  })

  const user2 = await photon.users.create({
    data: {
      name: 'Ron Weasly',
    },
  })

  const user3 = await photon.users.create({
    data: {
      name: 'Hermione Granger',
    },
  })

  const user4 = await photon.users.create({
    data: {
      name: 'Lord Voldemort',
    },
  })
  
}

main()
  .catch(e => console.error(e))
  .finally(async () => {
    await photon.disconnect()
  })
