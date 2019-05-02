module Main where

import Language.LoopGotoWhile.Shared.Util
import Language.LoopGotoWhile.While.Extended (parse, eval)

main = do
    s <- readFile "Pfad zum Ordner/test.txt"
    putStrLn("")
    putStrLn("Output x0: " ++ show(runProgram' [0] s))

runProgram' :: [Integer] -> String -> Integer
runProgram' = flip $ mkStdRunner' parse eval