defmodule TheGreeter do
  @author "Bryan"

  def greet do
    name = IO.gets("What's your name?\n") |> String.trim()

    if name == @author do
      "Wow! #{@author} is my favorite name. I was programmed by someone named #{@author}!"
    else
      "Nice to meet you #{name}!"
    end
  end
end
