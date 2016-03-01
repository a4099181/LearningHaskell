module Main where

import           Data.Domain (Domain, getDefaultDomain, invokeCommand)
import           Data.Domain.Command (Command, getCommand)
import           Data.Domain.Event (Event(Finished))

main :: IO ()
main = do
  putStrLn "Commands: (s) to switch the light switch, (q) to quit."
  loop getDefaultDomain

loop :: Domain -> IO ()
loop domain = do
  maybeCommand <- getInput
  case maybeCommand of
    Nothing -> loop domain
    Just command -> do
      (d, event) <- getOutput domain command
      case event of
        Finished -> putStrLn "Bye!"
        _ -> do
          putStrLn $ "Current state: " ++ show domain
          loop d

getInput :: IO (Maybe Command)
getInput = do
  input <- getChar
  return . getCommand $ input

getOutput :: Domain -> Command -> IO (Domain, Event)
getOutput domain command = do
  x <- invokeCommand domain command
  return x
