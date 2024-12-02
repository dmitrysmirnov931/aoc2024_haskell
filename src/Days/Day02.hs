module Days.Day02 (runDay) where

runDay :: IO ()
runDay = do
  task1 "input/Day02.txt"

isSafeIncreasing :: [Int] -> Bool
isSafeIncreasing [] = True
isSafeIncreasing [_] = True
isSafeIncreasing (x:y:xs) =
    y > x &&
    (y - x) `elem` [1, 2, 3]
    && isSafeIncreasing (y:xs)

isSafeDecreasing :: [Int] -> Bool
isSafeDecreasing [] = True
isSafeDecreasing [_] = True
isSafeDecreasing (x:y:xs) =
    x > y &&
    (x - y) `elem` [1, 2, 3]
    && isSafeDecreasing (y:xs)

isSafe :: [Int] -> Bool
isSafe line = isSafeIncreasing line || isSafeDecreasing line

task1 :: FilePath -> IO()
task1 filePath = do
  contents <- readFile filePath
  let reports = map (map read . words) $ lines contents
      safeReports = filter isSafe reports
      result = length safeReports
  print result
  