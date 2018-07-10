# README

Instructions:

Start server:

```bash
rails s
```

Because of the way this is set up (a valid JWT token is required to be in the Authorization header),
you will need the [ModHeader](https://mod-header.appspot.com/) browser extension.

Once you have that installed, place the following token into the `Authorization` request header.

```bash
eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.DiPWrOKsx3sPeVClrm_j07XNdSYHgBa3Qctosdxax3
```

---

Navigate to `http://localhost:3000/graphiql`.

**Quick Tip** CTRL + [space] tells you what is needed for the next field in the query.
The documentation on the left is more helpful, however, IMO.

Here's an example for the createUser mutation:

```bash
mutation {
  signInUser(authInput: {email: "a@all.com", password: "123123"}) {
    token
    user {
      email
      id
    }
  }
}
```

