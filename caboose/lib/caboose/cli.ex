defmodule Caboose.CLI do
  def main(args) do
    {parsed, args, invalid} =
      OptionParser.parse(args,
        switches: [lines: :integer, help: nil],
        aliases: [h: :help, n: :lines]
      )

    Caboose.start(parsed, args, invalid)
  end
end
