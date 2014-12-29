# This file should contain all the record creation needed to seed the database with its default values.

poems_hash = {
  "Shall I Compare Thee to a Summer's Day?" => "Shall I compare thee to a summer's day?
  / Thou art more lovely and more temperate:
  / Rough winds do shake the darling buds of May,
  / And summer's lease hath all too short a date:
  / Sometime too hot the eye of heaven shines,
  / And often is his gold complexion dimm'd;
  / And every fair from fair sometime declines,
  / By chance or nature's changing course untrimm'd;
  / But thy eternal summer shall not fade
  / Nor lose possession of that fair thou owest;
  / Nor shall Death brag thou wander'st in his shade,
  / When in eternal lines to time thou growest:
  / So long as men can breathe or eyes can see,
  / So long lives this, and this gives life to thee.",
"How Many, How Much" => "How many slams in an old screen door?
  / Depends how loud you shut it.
  / How many slices in a bread?
  / Depends how thin you cut it.
  / How much good inside a day?
  / Depends how good you live ‘em.
  / How much love inside a friend?
  / Depends how much you give ‘em.",
"Invitation" => "If you are a dreamer, come in,
  / If you are a dreamer, a wisher, a liar,
  / A hope-er, a pray-er, a magic bean buyer…
  / If you’re a pretender, come sit by my fire
  / For we have some flax-golden tales to spin.
  / Come in!
  / Come in!",
"Television" => "The most important thing we've learned,
  / So far as children are concerned,
  / Is never, NEVER, NEVER let
  / Them near your television set --
  / Or better still, just don't install
  / The idiotic thing at all.
  / In almost every house we've been,
  / We've watched them gaping at the screen.
  / They loll and slop and lounge about,
  / And stare until their eyes pop out.
  / (Last week in someone's place we saw
  / A dozen eyeballs on the floor.)
  / They sit and stare and stare and sit
  / Until they're hypnotised by it,
  / Until they're absolutely drunk
  / With all that shocking ghastly junk.
  / Oh yes, we know it keeps them still,
  / They don't climb out the window sill,
  / They never fight or kick or punch,
  / They leave you free to cook the lunch
  / And wash the dishes in the sink --
  / But did you ever stop to think,
  / To wonder just exactly what
  / This does to your beloved tot?
  / IT ROTS THE SENSE IN THE HEAD!
  / IT KILLS IMAGINATION DEAD!
  / IT CLOGS AND CLUTTERS UP THE MIND!
  / IT MAKES A CHILD SO DULL AND BLIND
  / HE CAN NO LONGER UNDERSTAND
  / A FANTASY, A FAIRYLAND!
  / HIS BRAIN BECOMES AS SOFT AS CHEESE!
  / HIS POWERS OF THINKING RUST AND FREEZE!
  / HE CANNOT THINK -- HE ONLY SEES!
  / 'All right!' you'll cry. 'All right!' you'll say,
  / 'But if we take the set away,
  / What shall we do to entertain
  / Our darling children? Please explain!'
  / We'll answer this by asking you,
  / 'What used the darling ones to do?
  / 'How used they keep themselves contented
  / Before this monster was invented?'
  / Have you forgotten? Don't you know?
  / We'll say it very loud and slow:
  / THEY ... USED ... TO ... READ! They'd READ and READ,
  / AND READ and READ, and then proceed
  / To READ some more. Great Scott! Gadzooks!
  / One half their lives was reading books!
  / The nursery shelves held books galore!
  / Books cluttered up the nursery floor!
  / And in the bedroom, by the bed,
  / More books were waiting to be read!
  / Such wondrous, fine, fantastic tales
  / Of dragons, gypsies, queens, and whales
  / And treasure isles, and distant shores
  / Where smugglers rowed with muffled oars,
  / And pirates wearing purple pants,
  / And sailing ships and elephants,
  / And cannibals crouching 'round the pot,
  / Stirring away at something hot.
  / (It smells so good, what can it be?
  / Good gracious, it's Penelope.)
  / The younger ones had Beatrix Potter
  / With Mr. Tod, the dirty rotter,
  / And Squirrel Nutkin, Pigling Bland,
  / And Mrs. Tiggy-Winkle and-
  / Just How The Camel Got His Hump,
  / And How the Monkey Lost His Rump,
  / And Mr. Toad, and bless my soul,
  / There's Mr. Rat and Mr. Mole-
  / Oh, books, what books they used to know,
  / Those children living long ago!
  / So please, oh please, we beg, we pray,
  / Go throw your TV set away,
  / And in its place you can install
  / A lovely bookshelf on the wall.
  / Then fill the shelves with lots of books,
  / Ignoring all the dirty looks,
  / The screams and yells, the bites and kicks,
  / And children hitting you with sticks-
  / Fear not, because we promise you
  / That, in about a week or two
  / Of having nothing else to do,
  / They'll now begin to feel the need
  / Of having something to read.
  / And once they start -- oh boy, oh boy!
  / You watch the slowly growing joy
  / That fills their hearts. They'll grow so keen
  / They'll wonder what they'd ever seen
  / In that ridiculous machine,
  / That nauseating, foul, unclean,
  / Repulsive television screen!
  / And later, each and every kid
  / Will love you more for what you did. ",
"All That is Gold Does Not Glitter" => "All that is gold does not glitter,
  / Not all those who wander are lost;
  / The old that is strong does not wither,
  / Deep roots are not reached by the frost.
  / From the ashes a fire shall be woken,
  / A light from the shadows shall spring;
  / Renewed shall be blade that was broken,
  / The crownless again shall be king"
}


comments_array = ["Stunning!", "This is terrible.", "Such vivid imagery", "Excellent rhythm", "Rubbish -- worst thing I've ever read"]

poems_hash.each do |title, content|
  current_poem = Poem.create(:title => title, :content => content)
  3.times do
    current_poem.comments.create(:content => comments_array.sample)
  end
end

