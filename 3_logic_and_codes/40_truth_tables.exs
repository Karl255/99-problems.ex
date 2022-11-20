# Truth tables for logical expressions

# Generalize the previous problem in such a way that the logical expression may contain any number of logical variables. Define table in a way that table variables expr returns the truth table for the expression expr, which contains the logical variables enumerated in variables.

# I extended this one with an xor operation.

# expression syntax:
# - {:var, name}
# - {:not, expression}
# - {binary_op, {expression, expression}}

defmodule Problem40 do
  def table(vars, expr) do
    # evaluate(%{a: true, b: false}, expr)
    table_permutations(vars, %{}, expr)
    |> List.flatten()
  end

  defp table_permutations([], vars, expr) do
    {vars, evaluate(vars, expr)}
  end

  defp table_permutations([next_var | next_vars], vars, expr) do
    [
      table_permutations(next_vars, Map.put(vars, next_var, false), expr),
      table_permutations(next_vars, Map.put(vars, next_var, true), expr)
    ]
  end

  defp evaluate(%{} = vars, expr) do
    case expr do
      {:var, name} ->
        vars[name]

      {:not, ex} ->
        not evaluate(vars, ex)

      {op, {ex1, ex2}} ->
        get_op_function(op).(evaluate(vars, ex1), evaluate(vars, ex2))

      _ ->
        false
    end
  end

  defp get_op_function(op) do
    case op do
      :and -> &and/2
      :or -> &or/2
      :xor -> &(&1 !== &2)
    end
  end

  # serialization for console output
  defp stringify_table(table) do
    header = stringify_table_header(table)

    body =
      table
      |> Enum.map_join(fn {vars, result} ->
        row = vars
        |> Map.values()
        |> Enum.map_join("\t", &bool_to_int/1)
        |> (&(&1 <> "\t#{bool_to_int(result)}")).()
        
        "\n" <> row
      end)
      
      header <> body
  end

  defp stringify_table_header(table) do
    header =
      table
      |> List.first()
      |> elem(0)
      |> Map.keys()
      |> Enum.join("\t")

    header <> "\tY"
  end

  defp bool_to_int(b), do: if(b, do: 1, else: 0)

  def test(vars, expr) do
    IO.puts("#{vars |> insp}, #{expr |> insp} ->")
    IO.puts(table(vars, expr) |> stringify_table)
  end
  
  defp insp(term, opts \\ [charlists: :as_lists]) do
    inspect(term, opts)
  end
end

Problem40.test([:A], {:var, :A}) # Y = A
Problem40.test([:A], {:not, {:var, :A}}) # Y = !A
Problem40.test([:A, :B], {:and, {{:var, :A}, {:var, :B}}}) # Y = A & B
Problem40.test([:A, :B, :C], {:and, {{:var, :A}, {:or, {{:not, {:var, :B}}, {:var, :C}}}}}) # Y = A & (!B | C)
Problem40.test([:A, :B], {:xor, {{:var, :A}, {:var, :B}}}) # Y = A ~ B
