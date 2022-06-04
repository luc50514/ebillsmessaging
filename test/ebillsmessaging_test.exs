defmodule EbillsmessagingTest do
  use ExUnit.Case
  doctest Ebillsmessaging

  test "greets the world" do
    assert Ebillsmessaging.hello() == :world
  end
  test "recieves pid when start link is started" do
    {:ok, pid} = Ebillsmessaging.start_link()
    assert pid != nil
  end
  test "recieves message when put is sent" do
    {:ok, pid} = Ebillsmessaging.start_link()
    Process.register(pid, :ebills)
    send(:ebills, {:put, :hello, :world})
    send(:ebills, {:get, :hello, self()})
    assert_receive :world
  end

end
