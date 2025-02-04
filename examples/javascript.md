## JavaScript Code Example

```javascript
#!/usr/bin/env node
// This is a single-line comment

/* This is a multi-line comment
   showing various JavaScript features */

// Module imports
import defaultExport from "module-name";
import * as name from "module-name";
import { export1 } from "module-name";
import { export1 as alias1 } from "module-name";
import { default as alias } from "module-name";
import { export1, export2 } from "module-name";
import { export1, export2 as alias2 } from "module-name";
import { "string name" as alias } from "module-name";
import defaultExport, { export1 } from "module-name";
import defaultExport, * as name from "module-name";
import "module-name";

// Import attributes
import { names } from "module-name" with {};
import { names } from "module-name" with { key: "data" };
import { names } from "module-name" with { key: "data", key2: "data2" };
import { names } from "module-name" with { key: "data", key2: "data2", keyN: "dataN" };

export { names } from "module-name" with {};
export { names } from "module-name" with { key: "data" };
export { names } from "module-name" with { key: "data", key2: "data2" };
export { names } from "module-name" with { key: "data", key2: "data2", keyN: "dataN" };

// Numbers
const integers = 42;
const float = 3.14159;
const hex = 0xFF;
const binary = 0b1010;
const octal = 0o777;
const bigInt = 9007199254740991n;
const scientific = 1.23e-4;

// Strings
const singleQuoted = 'Hello World';
const doubleQuoted = "Hello World";
const escapedString = 'It\'s a beautiful day\nNew line\tTabbed';
const templateLiteral = `Current value: ${integers + float + {}}
  Multi-line string
  With interpolation: ${hex}`;

// Symbols
const symbol = Symbol('description');
const uniqueSymbol = Symbol.for('global');

// Arrays and destructuring
const array = [1, 2, 3, 'mixed', true, null];
const [first, second, ...rest] = array;
const matrix = [[1, 2], [3, 4]];

// Objects and destructuring
const person = {
  name: 'John',
  age: 30,
  'special-key': true,
  method() {
    return this.name;
  },
  get fullName() {
    return `${this.name} Doe`;
  },
  set fullName(value) {
    this.name = value;
  }
};

const { name, age: personAge } = person;

// Classes
class Animal {
  #privateField = 'hidden';
  static species = 'Unknown';

  constructor(name) {
    this.name = name;
  }

  static createDog() {
    return new this('Dog');
  }

  makeSound() {
    console.log('Generic animal sound');
  }
}

class Dog extends Animal {
  constructor(name, breed) {
    super(name);
    this.breed = breed;
  }

  makeSound() {
    console.log('Woof!');
  }
}

// Functions
function normalFunction(a, b = 1) {
  return a + b;
}

const arrowFunction = (x, y) => {
  return x * y;
};

const shortArrow = x => x * 2;

async function asyncFunction() {
  try {
    const response = await fetch('https://api.example.com');
    const data = await response.json();
    return data;
  } catch (error) {
    console.error(error);
    throw new Error('Failed to fetch');
  }
}

// Control structures
if (array.length > 0) {
  console.log('Array has elements');
} else if (array.length === 0) {
  console.log('Array is empty');
} else {
  console.log('Impossible condition');
}

for (let i = 0; i < array.length; i++) {
  if (i === 1) continue;
  if (i === 4) break;
  console.log(array[i]);
}

for (const item of array) {
  console.log(item);
}

for (const key in person) {
  console.log(key, person[key]);
}

while (false) {
  console.log('Never reached');
}

do {
  console.log('Executed once');
} while (false);

switch (typeof person) {
  case 'object':
    console.log('It\'s an object');
    break;
  case 'string':
    console.log('It\'s a string');
    break;
  default:
    console.log('Unknown type');
}

// Regular expressions
const regex = /^hello\s+world$/i;
const regexObj = new RegExp('pattern', 'g');

// Built-in objects and methods
const now = new Date();
const map = new Map([['key', 'value']]);
const set = new Set([1, 2, 3]);
const weakMap = new WeakMap();
const int32Array = new Int32Array(5);

// Promises and async/await
const promise = new Promise((resolve, reject) => {
  setTimeout(() => {
    if (Math.random() > 0.5) {
      resolve('Success!');
    } else {
      reject(new Error('Failed!'));
    }
  }, 1000);
});

promise
  .then(result => console.log(result))
  .catch(error => console.error(error))
  .finally(() => console.log('Cleanup'));

// Nullish coalescing and optional chaining
const nullish = null ?? 'default';
const chainedValue = person?.address?.street;

// Logical operators and assignments
const logicalAnd = true && 'value';
const logicalOr = false || 'fallback';
let value = 0;
value &&= 5;
value ||= 10;
value ??= 15;

// Bitwise operations
const bitwiseAnd = 5 & 3;
const bitwiseOr = 5 | 3;
const bitwiseXor = 5 ^ 3;
const leftShift = 5 << 1;
const rightShift = 5 >> 1;
const zeroFillRightShift = -5 >>> 1;

// DOM manipulation (if in browser)
if (typeof window !== 'undefined') {
  const element = document.getElementById('example');
  element?.addEventListener('click', (event) => {
    event.preventDefault();
    element.innerHTML = `Clicked at ${event.clientX}, ${event.clientY}`;
  });
}

// Exporting declarations
export let name1, name2/*, … */; // also var
export const name1 = 1, name2 = 2/*, … */; // also var, let
export function functionName() { /* … */ }
export class ClassName { /* … */ }
export function* generatorFunctionName() { /* … */ }
export const { name1, name2: bar } = o;
export const [ name1, name2 ] = array;

// Export list
export { name1, name2, name3 };
export { variable1 as name1, variable2 as name2, name3 };
export { variable1 as "string name" };
export { name1 as default, name2 };

// Default exports
export default expression;
export default function functionName() { /* … */ }
export default class ClassName { /* … */ }
export default function* generatorFunctionName() { /* … */ }
export default function () { /* … */ }
export default class { /* … */ }
export default function* () { /* … */ }

// Aggregating modules
export * from "module-name";
export * as name1 from "module-name";
export { name1, name2, name3 } from "module-name";
export { import1 as name1, import2 as name2, name3 } from "module-name";
export { default, import1 } from "module-name";
export { default as name1 } from "module-name";
```
