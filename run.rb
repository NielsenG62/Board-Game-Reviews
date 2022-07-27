require_relative('app/models/unfiltered_review')

p "Board Game Review Condenser:"
p 'Please enter the game you would like to search for'
input = (gets.chomp).split(' ').join("+")

print <<-'EOF'
    ,-.       _,---._ __  / \
   /  )    .-'       `./ /   \
  (  (   ,'            `/    /|
   \  `-"             \'\   / |
    `.              ,  \ \ /  |
     /`.          ,'-`----Y   |
    (            ;        |   '
    |  ,-.    ,-'         |  /
    |  | (   |            | /
    )  |  \  `.___________|/
    `--'   `--'
  Fetching your data
  EOF

begin
  AltReview.filter_comments(input)
  p "Finished! The data is now stored in data.csv"
rescue NoMethodError
  p "No game matches that name on Boardgamegeek.com"
  p "Remember the name has to match EXACTLY"
end




# To run file: bin/rails runner run.rb