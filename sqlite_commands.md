# Some important SQLite commands

SQLite has several unique functions that are not directly available in other database systems like MySQL or PostgreSQL. Here’s a list of such functions and their purpose:

---

### **1. `julianday()`**
- **What it does**: Converts a date or datetime into a Julian Day Number (a floating-point number representing days since noon on January 1, 4714 BCE).
- **Usage**: Date arithmetic and calculating precise date differences.
- **Example**:
  ```sql
  SELECT julianday('2024-12-26');
  ```

---

### **2. `strftime()`**
- **What it does**: Formats date and time into a specific string format.
- **Usage**: Extract or display parts of a date/time (like year, month, hour).
- **Example**:
  ```sql
  SELECT strftime('%Y-%m-%d', 'now');
  ```

---

### **3. `date()` and `time()`**
- **What they do**: 
  - `date()`: Returns the date part of a datetime string.
  - `time()`: Returns the time part of a datetime string.
- **Usage**: Simplifying datetime queries.
- **Example**:
  ```sql
  SELECT date('now'); -- Current date
  SELECT time('now'); -- Current time
  ```

---

### **4. `random()`**
- **What it does**: Generates a random integer between `-9223372036854775808` and `9223372036854775807`.
- **Usage**: Generate random numbers for testing or sampling data.
- **Example**:
  ```sql
  SELECT random();
  ```

---

### **5. `randomblob(N)`**
- **What it does**: Produces a random blob "binary data: storing images" of `N` bytes.
- **Usage**: Generate test data for blob fields.
- **Example**:
  ```sql
  SELECT randomblob(16); -- 16 random bytes
  ```

---

### **6. `zeroblob(N)`**
- **What it does**: Generates a blob of `N` bytes, all set to zero.
- **Usage**: Placeholder or initialization for blob data.
- **Example**:
  ```sql
  SELECT zeroblob(16); -- 16 bytes of zeros
  ```

---

### **7. `changes()`**
- **What it does**: Returns the number of rows modified by the last `INSERT`, `UPDATE`, or `DELETE` statement.
- **Usage**: Check how many rows were affected after a DML operation.
- **Example**:
  ```sql
  UPDATE users SET age = 30 WHERE id = 1;
  SELECT changes();
  ```

---

### **8. `last_insert_rowid()`**
- **What it does**: Returns the row ID of the last inserted row.
- **Usage**: Retrieve auto-incremented primary key values after an `INSERT`.
- **Example**:
  ```sql
  INSERT INTO users (name) VALUES ('Alice');
  SELECT last_insert_rowid();
  ```

---

### **9. `sqlite_version()`**
- **What it does**: Returns the version of SQLite being used.
- **Usage**: For debugging or compatibility checks.
- **Example**:
  ```sql
  SELECT sqlite_version();
  ```

---

### **10. `quote()`**
- **What it does**: Converts its argument to a string and properly escapes it for use in SQL statements.
- **Usage**: Safely escape values for dynamic SQL.
- **Example**:
  ```sql
  SELECT quote('O\'Reilly');
  ```
  **Output 'O''Reilly'** : This result is the properly escaped string. The single quote inside the word O'Reilly becomes '' (two single quotes), which is how SQL strings with quotes are represented.

---

### **11. `instr(X, Y)`**
- **What it does**: Finds the first occurrence of string `Y` in string `X` and returns its position.
- **Usage**: String searching within SQLite queries.
- **Example**:
  ```sql
  SELECT instr('hello world', 'world'); -- Returns 7 starts from 1, not from 0.
  ```

---

### **12. `hex()`**
- **What it does**: Converts a blob or integer into a hexadecimal string.
- **Usage**: Inspect or manipulate binary data in hexadecimal format.
- **Example**:
  ```sql
  SELECT hex(randomblob(4)); -- Converts a random blob to hex
  ```

---

### **13. `typeof(X)`**
- **What it does**: Returns the data type of the expression `X` (e.g., "integer", "text").
- **Usage**: Debugging and type checking.
- **Example**:
  ```sql
  SELECT typeof(42); -- Returns "integer"
  ```

---

### **14. `unicode(X)`**
- **What it does**: Returns the Unicode code point of the first character in the string `X`.
- **Usage**: Unicode character processing.
- **Example**:
  ```sql
  SELECT unicode('A'); -- Returns 65
  ```

---

### **15. `length(X)`**
- **What it does**: Returns the length of string `X` (or the number of bytes in a blob).
- **Usage**: Validate or analyze string lengths.
- **Example**:
  ```sql
  SELECT length('SQLite'); -- Returns 6
  ```

---

### **16. `printf()`**
- **What it does**: Formats a string using a printf-style template.
- **Usage**: Create formatted strings dynamically.
- **Example**:
  ```sql
  SELECT printf('The value is %d', 42);
  ```

---

### **17. `trim()`, `ltrim()`, `rtrim()`**
- **What they do**: Remove whitespace (or specified characters) from a string.
- **Usage**: Clean up text data.
- **Examples**:
  ```sql
  SELECT trim('  hello  '); -- "hello"
  SELECT ltrim('  hello  '); -- "hello  "
  SELECT rtrim('  hello  '); -- "  hello"
  ```

---

### **18. `json()` and JSON Functions**
- **What they do**: SQLite supports JSON-related functions to handle JSON data.
- **Key JSON Functions**:
  - `json()`: Creates a JSON object.
  - `json_extract()`: Extracts a value from a JSON object.
  - `json_array_length()`: Returns the length of a JSON array.
- **Example**:
  ```sql
  SELECT json_extract('{"name": "Alice", "age": 30}', '$.name');
  ```

---
---

### **Additional SQLite-Specific Functions**

#### **1. `coalesce()`**
- **What it does**: Returns the first non-NULL value in a list of arguments.
- **Usage**: Useful for handling NULL values.
- **Example**:
  ```sql
  SELECT coalesce(NULL, NULL, 'default_value');
  ```

---

#### **2. `ifnull(X, Y)`**
- **What it does**: Returns `Y` if `X` is `NULL`; otherwise, returns `X`.
- **Usage**: Simpler alternative to `COALESCE` for two arguments.
- **Example**:
  ```sql
  SELECT ifnull(NULL, 'default_value');
  ```

---

#### **3. `nullif(X, Y)`**
- **What it does**: Returns `NULL` if `X` is equal to `Y`; otherwise, returns `X`.
- **Usage**: Filter out specific values.
- **Example**:
  ```sql
  SELECT nullif(10, 10); -- Returns NULL
  SELECT nullif(10, 5);  -- Returns 10
  ```

---

#### **4. `group_concat(X, Y)`**
- **What it does**: Concatenates values in a group into a single string, separated by `Y` (or a comma by default).
- **Usage**: Aggregate strings in grouped queries.
- **Example**:
  ```sql
  SELECT group_concat(name, ', ') FROM users;
  ```

---

#### **5. `total()`**
- **What it does**: Returns the sum of all values in a column, treating `NULL` as `0`. It always returns a floating-point number.
- **Usage**: Calculate totals while avoiding NULL issues.
- **Example**:
  ```sql
  SELECT total(sales_amount) FROM orders;
  ```

---


#### **6. `replace(X, Y, Z)`**
- **What it does**: Replaces all occurrences of string `Y` in string `X` with string `Z`.
- **Usage**: Modify or clean up string data.
- **Example**:
  ```sql
  SELECT replace('SQLite is great', 'great', 'awesome');
  ```

---

#### **7. `substr(X, Y, Z)`**
- **What it does**: Extracts a substring from string `X` starting at position `Y` for `Z` characters.
- **Usage**: String manipulation.
- **Example**:
  ```sql
  SELECT substr('SQLite', 1, 3); -- Returns 'SQL'
  ```

---

### **JSON Functions (More Details)**
SQLite has extensive support for working with JSON, which is not common in many database systems. These include:
- `json_object()`: Creates a JSON object from key-value pairs.
- `json_array()`: Creates a JSON array.
- `json_array_length()`: Returns the number of elements in a JSON array.
- `json_type()`: Returns the type of a value in a JSON object (e.g., "text", "number").
- `json_insert()`: Inserts a value into a JSON object.

**Example**:
```sql
SELECT json_object('name', 'Alice', 'age', 25);
```

---

### **Window Functions**
SQLite also supports **window functions** (from version 3.25.0 onwards), which allow for advanced analytics. Examples:
- `row_number()`: Assigns a unique number to each row in a result set.
- `rank()`, `dense_rank()`: Ranks rows in a result set.
- `lag()`, `lead()`: Access preceding or following rows in a dataset.

**Example**:
```sql
SELECT name, age, row_number() OVER (ORDER BY age) AS rank FROM users;
```

---

### **Why Does SQLite Have Fewer Built-in Functions?**
SQLite is designed to be lightweight and embeddable. Its philosophy prioritizes simplicity and minimalism, which means it includes only essential or highly useful functions. 

If SQLite's built-in functions are not sufficient, you can:
1. Use custom SQL queries to replicate desired functionality.
2. Extend SQLite with custom functions via the C API.