module Examples where

import Data.Semigroup

-- You can think of <> as an operator for combining instances of the same type.
instance Semigroup Integer where
  (<>) x y = x + y

data Color = Red | Yellow | Blue | Green | Purple | Orange | Brown deriving (Show,Eq)

-- instance Semigroup Color where
--   (<>) Red Blue = Purple
--   (<>) Blue Red = Purple
--   (<>) Yellow Blue = Green
--   (<>) Blue Yellow = Green
--   (<>) Yellow Red = Orange
--   (<>) Red Yellow = Orange
--   (<>) a b = if a == b
--              then a
--              else Brown

-- using guards to implement type class laws that the compiler can't enforce
instance Semigroup Color where
  (<>) Red Blue = Purple
  (<>) Blue Red = Purple
  (<>) Yellow Blue = Green
  (<>) Blue Yellow = Green
  (<>) Yellow Red = Orange
  (<>) Red Yellow = Orange
  (<>) a b | a == b = a
           | all (`elem` [Red,Blue,Purple]) [a,b] = Purple
           | all (`elem` [Blue,Yellow,Green]) [a,b] = Green
           | all (`elem` [Red,Yellow,Orange]) [a,b] = Orange
           | otherwise = Brown

-- now color associativity works
-- 
-- GHCi> (Green <> Blue) <> Yellow
-- Green
-- GHCi> Green <> (Blue <> Yellow)
-- Green

