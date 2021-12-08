part1 :: [Int] -> Int
part1 xs = length . filter (== True) $ zipWith (<) xs (tail xs)

part2 :: [Int] -> [Int]
part2 xs = zipWith3 (\x y z -> x + y + z) xs (tail xs) (tail $ tail xs)

main :: IO ()
main = interact $ show . part1 . part2 . (map read . lines)