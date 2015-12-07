# from http://elixir-lang.org/getting-started/processes.html
defmodule TestKV do
  use ExUnit.Case
  doctest KV

  test "receive" do
    send self(), {:hello, "world"}
    #{:hello, "world"}

    assert_received {:hello, "world"}
  end

  test "receive atom" do
    send self(), {:hello}
    #{:hello, "world"}

    assert_received {:hello}
  end

  test "stores key-values" do
    #self() evaluetaed at run time and will return current process
    parent = self()
    {:ok, pid} = KV.start_link
    send pid, {:put, :hello, :world}
    #PID<0.62.0>
    send pid, {:get, :hello, parent}
    #{:get, :hello, #PID<0.41.0>}

    assert Map.get(Map.put(%{}, :hello, :world), :hello) == :world

    #works
    #Task.start_link(fn -> send parent, :world end)

    #works
    #send self(), :world

    #works
    #spawn fn -> send(parent, :world) end

    assert_receive :world
  end

  test "store key-values using Agent" do
    {:ok, pid} = Agent.start_link(fn -> %{} end)
    #{:ok, #PID<0.72.0>}
    Agent.update(pid, fn map -> Map.put(map, :hello, :world) end)
    #:ok
    actual = Agent.get(pid, fn map -> Map.get(map, :hello) end)

    assert actual == :world
  end

end
