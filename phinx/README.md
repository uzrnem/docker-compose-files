### Phinx database migration tools

#### Supported Adapter
> MySQL: specify the mysql adapter.
> PostgreSQL: specify the pgsql adapter.

#### Future Adapters
> SQLite: specify the sqlite adapter.
> SQL Server: specify the sqlsrv adapter.

Please raise MR for this adapter

## MYSQL
```
version: "3.7"

services:
  phinx:
    image: phinx:0.1
    container_name: phinx
    volumes:
      - $PWD/db:/phinx/db
    environment:
      PHINX_DB_HOST: mysqlhost
      PHINX_DB_DATABASE: mydb
      PHINX_DB_USERNAME: postgres
      PHINX_DB_PASSWORD: changeme
```


## PostgreSQL
```
version: "3.7"

services:
  phinx:
    image: phinx:0.1
    container_name: phinx
    volumes:
      - $PWD/db:/phinx/db
    environment:
      PHINX_DB_ADAPTER: pgsql
      PHINX_DB_HOST: postgresdb
      PHINX_DB_DATABASE: mydb
      PHINX_DB_USERNAME: postgres
      PHINX_DB_PASSWORD: changeme
      PHINX_DB_PORT: 5432
```

#### Php Code
```
./vendor/bin/phinx create PostsTableMigration
./vendor/bin/phinx migrate
./vendor/bin/phinx rollback
./vendor/bin/phinx status

./vendor/bin/phinx seed:create UserSeeder
./vendor/bin/phinx seed:run -v

$this->table('posts')->drop()->save();

$table = $this->table('posts');
$table->rename('articles')
    ->update();

$table = $this->table('posts');
$table->changePrimaryKey('new_primary_key');
$table->update();
```