module Main where

import Lib
import Data.Text as T
import Data.Text.IO as TIO

main ::IO ()
main = do
  TIO.putStrLn "Enter a wod and I'll let you know if it's a palindome!"
  text <- TIO.getLine
  let response = if isPalindrome text
                 then "it is!"
                 else "it's not!"
  TIO.putStrLn response

