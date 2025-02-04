## Python Code Example

```python
# This is a comprehensive Python syntax demo
from typing import List, Dict, Optional, Union, Callable
from dataclasses import dataclass
from enum import Enum
import asyncio
from contextlib import contextmanager

# Enums
class Color(Enum):
    RED = 1
    GREEN = 2
    BLUE = 3

# Dataclass
@dataclass
class Point:
    x: float
    y: float

    def __add__(self, other):
        return Point(self.x + other.x, self.y + other.y)

# Type hints and function annotations
def calculate_average(numbers: List[float]) -> float:
    """
    Docstring: Calculate average of numbers
    Args:
        numbers: List of numbers
    Returns:
        Average value
    """
    return sum(numbers) / len(numbers)

# Lambda functions
square = lambda x: x ** 2

# List comprehension
squares = [x**2 for x in range(10)]

# Dictionary comprehension
square_dict = {x: x**2 for x in range(5)}

# Set comprehension
even_squares = {x**2 for x in range(10) if x % 2 == 0}

# Generator expression
gen = (x**2 for x in range(10))

# Context manager
@contextmanager
def managed_resource():
    print("Entering context")
    try:
        yield "resource"
    finally:
        print("Exiting context")

# Decorator
def timer(func):
    def wrapper(*args, **kwargs):
        from time import time
        start = time()
        result = func(*args, **kwargs)
        print(f"Function {func.__name__} took {time() - start:.2f} seconds")
        return result
    return wrapper

# Class inheritance and magic methods
class Shape:
    def __init__(self, name: str):
        self.name = name

    @property
    def description(self) -> str:
        return f"I am a {self.name}"

class Circle(Shape):
    def __init__(self, radius: float):
        super().__init__("circle")
        self.radius = radius

    def __str__(self) -> str:
        return f"Circle(radius={self.radius})"

# Async/await syntax
async def async_function():
    await asyncio.sleep(1)
    return "async result"

# Error handling
def divide(a: float, b: float) -> float:
    try:
        return a / b
    except ZeroDivisionError:
        raise ValueError("Cannot divide by zero")
    finally:
        print("Division attempted")

# Match statement (Python 3.10+)
def match_example(value):
    match value:
        case str():
            return "It's a string"
        case int() | float():
            return "It's a number"
        case list():
            return "It's a list"
        case _:
            return "Unknown type"

# Type Union and Optional
def process_data(data: Union[str, int], default: Optional[str] = None) -> str:
    if isinstance(data, int):
        return str(data)
    return data or default or ""

# Main execution
if __name__ == "__main__":
    # Dictionary unpacking
    dict1 = {"a": 1, "b": 2}
    dict2 = {"c": 3, **dict1}

    # List unpacking
    numbers = [1, 2, 3]
    first, *rest = numbers

    # Using context manager
    with managed_resource() as resource:
        print(f"Using {resource}")

    # Async execution
    async def main():
        result = await async_function()
        print(result)

    asyncio.run(main())

    # Demonstrating type hints
    point1 = Point(1.0, 2.0)
    point2 = Point(3.0, 4.0)
    point3 = point1 + point2

    # Using match statement
    print(match_example("test"))
    print(match_example(42))

    # Using walrus operator (Python 3.8+)
    if (n := len(numbers)) > 2:
        print(f"List has {n} items")
```