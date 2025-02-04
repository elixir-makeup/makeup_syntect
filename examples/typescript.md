## TypeScript Code Example

```typescript
// Basic Types and Type Annotations
let isDone: boolean = false;
let decimal: number = 6;
let color: string = "blue";
let list: number[] = [1, 2, 3];
let tuple: [string, number] = ["hello", 10];

// Enum
enum Direction {
    Up = "UP",
    Down = "DOWN",
    Left = "LEFT",
    Right = "RIGHT"
}

// Interface
interface User {
    readonly id: number;
    name: string;
    age?: number;  // Optional property
    [key: string]: any;  // Index signature
}

// Generic Interface
interface Response<T> {
    data: T;
    status: number;
}

// Class with implements and extends
abstract class Animal {
    protected name: string;

    constructor(name: string) {
        this.name = name;
    }

    abstract makeSound(): void;
}

// Interface for class implementation
interface Pet {
    play(): void;
}

class Dog extends Animal implements Pet {
    private breed: string;

    constructor(name: string, breed: string) {
        super(name);
        this.breed = breed;
    }

    makeSound(): void {
        console.log("Woof!");
    }

    play(): void {
        console.log(`${this.name} is playing!`);
    }
}

// Union Types
type StringOrNumber = string | number;
let flexible: StringOrNumber = "hello";
flexible = 42;

// Intersection Types
type Employee = User & { employeeId: number };

// Utility Types
type Readonly<T> = {
    readonly [P in keyof T]: T[P];
}

// Type Guards
function isString(value: any): value is string {
    return typeof value === "string";
}

// Generics
function identity<T>(arg: T): T {
    return arg;
}

// Generic Constraints
interface Lengthwise {
    length: number;
}

function loggingIdentity<T extends Lengthwise>(arg: T): T {
    console.log(arg.length);
    return arg;
}

// Mapped Types
type Optional<T> = {
    [P in keyof T]?: T[P];
}

// Conditional Types
type NonNullable<T> = T extends null | undefined ? never : T;

// Template Literal Types
type EventName = `on${string}`;
type Size = 'small' | 'medium' | 'large';
type Color = 'red' | 'blue' | 'green';
type StyleVariant = `${Size}-${Color}`;

// Decorators
function log(target: any, propertyKey: string) {
    console.log(`${propertyKey} accessed`);
}

// Async/Await with TypeScript
async function fetchData<T>(url: string): Promise<T> {
    const response = await fetch(url);
    return response.json();
}

// Type Assertions
let someValue: unknown = "this is a string";
let strLength: number = (someValue as string).length;

// Literal Types
type DiceRoll = 1 | 2 | 3 | 4 | 5 | 6;
let diceResult: DiceRoll = 1;

// Function Overloads
function process(x: number): number;
function process(x: string): string;
function process(x: number | string): number | string {
    return x;
}

// Namespace
namespace Validation {
    export interface StringValidator {
        isValid(s: string): boolean;
    }
}

// Example Usage
const user: User = {
    id: 1,
    name: "John",
    customField: "value"
};

const dog = new Dog("Rex", "Golden Retriever");
const numberIdentity = identity<number>(42);
const response: Response<string> = {
    data: "Success",
    status: 200
};

// Type Inference
let inferredArray = [1, 2, 3]; // Type is number[]
let inferredObject = { x: 10, y: 20 }; // Type is { x: number, y: number }

// Readonly Arrays
const readonlyNumbers: ReadonlyArray<number> = [1, 2, 3];

// Index Types
function getProperty<T, K extends keyof T>(obj: T, key: K): T[K] {
    return obj[key];
}
```