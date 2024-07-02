
# Instructions to Clone the Repo and Check User Access

1. **Clone the Repository:**

   Clone the repository to your server.

   ```bash
   git clone <repository-url>
   ```

2. **Set Username and Token:**

   Set the username and token by using the following commands:

   ```bash
   export username="abc"
   export token="abc"
   ```

3. **Grant Permissions to `list-users.sh`:**

   Grant write and execute permissions to `list-users.sh`:

   ```bash
   chmod +wx list-users.sh
   ```

4. **Execute the Script:**

   Execute the file to check repository access for users for a particular repository:

   ```bash
   ./list-users.sh organizationname reponame
   ```
