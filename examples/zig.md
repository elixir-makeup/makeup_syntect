## Zig Code Example

```zig
// Single line comment
/// Doc comment for documentation generation

// Import standard library
const std = @import("std");

// Declare constants
const MY_CONSTANT: i32 = 42;
const PI = 3.14159;

// Declare an enum
const Direction = enum {
    north,
    south,
    east,
    west,

    // Enum with method
    pub fn isVertical(self: Direction) bool {
        return self == .north or self == .south;
    }
};

// Define a struct
const Person = struct {
    name: []const u8,
    age: u8,
    height: f32,

    // Method definition
    pub fn introduce(self: Person) void {
        std.debug.print("Hi, I'm {s}, {d} years old\n", .{
            self.name,
            self.age,
        });
    }
};

// Error set definition
const MathError = error{
    DivisionByZero,
    Overflow,
};

// Union type
const Value = union(enum) {
    integer: i64,
    float: f64,
    boolean: bool,
};

// Main function
pub fn main() !void {
    // Variables
    var mutable_var: i32 = 100;
    const immutable_var = @as(i32, 200);

    // Array
    var array = [_]i32{ 1, 2, 3, 4, 5 };

    // Slice
    const slice = array[1..3];

    // String literal
    const greeting = "Hello, Zig!";

    // Optional type
    var optional_value: ?i32 = null;
    optional_value = 42;

    // Error union type
    var result: MathError!i32 = undefined;

    // If statement
    if (mutable_var > 50) {
        std.debug.print("Greater than 50\n", .{});
    } else {
        std.debug.print("Less than or equal to 50\n", .{});
    }

    // Switch statement
    const direction = Direction.north;
    switch (direction) {
        .north => std.debug.print("Going north\n", .{}),
        .south => std.debug.print("Going south\n", .{}),
        else => std.debug.print("Going east or west\n", .{}),
    }

    // While loop
    var i: usize = 0;
    while (i < 5) : (i += 1) {
        if (i == 2) continue;
        if (i == 4) break;
        std.debug.print("{d}\n", .{i});
    }

    // For loop
    for (array, 0..) |value, index| {
        std.debug.print("Index: {d}, Value: {d}\n", .{ index, value });
    }

    // Error handling
    result = divide(10, 2) catch |err| {
        std.debug.print("Error: {}\n", .{err});
        return err;
    };

    // Defer statement
    {
        const file = std.fs.cwd().createFile(
            "test.txt",
            .{ .read = true },
        ) catch |err| {
            std.debug.print("Could not create file: {}\n", .{err});
            return;
        };
        defer file.close();
    }

    // Allocator example
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // Dynamic array (ArrayList)
    var list = std.ArrayList(i32).init(allocator);
    defer list.deinit();
    try list.append(42);

    // Comptime
    const compiled_value = comptime blk: {
        var x: i32 = 1;
        x += 2;
        break :blk x;
    };

    // Testing
    if (std.builtin.is_test) {
        try std.testing.expect(compiled_value == 3);
    }
}

// Function with error handling
fn divide(a: i32, b: i32) MathError!i32 {
    if (b == 0) return MathError.DivisionByZero;
    return a / b;
}

// Test function
test "basic test" {
    try std.testing.expect(MY_CONSTANT == 42);
}
```
