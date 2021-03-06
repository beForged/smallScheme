module Compile_file where
import Compile
import Asm.Printer
import System.IO
import System.Environment
import System.FilePath.Posix

--input file, output file name
compileFile :: FilePath -> FilePath -> IO ()
compileFile input output = do
    contents <- readFile input
--dont forget to make a either for parse errors
    writeFile output (asmDisplay (compile (readExpr contents)))

entry = do
    (fst:snd)<- getArgs
    --need better than this for sure lol
    _  <- compileFile fst (head snd)
    putStrLn "finished"

parseFile :: FilePath -> IO ()
parseFile input = do
    contents <- readFile input
    writeFile (replaceExtension input "par") (show (readExpr contents))


