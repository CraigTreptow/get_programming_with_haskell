module Flipper where

-- You want to make a function called flipBinaryArgs that will take a function,
-- flip the order of its arguments, and then return it otherwise untouched.

flipBinaryArgs binaryFunction = (\x y -> binaryFunction y x)

-- the above is a provided function called flip

-- 5.4 Q1
-- removes 2 from whatever number is passed to it
subtract2 = flip (-) 2

-- partial application here.  So this is waiting for an argument, like 4
-- subtract2 = flip (-) 2 4
-- subtract2 = 4 - 2
-- subtract2 = 2

-- Q5.2
binaryPartialApplication f a = (\b -> f a b)
