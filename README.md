# Periodic Table CLI

This project provides a command-line interface (CLI) tool to query information about chemical elements from a PostgreSQL database. It includes a pre-configured database schema and a Bash script to fetch and display element details.

## Features

- Query elements by atomic number, symbol, or name.
- Display detailed information, including:
  - Atomic number
  - Name
  - Symbol
  - Type (e.g., metal, nonmetal, metalloid)
  - Atomic mass
  - Melting point (in Celsius)
  - Boiling point (in Celsius)

## Prerequisites

- PostgreSQL installed on your system.
- Bash shell.
- Access to the `freecodecamp` PostgreSQL user.

## Setup

1. Clone this repository:

   ```bash
   git clone <repository-url>
   cd periodic-table
   ```

2. Import the database schema and data:

   ```bash
   psql --username=freecodecamp --file=periodic_table.sql
   ```

3. Ensure the `element.sh` script is executable:

   ```bash
   chmod +x element.sh
   ```

## Usage

Run the `element.sh` script with an element's atomic number, symbol, or name as an argument. For example:

```bash
./element.sh 1
```

Output:

```
The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
```

If the element is not found:

```
I could not find that element in the database.
```

## Database Schema

The database consists of two tables:

1. **elements**
   - `atomic_number` (Primary Key)
   - `symbol`
   - `name`

2. **properties**
   - `atomic_number` (Primary Key, Foreign Key to `elements`)
   - `type`
   - `weight`
   - `melting_point`
   - `boiling_point`

## Contributing

Feel free to submit issues or pull requests to improve this project.

## License

This project is licensed under the MIT License.
