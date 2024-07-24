#!/bin/bash

PROJECT_NAME="create-databases"

# Create Rust project using cargo new
echo "-------------------------------------------------------"
echo "Creating new Rust project"
echo "-------------------------------------------------------"
echo "command: cargo new $PROJECT_NAME"
cargo new $PROJECT_NAME
echo "'$PROJECT_NAME' directory was created"
echo "-------------------------------------------------------"

echo "-------------------------------------------------------"
echo "Moving to $PROJECT_NAME project directory"
echo "-------------------------------------------------------"
echo "command: cd $PROJECT_NAME"
cd $PROJECT_NAME

echo "-------------------------------------------------------"
echo "Add diesel crate to project"
echo "-------------------------------------------------------"
echo "command: cargo add diesel --vers 1.4.4 --features \"postgres r2d2 chrono uuidv07 numeric serde_json\""
cargo add diesel@=1.4.4 --features "postgres r2d2 chrono uuidv07 numeric serde_json"

echo "-------------------------------------------------------"
echo "Add dotenv crate to project"
echo "-------------------------------------------------------"
echo "This crate is not needed by diesel but by our connection script to read our database URL variable which we'll set as an environmental variable"
echo "command: cargo add dotenv@=0.15.0"
cargo add dotenv@=0.15.0

echo "-------------------------------------------------------"
echo "Create migrations directory"
echo "-------------------------------------------------------"
echo "The migrations directories are readable timestamp directories with the name of the table we're creating at the end."
echo "The migrations directory can be generated manually in the root directory of the project (mkdir migrations)"
echo "or better using diesel setup instead" 
echo "command: diesel setup"
diesel setup

echo "-------------------------------------------------------"
echo "Create first table for comments"
echo "-------------------------------------------------------"
echo "command: diesel migration generate comment"
diesel migration generate comment

echo "Note that two files were generated up.sql and down.sql. The first one for the SQL generation and the latter for the revert"

echo "-----------------------------------------------------------"
echo "Create two fields in table for comments by editing up.sql"
echo "-----------------------------------------------------------"
echo "Edit up.sql to look like the following"
echo ""
echo "CREATE TABLE comments (
	id SERIAL PRIMARY KEY,
	body TEXT NOT NULL,
	media_item_id UUID NOT NULL references media_datas(id),
	created at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)"


echo "-----------------------------------------------------------"
echo "Revert action/Drop table by editing down.sql "
echo "-----------------------------------------------------------"
echo "Edit down.sql to look like the following"
echo ""
echo "DROP TABLE comments;"

