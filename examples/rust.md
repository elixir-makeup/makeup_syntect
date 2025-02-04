## Rust Code Example

```rust
use std::fs::{File, OpenOptions};
use std::io::{self, Write, Read};
use std::path::Path;

fn main() -> io::Result<()> {
    // File creation and writing
    let mut file = File::create("demo.txt")?;
    writeln!(file, "Hello, Rust!")?;

    // Append mode demonstration
    let mut append_file = OpenOptions::new()
        .append(true)
        .open("demo.txt")?;
    writeln!(append_file, "Appending new content")?;

    // Reading file contents
    let mut content = String::new();
    let mut read_file = File::open("demo.txt")?;
    read_file.read_to_string(&mut content)?;
    println!("File contents: {}", content);

    // Check if file exists
    let path = Path::new("demo.txt");
    if path.exists() {
        println!("File exists!");
    }

    // Writing binary data
    let bytes = [65, 66, 67]; // ABC in ASCII
    file.write_all(&bytes)?;

    // Buffer writing
    let mut buffer = io::BufWriter::new(file);
    buffer.write_all(b"Buffered write")?;
    buffer.flush()?;

    Ok(())
}
```