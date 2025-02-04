## Elixir Code Example

```elixir
defmodule SyntaxDemo do
  @moduledoc """
  A demonstration module showcasing various Elixir syntax features.
  """

  # Module attribute definition
  @greeting "Hello"
  @constant_value 42

  # Type specifications
  @type coordinates :: {number, number}
  @type user :: %{name: String.t(), age: non_neg_integer()}

  # Struct definition
  defstruct name: "", age: 0, roles: []

  # Guard clause definition
  defguard is_valid_age?(age) when is_integer(age) and age >= 0

  # Function with pattern matching and guards
  def process_age(age) when is_valid_age?(age) do
    case age do
      0 -> "Newborn"
      age when age < 13 -> "Child"
      age when age < 20 -> "Teenager"
      _ -> "Adult"
    end
  end

  # Function with default parameters
  def greet(name, greeting \\ @greeting) do
    "#{greeting}, #{name}!"
  end

  # Private function
  defp double(x), do: x * 2

  # List comprehension and pattern matching
  def process_pairs(list) do
    for {a, b} <- list,
        a > 0,
        do: {a, double(b)}
  end

  # Pipeline operator example
  def transform_string(input) do
    input
    |> String.trim()
    |> String.upcase()
    |> String.split()
    |> Enum.join("-")
  end

  # Pattern matching in function heads
  def handle_result({:ok, value}), do: "Success: #{value}"
  def handle_result({:error, reason}), do: "Error: #{reason}"

  # Working with maps
  def update_user(user = %{name: name}) do
    %{user | name: String.upcase(name)}
  end

  # Using with for complex pattern matching
  def process_data(data) do
    with {:ok, number} <- parse_number(data),
         doubled when doubled < 100 <- double(number) do
      {:ok, doubled}
    else
      {:error, reason} -> {:error, reason}
      _ -> {:error, "Number too large"}
    end
  end

  # Private helper function
  defp parse_number(str) when is_binary(str) do
    case Integer.parse(str) do
      {num, ""} -> {:ok, num}
      _ -> {:error, "Invalid number"}
    end
  end

  # Anonymous functions
  def get_math_functions do
    add = &(&1 + &2)
    multiply = fn x, y -> x * y end

    [add, multiply]
  end

  # Using protocols
  defimpl String.Chars, for: SyntaxDemo do
    def to_string(%SyntaxDemo{name: name}) do
      "SyntaxDemo: #{name}"
    end
  end

  # Macro usage example
  require Logger
  def log_info(message) do
    Logger.info("#{@greeting}: #{message}")
  end

  # Using try-rescue
  def safe_divide(a, b) do
    try do
      a / b
    rescue
      ArithmeticError -> {:error, "Division by zero"}
    else
      result -> {:ok, result}
    end
  end

  # Comprehension with multiple generators
  def matrix_combination do
    for x <- 1..3,
        y <- 1..3,
        x != y,
        do: {x, y}
  end

  # Pattern matching with bitstrings
  def extract_bytes(<<first_byte::8, rest::binary>>) do
    {first_byte, rest}
  end

  # Using receive for processes
  def start_process do
    spawn(fn -> process_loop() end)
  end

  defp process_loop do
    receive do
      {:message, content} -> 
        IO.puts("Received: #{content}")
        process_loop()
      :stop -> 
        :ok
    end
  end
end

# Example usage of protocols
defprotocol Drawable do
  @doc "Defines how to draw an entity"
  def draw(entity)
end

# Example of using behaviors
defmodule CustomServer do
  @behaviour GenServer

  def init(args), do: {:ok, args}
  def handle_call(_msg, _from, state), do: {:reply, :ok, state}
  def handle_cast(_msg, state), do: {:noreply, state}
end
```