## HTML Code Example

```html
<!DOCTYPE html>
<html>

<head>
  <title>Page Title</title>
</head>

<body>

  <h1 class="header">This is a Heading</h1>

  <h2 class="header">This is a Subheading</h2>

  <p>
    This <em>is</em> a paragraph.
    It contains <strong>several</strong> sentences</p>

</body>

</html>
```

### With inline CSS and JavaScript

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>HTML Syntax Demo</title>
    <style>
      /* CSS demonstrates different selectors and properties */
      body {
        font-family: Arial, sans-serif;
        line-height: 1.6;
        margin: 2rem;
      }

      .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ddd;
      }

      /* Descendant selector */
      .container h1 {
        color: #2c3e50;
      }

      /* Pseudo-class */
      a:hover {
        color: #e74c3c;
      }

      /* Attribute selector */
      input[type="text"] {
        padding: 8px;
        border: 2px solid #3498db;
        border-radius: 4px;
      }

      /* Combinators */
      h2+p {
        font-style: italic;
      }

      /* Media query */
      @media (max-width: 600px) {
        .container {
          padding: 10px;
        }
      }
    </style>
  </head>
  <body>
    <div class="container">
      <!-- Headings -->
      <h1>HTML Syntax Features</h1>

      <!-- Text formatting -->
      <p>This is a <strong>bold text</strong> and this is an <em>italicized text</em>.</p>
      <p>You can also use <mark>highlighted text</mark> and <code>inline code</code>.</p>

      <!-- Lists -->
      <h2>Unordered List</h2>
      <ul>
        <li>First item</li>
        <li>Second item
          <ul>
            <li>Nested item</li>
          </ul>
        </li>
      </ul>

      <!-- Table -->
      <h2>Table Example</h2>
      <table border="1">
        <thead>
          <tr>
            <th>Header 1</th>
            <th>Header 2</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Data 1</td>
            <td>Data 2</td>
          </tr>
        </tbody>
      </table>

      <!-- Form -->
      <h2>Form Elements</h2>
      <form onsubmit="handleSubmit(event)">
        <div>
          <label for="name">Name:</label>
          <input type="text" id="name" name="name" required>
        </div>
        <div>
          <label>
            <input type="checkbox" name="subscribe"> Subscribe to newsletter
          </label>
        </div>
        <button type="submit">Submit</button>
      </form>

      <!-- Interactive element -->
      <h2>Interactive Demo</h2>
      <button onclick="changeColor()">Change Heading Color</button>
    </div>

    <script>
      // JavaScript demonstrates various features

      // Event handling
      function handleSubmit(event) {
        event.preventDefault();
        const formData = new FormData(event.target);
        const name = formData.get('name');
        alert(`Hello, ${name}!`);
      }

      // DOM manipulation
      function changeColor() {
        const heading = document.querySelector('h1');
        const randomColor = '#' + Math.floor(Math.random() * 16777215).toString(16);
        heading.style.color = randomColor;
      }

      // Array methods and arrow functions
      const numbers = [1, 2, 3, 4, 5];
      const doubled = numbers.map(num => num * 2);
      console.log('Doubled numbers:', doubled);

      // Async/await example
      async function fetchData() {
        try {
          const response = await fetch('https://api.example.com/data');
          const data = await response.json();
          console.log(data);
        } catch (error) {
          console.error('Error:', error);
        }
      }

      // Class definition
      class Counter {
        constructor() {
          this.count = 0;
        }

        increment() {
          this.count++;
          return this.count;
        }
      }

      // Event listener
      document.addEventListener('DOMContentLoaded', () => {
        console.log('Document loaded!');
      });
    </script>
  </body>
</html>
```
