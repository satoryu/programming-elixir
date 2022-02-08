content = "Now is the time"

# NOTE: this with block raises NoMatchError
# if the passwd does not have a line matches with the regexp in this with.
lp = with {:ok, file} = File.open("/etc/passwd"),
          content = IO.read(file, :all),
          :ok = File.close(file),
          [_, uid, gid] = Regex.run(~r/^lp:.*?:(\d):(\d+)/m, content)
    do
      "Group: #{gid}, User: #{uid}"
    end

IO.puts lp
IO.puts content
