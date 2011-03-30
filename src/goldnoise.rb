# ask how many songs to play
dialog = `CocoaDialog.app/Contents/MacOS/CocoaDialog dropdown --title "Gold Noise Generator" --text "How many songs to play at once?" --items "10" "20" "40" "100" "200" "Everything" --button1 "Play"`
result = dialog.split("\n")[1].to_i

# get all music files on the machine
puts "Searching for music files..."
files = `mdfind kMDItemContentType=public.mp3 || kMDItemContentType=public.mpeg-4-audio`
files = files.split("\n")
files.shuffle!
total = files.length
puts "Found #{total} files."
puts ""

# play them
if result == 5
  # everything
  count = 0
  files.each do |file|
    puts "(#{count += 1}/#{total}) #{file}"
    system "afplay -v 0.1 \"#{file}\" &"
    sleep 1
  end
else
  howmany = 0
  volume = "0.1"
  
  if result == 0
    howmany = 10
    volume = "0.3"
  elsif result == 1
    howmany = 20
    volume = "0.2"
  elsif result == 2
    howmany = 40
  elsif result == 3
    howmany = 100
  elsif result == 4
    howmany = 200
  end
  
  howmany = [howmany, total].min
  
  (0..howmany-1).each do |i|
    file = files[i]
    puts "(#{i+1}/#{howmany}) #{file}"
    system "afplay -v #{volume} \"#{file}\" &"
  end
  
end

# keep the app window open/cancelable
sleep 3000