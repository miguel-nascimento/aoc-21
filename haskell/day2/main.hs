type Unit = Int

data Moves = Forward Unit | Down Unit | Up Unit
  deriving (Show)

type Position = (Unit, Unit)

type Aim = Unit

type Input = [String]

tuplify :: [a] -> (a, a)
tuplify [x, y] = (x, y)
tuplify _ = error "tuplify: need exact two elements"

move :: Position -> [Moves] -> Position
move p [] = p
move (x, y) (m : ms) = case m of
  Forward n -> move (x + n, y) ms
  Down n -> move (x, y + n) ms
  Up n -> move (x, y - n) ms

moveWithAim :: Position -> Aim -> [Moves] -> Position
moveWithAim p _ [] = p
moveWithAim (x, y) a (m : ms) = case m of
  Forward n -> moveWithAim (x + n, y + (n * a)) a ms
  Down n -> moveWithAim (x, y) (a + n) ms
  Up n -> moveWithAim (x, y) (a - n) ms

getMoves :: Input -> [Moves]
getMoves = map (f . tuplify . words)
  where
    f ("forward", n) = Forward (read n)
    f ("down", n) = Down (read n)
    f ("up", n) = Up (read n)
    f _ = error "unreachable"

part1 :: [Moves] -> IO ()
part1 moves = print $ uncurry (*) $ move (0, 0) moves

part2 :: [Moves] -> IO ()
part2 moves = print $ uncurry (*) $ moveWithAim (0, 0) 0 moves

main :: IO ()
main = do
  input <- getContents
  let moves = getMoves $ lines input
  part1 moves
  part2 moves