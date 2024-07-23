# Chapter 2: Server side

## Database with Diesel

- Install the Diesel cli
```bash
cargo install diesel_cli
```

- If that fails, you're probably using an incompatible version of the mysql libraries, or missing them.

- Install the libmysqlclient
```bash
sudo apt-get install libmysqlclient-dev
```

- Install the Diesel cli for postgres
```bash
cargo install diesel_cli --no-default-features --features postgres
```
