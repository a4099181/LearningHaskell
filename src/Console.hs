module Main where

import           Data.LightSwitch (LightSwitch, getDefaultLightSwitch, switch)
import           Control.Monad.State (execState)

main :: IO ()
main = do
  welcome
  controlLightSwitch getDefaultLightSwitch

controlLightSwitch :: LightSwitch -> IO ()
controlLightSwitch lightSwitch = do
  putStrLn $ "Current light switch: " ++ show lightSwitch
  control <- getLine
  case control of
    's':[] -> controlLightSwitch $ execState switch lightSwitch
    'q':[] -> bye
    _      -> controlLightSwitch lightSwitch

welcome :: IO ()
welcome = putStrLn "Commands: (s) to switch the light switch, (q) to quit."

bye :: IO ()
bye = putStrLn "Bye!"
