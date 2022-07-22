require_relative('app/models/unfiltered_review')

p 'Board Game Review Condenser:'
p 'Please enter the game you would like to search for'
input = (gets.chomp).split(' ').join("+")




puts <<~HEREDOC
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
  HEREDOC

Review.filter_comments(input)

p "Finished!"