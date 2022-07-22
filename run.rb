require_relative('app/models/unfiltered_review')

p 'Board Game Review Condenser:'
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

UnfilteredReview.filter_comments(input)

p "Finished! The data is now stored in data.csv"


# To run file: bin/rails runner run.rb