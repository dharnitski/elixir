# from http://elixir-lang.org/getting-started/processes.html
defmodule TestKV do
  use ExUnit.Case
  doctest KV

  test "receive" do
    send self(), {:hello, "world"}
    #{:hello, "world"}
    receive do
      {:hello, msg} -> msg
    after
      0_000 -> assert false, ":hello should be received"
    end
  end

  test "receive atom" do
    send self(), {:hello}
    #{:hello, "world"}
    receive do
      {:hello} -> "success"
    after
      0_000 -> assert false, ":hello should be received"
    end
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

    receive do
      :world -> "Got data from persistent storage"
    after
      #set to 0_000 for false negative test
      0_100 -> assert false, ":world should be in main process mainbox"
    end
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
