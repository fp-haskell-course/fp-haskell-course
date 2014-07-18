
import System.Environment

import qualified Data.ByteString.Lazy as LBS

main :: IO ()
main = do
    args <- getArgs
    case args of
        [infile, outfile] -> copyFile infile outfile
        _ -> putStrLn "Usage message here"

copyFile :: FilePath -> FilePath -> IO ()
copyFile infile outfile = do
    text <- LBS.readFile infile
    LBS.writeFile outfile text
