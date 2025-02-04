## Java Code Example

```java
// Package declaration
package com.example.demo;

// Import statements
import java.util.*;
import java.util.stream.Collectors;
import java.util.concurrent.CompletableFuture;
import java.io.Serializable;

// Annotation example
@FunctionalInterface
interface Calculator {
    int calculate(int x, int y);
}

// Main class demonstration
public class JavaSyntaxDemo<T> implements Serializable {
    // Static and final variables
    private static final long serialVersionUID = 1L;
    public static final double PI = 3.14159;

    // Instance variables with different access modifiers
    private String privateField;
    protected int protectedField;
    public boolean publicField;

    // Generic type field
    private T genericField;

    // Enum declaration
    public enum Status {
        ACTIVE, INACTIVE, PENDING
    }

    // Static nested class
    static class NestedClass {
        void nestedMethod() {
            System.out.println("Inside nested class");
        }
    }

    // Constructor
    public JavaSyntaxDemo(T genericField) {
        this.genericField = genericField;
    }

    // Method with varargs
    public static <E> void printAll(E... elements) {
        for (E element : elements) {
            System.out.println(element);
        }
    }

    // Generic method
    public <U> void genericMethod(U parameter) {
        System.out.println("Generic parameter: " + parameter);
    }

    // Method demonstrating exception handling
    public void exceptionDemo() throws IllegalArgumentException {
        try {
            throw new IllegalArgumentException("Demo exception");
        } catch (Exception e) {
            System.err.println("Caught exception: " + e.getMessage());
        } finally {
            System.out.println("Finally block executed");
        }
    }

    // Lambda expression and Stream API demonstration
    public void streamDemo() {
        List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5);

        // Stream operations
        List<Integer> doubled = numbers.stream()
            .filter(n -> n % 2 == 0)
            .map(n -> n * 2)
            .collect(Collectors.toList());
    }

    // Async programming with CompletableFuture
    public CompletableFuture<String> asyncDemo() {
        return CompletableFuture.supplyAsync(() -> "Async result");
    }

    // Method with synchronized block
    public synchronized void synchronizedMethod() {
        synchronized(this) {
            System.out.println("Thread-safe operation");
        }
    }

    // Main method
    public static void main(String[] args) {
        // Object creation
        JavaSyntaxDemo<String> demo = new JavaSyntaxDemo<>("Hello");

        // Array declaration and initialization
        int[] array = new int[]{1, 2, 3};

        // Enhanced for loop
        for (int item : array) {
            System.out.println(item);
        }

        // Lambda expression
        Calculator add = (x, y) -> x + y;

        // Switch expression (Java 14+)
        Status status = Status.ACTIVE;
        String message = switch (status) {
            case ACTIVE -> "Active status";
            case INACTIVE -> "Inactive status";
            case PENDING -> "Pending status";
        };

        // Try-with-resources
        try (Scanner scanner = new Scanner(System.in)) {
            System.out.println("Enter something:");
            String input = scanner.nextLine();
        }

        // Record declaration (Java 16+)
        record Point(int x, int y) {}
        Point point = new Point(10, 20);

        // Text block (Java 15+)
        String textBlock = """
            This is a text block.
            It can span multiple lines
            with proper indentation.
            """;
    }
}
```