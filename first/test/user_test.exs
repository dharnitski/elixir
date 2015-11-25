# from http://elixir-lang.org/getting-started/structs.html
defmodule TestUser do
  use ExUnit.Case
  doctest User

  test "load struct default values" do
    assert %User{} == %User{age: 27, name: "John"}
  end

  test "override struct default values" do
    assert %User{name: "Meg"} == %User{age: 27, name: "Meg"}
  end

  #test "compile error for using differnt field name" do
  #  assert %User{oops: :field}
  #end

  test "accessing and updateing structs" do
    john = %User{}
    assert john.name == "John"

    meg = %{john | name: "Meg"}
    assert meg.name == "Meg"

    assert_raise KeyError, fn ->
      %{meg | oops: :field}
    end
  end

  test "structs pattern matching" do
    john = %User{}
    %User{name: name} = john
    assert name == "John"

    assert_raise MatchError, fn ->
      %User{} = %{}
    end
  end

  test "structs are just bare maps underneath" do
    john = %User{}

    assert is_map(john) == true

    assert john.__struct__ == User

    #map protocols are not implemented for struct
    assert_raise UndefinedFunctionError, fn ->
      john[:name]
    end

    assert_raise Protocol.UndefinedError, fn ->
      Enum.each john, fn({field, value}) -> IO.puts({field, value}) end
    end

    #A struct also is not a dictionary
    assert_raise UndefinedFunctionError, fn ->
      Dict.get(%User{}, :name)
    end

  end

  test "structs work with the functions from the Map module" do
    kurt = Map.put(%User{}, :name, "Kurt")

    assert Map.merge(kurt, %User{name: "Takashi"}) == %User{age: 27, name: "Takashi"}

    assert Map.keys(kurt) == [:__struct__, :age, :name]
  end

  test "a struct also is not a dictionary" do
    assert_raise UndefinedFunctionError, fn ->
      Dict.get(%User{}, :name)
    end
  end


end
